const childProcess = require('child_process')

module.exports = function (args) {
  const subProcess = childProcess.spawnSync('ligo', args, {
    stdio: [process.stdin, 'pipe', 'pipe']
  })

  console.log('subProcess.stdout.toString()', subProcess.stdout.toString())
  console.log('subProcess.stderr.toString()', subProcess.stderr.toString())

  if (subProcess.stderr.length > 0) {
    console.log(subProcess.stderr.toString())
  }

  if (subProcess.stdout.length == 0) {
    subProcess.stdout = subProcess.stderr
  }

  return subProcess.stdout
}
