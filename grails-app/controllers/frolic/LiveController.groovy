package frolic

import grails.converters.JSON
import grails.rest.RestfulController

class LiveController extends RestfulController {

	def springSecurityService
	static responseFormats = ['json']
	
	LiveController() {
		super(LiveContext)
	}
		
    	def context() {
		LiveContext ctx = new LiveContext()
		
		def recentFrolics = Frolic.withCriteria(fetch:[places:"eager"]) {
		    def now = new Date()
		    between('creationDate', now-1, now)
		}
		
		ctx.nearbyFrolics = []
		ctx.nearbyFrolics << recentFrolics
		render ctx as JSON
	}
}
