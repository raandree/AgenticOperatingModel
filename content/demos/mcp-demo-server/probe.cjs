const { spawn } = require('node:child_process');
const child = spawn(process.execPath, ['server.js'], { stdio: ['pipe', 'pipe', 'inherit'] });
let buf = '';
const pending = new Map();
child.stdout.on('data', d => {
  buf += d.toString();
  let i;
  while ((i = buf.indexOf('\n')) >= 0) {
    const line = buf.slice(0, i).trim(); buf = buf.slice(i + 1);
    if (!line) continue;
    try {
      const msg = JSON.parse(line);
      if (msg.id && pending.has(msg.id)) { pending.get(msg.id)(msg); pending.delete(msg.id); }
    } catch (e) { console.error('parse', e.message, line); }
  }
});
let nextId = 1;
function call(method, params) {
  return new Promise((resolve) => {
    const id = nextId++;
    pending.set(id, resolve);
    child.stdin.write(JSON.stringify({ jsonrpc: '2.0', id, method, params }) + '\n');
  });
}
function notify(method, params) {
  child.stdin.write(JSON.stringify({ jsonrpc: '2.0', method, params }) + '\n');
}
(async () => {
  const init = await call('initialize', { protocolVersion: '2025-06-18', capabilities: {}, clientInfo: { name: 'probe', version: '0' } });
  console.log('INIT:', init.result?.serverInfo);
  notify('notifications/initialized', {});
  const tools = await call('tools/list', {});
  console.log('TOOLS:', tools.result.tools.map(t => t.name).join(', '));
  const add = await call('tools/call', { name: 'notes_add', arguments: { text: 'hello from probe' } });
  console.log('ADD:', add.result?.content?.[0]?.text);
  const list = await call('tools/call', { name: 'notes_list', arguments: {} });
  console.log('LIST:', list.result?.content?.[0]?.text);
  const search = await call('tools/call', { name: 'notes_search', arguments: { query: 'probe' } });
  console.log('SEARCH:', search.result?.content?.[0]?.text);
  const os = await call('tools/call', { name: 'system_os_info', arguments: {} });
  console.log('OS:', os.result?.content?.[0]?.text?.split('\n').slice(0,4).join(' | '));
  const top = await call('tools/call', { name: 'system_top_processes', arguments: { count: 3 } });
  console.log('TOP:\n' + top.result?.content?.[0]?.text);
  const disk = await call('tools/call', { name: 'system_disk_free', arguments: {} });
  console.log('DISK:\n' + disk.result?.content?.[0]?.text);
  const del = await call('tools/call', { name: 'notes_delete', arguments: { id: 1 } });
  console.log('DEL:', del.result?.content?.[0]?.text);
  child.kill();
  setTimeout(() => process.exit(0), 200);
})();
