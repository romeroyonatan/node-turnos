# Routing


module.exports  = (app) ->

	# MVC pages
	app.all '/', (req, res, next)->
		routeMvc('index', 'index', req, res, next)

	app.all '/:controller' , (req, res, next)->
		routeMvc(req.params.controller, 'index',req,res, next)

	app.all '/:controller/:method' , (req, res, next)->
		routeMvc(req.params.controller, req.params.method, req,res,next)

	app.all '/:controller/:method/:id' , (req, res, next)->
		routeMvc(req.params.controller, req.params.method,req,res, next)

	# If all else failed, show 404 page
	app.all '/*', (req, res)->
		console.warn "error 404: ", req.url
		res.render '404',404

# render the page based on controller, method and id
routeMvc = (controllerName, methodName, req, res, next)->
	console.info "mvc page, controller: "+controllerName+", method: "+methodName+", id: "+req.params.id
	controllerName='index' if not controllerName?
	controller=null
	try
		controller=require "./controllers/"+controllerName
	catch e
		console.warn "controller not found: "+ controllerName, e
		next()
		return

	data=null
	if methodName?
		# eval is evil, so sanitize it
		methodName = methodName.replace(/[^a-z0-9A-Z_-]/i,'')
		method=eval('controller  .'+methodName)
		if method?
			data = {}
			method req, data, (isApi)->
				if not data?
					throw new Error("Controller's return value not implemented!")
				if isApi					
					# send JSON based on api
					res.send data
				else
					#render page
					res.render  controllerName, data
	else
		console.warn 'method not found: ' +methodName
		next()
