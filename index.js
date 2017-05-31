const fs = require('fs')
const path = require('path')
const execa = require('execa')

const name = path.resolve('foo')

if (!fs.existsSync(name)) {
  fs.mkdirSync(name)
  console.log('made folder %s', name)
}
console.log('working with folder %s', name)

fs.chmodSync(name, '111')
console.log('changed folder permissions')

console.log(execa.shellSync(`ls -ld "${name}"`).stdout)
console.log(execa.shellSync(`ls "${name}"`).stdout)
