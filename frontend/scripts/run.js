const { spawn } = require('child_process');
const os = require('os');

// Get environment from command line args
const env = process.argv[2] || 'dev';
const isWindows = os.platform() === 'win32';
const scriptExt = isWindows ? '.bat' : '.sh';
const scriptPath = `./scripts/${env}${scriptExt}`;

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