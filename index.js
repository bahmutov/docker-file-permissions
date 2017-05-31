const http = require('http')
const server = http.createServer((req, res) => {
  console.log('request', req.method, req.url)
  res.writeHead(200)
  res.end()
})
const ip = '::' // '0.0.0.0'
const port = 6500
server.listen(port, ip, () => {
  console.log('listening at %s:%d', ip, port)
  console.log(server.address())
})
