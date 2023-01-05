const { exec } = require("child_process");
const { spawn } = require("child_process");
const { existsSync, writeFileSync } = require('fs');
const version = require('./version.json');

console.log(version);
version.number += 1
writeFileSync('./version.json', JSON.stringify(version, null, 2), 'utf8');

const homePath = '/home/ubuntu'
// const homePath = '/home/jlabrada/Documents/sources/heroku/aws-config/aws-clone'

const execPms = (command) => {
  return new Promise((resolve, reject) => {
    console.log('executing: ' + command)
    exec(command, (error, stdout, stderr) => error ? reject(error) : resolve({ stdout, stderr }));
  })
}
const ls = (lsPath) => execPms(`ls ${lsPath}`)

const pendingPath = `pending-deploy`
const untarPath = `untar-files`
const rollbackPath = `rollbacks`
const appsPath = `apps`
const untar = (file)  => execPms(`tar -xzf ${file}`)
const pm2 = (action, file)  => execPms(`pm2 ${action} ${file}`)
const rm = (file)  => execPms(`rm -rf ${file}`)
const mv = (source, target)  => execPms(`mv ${source} ${target}`)
const exists = (file) => existsSync(file)

const executeTask = async (message, task, source, target ) => {
  if (exists(`${homePath}/${source}`)) {
    console.log(`${message} ${source}`)
    await task(`${homePath}/${source}`, `${homePath}/${target}`)
  }
}

const untarAndMv = async (command) => {
  console.log(`untaring ${command.untar}`)
  await executeTask('moving', mv,  `${pendingPath}/${command.name}.tar`, `${untarPath}/${command.name}.tar`)
  await untar(`${command.untar}`)
  await executeTask('renaming', mv, `${untarPath}/.output`, `${untarPath}/${command.name}`)
  const { stdout } = await pm2('list')
  if (stdout.includes(command.name)) {
    await pm2('stop', command.name )
  }
  await executeTask('removing', rm, `${rollbackPath}/${command.name}_previous_rollback`)
  await executeTask('creating rollback rollback', mv, `${rollbackPath}/${command.name}_rollback`, `${rollbackPath}/${command.name}_previous_rollback`)
  await executeTask('creating rollback', mv, `${appsPath}/${command.name}`, `${rollbackPath}/${command.name}_rollback`)
  await executeTask('creating ', mv, `${untarPath}/${command.name}`, `${appsPath}/${command.name}`)
  await executeTask('renaming', mv, `${appsPath}/${command.name}/server/index.mjs`, `${appsPath}/${command.name}/server/${command.name}.mjs`)
  await pm2('start', `${appsPath}/${command.name}.config.js` )
//   await pm2('start', `${appsPath}/${command.name}/server/${command.name}.mjs` )
  await executeTask('removing', rm, `${untarPath}/${command.name}.tar` )
}

ls(`${homePath}/pending-deploy`).then(
  result => result.stdout.split('\n')
            .filter(name => name.trim(''))
            .map(name => ({ name: `${name.split('.tar')[0]}`, untar: `${homePath}/${untarPath}/${name} -C ${homePath}/${untarPath} ` }))
            .forEach(command => untarAndMv(command))
  )
