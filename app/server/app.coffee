http = require 'http'
express = require 'express'

app = express()

app.use express.static 'app/public'

app.all '/*', (req, res) ->
	res.sendFile 'index.html', root: 'app/public'

http.createServer(app).listen 3000
