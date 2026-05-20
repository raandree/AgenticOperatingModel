#!/usr/bin/env node
// Agentic Operating Model - Demo MCP Server
// Two tool families:
//   notes.*  -> persistence the LLM does not have
//   system.* -> reach into the host the LLM does not have
// Transport: stdio. No auth, no network.
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';
import { spawn } from 'node:child_process';
import { mkdirSync, readFileSync, writeFileSync, existsSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { homedir, platform } from 'node:os';

// ---------- demo logging ----------
// stdio transport reserves stdout for JSON-RPC; all human-readable output
// MUST go to stderr so the host (VS Code, Claude Desktop, ...) shows it
// in the MCP server output panel without breaking the protocol.
const VERBOSE = process.env.AGENTIC_DEMO_VERBOSE !== '0';
const USE_COLOR = process.env.AGENTIC_DEMO_NO_COLOR !== '1' && process.stderr.isTTY !== false;
const C = USE_COLOR
  ? { dim: '\x1b[2m', reset: '\x1b[0m', cyan: '\x1b[36m', green: '\x1b[32m',
      yellow: '\x1b[33m', red: '\x1b[31m', magenta: '\x1b[35m', bold: '\x1b[1m' }
  : { dim: '', reset: '', cyan: '', green: '', yellow: '', red: '', magenta: '', bold: '' };

function ts() { return new Date().toISOString().slice(11, 23); }
function log(level, msg) {
  if (!VERBOSE && level === 'debug') return;
  const tag = {
    info:  `${C.cyan}INFO ${C.reset}`,
    ok:    `${C.green}OK   ${C.reset}`,
    warn:  `${C.yellow}WARN ${C.reset}`,
    err:   `${C.red}ERR  ${C.reset}`,
    debug: `${C.magenta}DEBUG${C.reset}`,
    step:  `${C.dim}STEP ${C.reset}`,
  }[level] || level;
  process.stderr.write(`${C.dim}${ts()}${C.reset} ${tag} ${msg}\n`);
}

let callSeq = 0;
function summarize(v, max = 120) {
  let s;
  try { s = typeof v === 'string' ? v : JSON.stringify(v); } catch { s = String(v); }
  s = s.replace(/\s+/g, ' ');
  return s.length > max ? s.slice(0, max) + '…' : s;
}

// Wrap a tool handler with entry/exit/error logging, duration, and optional
// progress notifications. `steps` lets the caller emit demo-friendly progress
// to the host while the tool runs.
function traced(name, handler) {
  return async (args, extra) => {
    const id = ++callSeq;
    const start = Date.now();
    log('info', `${C.bold}→ ${name}${C.reset} #${id} args=${summarize(args)}`);

    const progressToken = extra?._meta?.progressToken;
    const send = extra?.sendNotification;
    let stepIdx = 0;
    const totalStepsHint = handler.length >= 2 ? undefined : undefined; // unknown up front
    const ctx = {
      log: (m) => log('step', `  #${id} ${name}: ${m}`),
      progress: async (message, total) => {
        stepIdx += 1;
        log('step', `  #${id} ${name} [${stepIdx}${total ? '/' + total : ''}] ${message}`);
        if (progressToken && send) {
          try {
            await send({
              method: 'notifications/progress',
              params: { progressToken, progress: stepIdx, total, message },
            });
          } catch (e) {
            log('warn', `  #${id} progress notify failed: ${e.message}`);
          }
        }
      },
    };

    try {
      const result = await handler(args, ctx, extra);
      const ms = Date.now() - start;
      log('ok', `← ${name} #${id} ${C.dim}(${ms} ms)${C.reset}`);
      return result;
    } catch (e) {
      const ms = Date.now() - start;
      log('err', `✗ ${name} #${id} after ${ms} ms: ${e.message}`);
      throw e;
    }
  };
}

// ---------- notes store ----------
const STORE_DIR  = process.env.AGENTIC_DEMO_DIR
  || join(process.env.LOCALAPPDATA || join(homedir(), '.local', 'share'), 'AgenticDemoMcp');
const STORE_FILE = join(STORE_DIR, 'notes.json');

function loadNotes() {
  if (!existsSync(STORE_FILE)) return [];
  try { return JSON.parse(readFileSync(STORE_FILE, 'utf8')); }
  catch { return []; }
}
function saveNotes(notes) {
  mkdirSync(dirname(STORE_FILE), { recursive: true });
  writeFileSync(STORE_FILE, JSON.stringify(notes, null, 2), 'utf8');
}

// ---------- powershell helper ----------
function runPwsh(script, ctx) {
  return new Promise((resolve, reject) => {
    const isWin = platform() === 'win32';
    const cmd   = isWin ? 'powershell.exe' : 'pwsh';
    const args  = ['-NoProfile', '-NonInteractive', '-OutputFormat', 'Text', '-Command', script];
    ctx?.log?.(`spawn ${cmd} (script ${script.length} chars)`);
    const t0 = Date.now();
    const child = spawn(cmd, args, { windowsHide: true });
    let stdout = '', stderr = '';
    child.stdout.on('data', d => { stdout += d.toString(); ctx?.log?.(`stdout +${d.length}B`); });
    child.stderr.on('data', d => { stderr += d.toString(); ctx?.log?.(`stderr +${d.length}B`); });
    child.on('error', reject);
    child.on('close', code => {
      const ms = Date.now() - t0;
      ctx?.log?.(`pwsh exit ${code} in ${ms} ms, ${stdout.length}B stdout`);
      if (code === 0) resolve(stdout.trim());
      else reject(new Error(`pwsh exit ${code}: ${stderr.trim() || stdout.trim()}`));
    });
  });
}
const textResult = s => ({ content: [{ type: 'text', text: String(s) }] });

// ---------- server ----------
const server = new McpServer(
  { name: 'agentic-demo-mcp', version: '0.1.0' },
  { capabilities: { tools: {} } }
);

// ----- notes tools -----
server.registerTool('notes_add',
  { description: 'Append a note to the persistent demo notes store. Returns the new note id.',
    inputSchema: { text: z.string().min(1).describe('Note body') } },
  traced('notes_add', async ({ text }, ctx) => {
    await ctx.progress('loading store', 3);
    const notes = loadNotes();
    await ctx.progress(`store has ${notes.length} note(s)`, 3);
    const id = (notes.at(-1)?.id ?? 0) + 1;
    notes.push({ id, text, created: new Date().toISOString() });
    saveNotes(notes);
    await ctx.progress(`saved note #${id}`, 3);
    return textResult(`Added note #${id}. Total notes: ${notes.length}. Stored at ${STORE_FILE}`);
  }));

server.registerTool('notes_list',
  { description: 'List all notes in the persistent demo notes store.', inputSchema: {} },
  traced('notes_list', async (_args, ctx) => {
    await ctx.progress('loading store', 1);
    const notes = loadNotes();
    ctx.log(`returning ${notes.length} note(s)`);
    if (notes.length === 0) return textResult('(no notes yet)');
    return textResult(notes.map(n => `#${n.id} [${n.created}] ${n.text}`).join('\n'));
  }));

server.registerTool('notes_search',
  { description: 'Case-insensitive substring search across all notes.',
    inputSchema: { query: z.string().min(1).describe('Search substring') } },
  traced('notes_search', async ({ query }, ctx) => {
    await ctx.progress(`searching for "${query}"`, 2);
    const q = query.toLowerCase();
    const notes = loadNotes();
    const hits = notes.filter(n => n.text.toLowerCase().includes(q));
    await ctx.progress(`${hits.length} hit(s) in ${notes.length} note(s)`, 2);
    if (hits.length === 0) return textResult(`No notes match "${query}".`);
    return textResult(hits.map(n => `#${n.id} ${n.text}`).join('\n'));
  }));

server.registerTool('notes_delete',
  { description: 'Delete a note by its id.',
    inputSchema: { id: z.number().int().positive().describe('Note id to delete') } },
  traced('notes_delete', async ({ id }, ctx) => {
    await ctx.progress(`loading store`, 2);
    const notes = loadNotes();
    const before = notes.length;
    const kept = notes.filter(n => n.id !== id);
    saveNotes(kept);
    await ctx.progress(`store ${before} → ${kept.length}`, 2);
    return textResult(before === kept.length ? `No note with id ${id}.` : `Deleted note #${id}.`);
  }));

// ----- system tools -----
server.registerTool('system_os_info',
  { description: 'Report basic operating system info (name, version, uptime) from the host.', inputSchema: {} },
  traced('system_os_info', async (_args, ctx) => {
    await ctx.progress('querying Win32_OperatingSystem', 2);
    const out = await runPwsh(`
      $os = Get-CimInstance Win32_OperatingSystem
      [pscustomobject]@{
        Caption  = $os.Caption
        Version  = $os.Version
        Build    = $os.BuildNumber
        Uptime   = ((Get-Date) - $os.LastBootUpTime).ToString('d\\.hh\\:mm\\:ss')
        Hostname = $env:COMPUTERNAME
        User     = $env:USERNAME
      } | Format-List | Out-String`, ctx);
    await ctx.progress('formatting result', 2);
    return textResult(out);
  }));

server.registerTool('system_disk_free',
  { description: 'Report free space on all fixed disks of the host.', inputSchema: {} },
  traced('system_disk_free', async (_args, ctx) => {
    await ctx.progress('enumerating fixed disks', 2);
    const out = await runPwsh(`
      Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' |
        Select-Object DeviceID,
          @{n='SizeGB';e={[math]::Round($_.Size/1GB,2)}},
          @{n='FreeGB';e={[math]::Round($_.FreeSpace/1GB,2)}} |
        Format-Table -AutoSize | Out-String`, ctx);
    await ctx.progress('formatting result', 2);
    return textResult(out);
  }));

server.registerTool('system_top_processes',
  { description: 'Return the top N processes by working-set memory on the host.',
    inputSchema: { count: z.number().int().min(1).max(50).default(5).describe('How many processes to return') } },
  traced('system_top_processes', async ({ count }, ctx) => {
    const n = count ?? 5;
    await ctx.progress(`collecting top ${n} processes`, 2);
    const out = await runPwsh(`
      Get-Process | Sort-Object WS -Descending | Select-Object -First ${n} `
      + `Name, Id, @{n='MemMB';e={[math]::Round($_.WS/1MB,1)}} | Format-Table -AutoSize | Out-String`, ctx);
    await ctx.progress('formatting result', 2);
    return textResult(out);
  }));

// ---------- boot ----------
log('info', `${C.bold}agentic-demo-mcp${C.reset} starting (pid ${process.pid}, node ${process.version}, ${platform()})`);
log('info', `notes store: ${STORE_FILE}`);
log('info', `verbose=${VERBOSE} color=${USE_COLOR}  (toggle with AGENTIC_DEMO_VERBOSE=0 / AGENTIC_DEMO_NO_COLOR=1)`);

const transport = new StdioServerTransport();
await server.connect(transport);
log('ok', 'stdio transport connected, awaiting JSON-RPC requests');

for (const sig of ['SIGINT', 'SIGTERM']) {
  process.on(sig, () => { log('warn', `received ${sig}, shutting down`); process.exit(0); });
}
process.on('uncaughtException', e => log('err', `uncaughtException: ${e.stack || e.message}`));
process.on('unhandledRejection', e => log('err', `unhandledRejection: ${e?.stack || e}`));