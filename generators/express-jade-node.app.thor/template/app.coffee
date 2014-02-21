fs = require('fs')
http = require('http')
coffeeScript = require('coffee-script')
express = require('express')
routes = require('./app/routes')
packageJson = require('./package.json')

app = express()
app.set('views', "#{__dirname}/app/views")
app.set('view engine', 'jade')
app.use(express.bodyParser())
app.use require('connect-assets')
   helperContext: app.locals
   src: "#{__dirname}/app/assets"
app.use('/components', express.static( "#{__dirname}/app/assets/bower_components"))

routes.init(app, packageJson)

port = process.env.PORT || 5000
app.set('port', port)

handler = -> console.log "Express server listening on port " + port

http.createServer(app).listen(app.get('port'), handler )
