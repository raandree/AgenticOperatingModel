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
function runPwsh(script) {
  return new Promise((resolve, reject) => {
    const isWin = platform() === 'win32';
    const cmd   = isWin ? 'powershell.exe' : 'pwsh';
    const args  = ['-NoProfile', '-NonInteractive', '-OutputFormat', 'Text', '-Command', script];
    const child = spawn(cmd, args, { windowsHide: true });
    let stdout = '', stderr = '';
    child.stdout.on('data', d => stdout += d.toString());
    child.stderr.on('data', d => stderr += d.toString());
    child.on('error', reject);
    child.on('close', code => {
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
  async ({ text }) => {
    const notes = loadNotes();
    const id = (notes.at(-1)?.id ?? 0) + 1;
    notes.push({ id, text, created: new Date().toISOString() });
    saveNotes(notes);
    return textResult(`Added note #${id}. Total notes: ${notes.length}. Stored at ${STORE_FILE}`);
  });

server.registerTool('notes_list',
  { description: 'List all notes in the persistent demo notes store.', inputSchema: {} },
  async () => {
    const notes = loadNotes();
    if (notes.length === 0) return textResult('(no notes yet)');
    return textResult(notes.map(n => `#${n.id} [${n.created}] ${n.text}`).join('\n'));
  });

server.registerTool('notes_search',
  { description: 'Case-insensitive substring search across all notes.',
    inputSchema: { query: z.string().min(1).describe('Search substring') } },
  async ({ query }) => {
    const q = query.toLowerCase();
    const hits = loadNotes().filter(n => n.text.toLowerCase().includes(q));
    if (hits.length === 0) return textResult(`No notes match "${query}".`);
    return textResult(hits.map(n => `#${n.id} ${n.text}`).join('\n'));
  });

server.registerTool('notes_delete',
  { description: 'Delete a note by its id.',
    inputSchema: { id: z.number().int().positive().describe('Note id to delete') } },
  async ({ id }) => {
    const notes = loadNotes();
    const before = notes.length;
    const kept = notes.filter(n => n.id !== id);
    saveNotes(kept);
    return textResult(before === kept.length ? `No note with id ${id}.` : `Deleted note #${id}.`);
  });

// ----- system tools -----
server.registerTool('system_os_info',
  { description: 'Report basic operating system info (name, version, uptime) from the host.', inputSchema: {} },
  async () => {
    const out = await runPwsh(`
      $os = Get-CimInstance Win32_OperatingSystem
      [pscustomobject]@{
        Caption  = $os.Caption
        Version  = $os.Version
        Build    = $os.BuildNumber
        Uptime   = ((Get-Date) - $os.LastBootUpTime).ToString('d\\.hh\\:mm\\:ss')
        Hostname = $env:COMPUTERNAME
        User     = $env:USERNAME
      } | Format-List | Out-String`);
    return textResult(out);
  });

server.registerTool('system_disk_free',
  { description: 'Report free space on all fixed disks of the host.', inputSchema: {} },
  async () => {
    const out = await runPwsh(`
      Get-CimInstance Win32_LogicalDisk -Filter 'DriveType=3' |
        Select-Object DeviceID,
          @{n='SizeGB';e={[math]::Round($_.Size/1GB,2)}},
          @{n='FreeGB';e={[math]::Round($_.FreeSpace/1GB,2)}} |
        Format-Table -AutoSize | Out-String`);
    return textResult(out);
  });

server.registerTool('system_top_processes',
  { description: 'Return the top N processes by working-set memory on the host.',
    inputSchema: { count: z.number().int().min(1).max(50).default(5).describe('How many processes to return') } },
  async ({ count }) => {
    const n = count ?? 5;
    const out = await runPwsh(`
      Get-Process | Sort-Object WS -Descending | Select-Object -First ${n} `
      + `Name, Id, @{n='MemMB';e={[math]::Round($_.WS/1MB,1)}} | Format-Table -AutoSize | Out-String`);
    return textResult(out);
  });

// ---------- boot ----------
const transport = new StdioServerTransport();
await server.connect(transport);
process.stderr.write(`[agentic-demo-mcp] ready. notes store: ${STORE_FILE}\n`);