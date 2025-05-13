import { spawn } from 'child_process';
import { platform } from 'os';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

// Get current file's directory
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Get environment from command line args
const env = process.argv[2] || 'dev';
const isWindows = platform() === 'win32';
const scriptExt = isWindows ? '.bat' : '.sh';
const scriptPath = join(__dirname, `${env}${scriptExt}`);

// Execute the appropriate script with 'run' argument
const child = spawn(isWindows ? scriptPath : 'bash', isWindows ? ['run'] : [scriptPath, 'run'], {
  stdio: 'inherit',
  shell: true
});

child.on('error', (error) => {
  console.error(`Error executing ${scriptPath}:`, error);
  process.exit(1);
});

child.on('close', (code) => {
  process.exit(code);
});