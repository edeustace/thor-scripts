# deps
fs = require('fs')
express = require('express')
stitch  = require('stitch')

# express server
app = express.createServer()

app.configure 'development', ->
  app.use express.static(__dirname )

# server, listen on port 8000
port = process.env.PORT || 8000
app.listen port, ->
  console.log "server started on http://#{app.address().address}:#{port}/"
