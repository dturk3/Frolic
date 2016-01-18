package frolic

import frolic.parameter.Distance
import frolic.parameter.Duration
import frolic.parameter.TimeOfDay
import frolic.strategy.Strategies
import grails.converters.deep.JSON

class FrolicController {
	
	FrolicService frolicService
		
    def index() { 
		if (!params.permalink) {
			Strategies strategies = new Strategies(frolicService, params.neighbourhood + " " + params.city, params.lon, params.lat)
			
			def frolic = strategies.DRINK.execute(TimeOfDay.EVENING, Duration.TYPICAL, Distance.WALK)
			frolic.save(flush: true, failOnError: true)
			return redirect(url: "/frolic/index/?permalink=" + frolic.permalink)
		}
	}
	
	def get() {
		Frolic frolic = Frolic.findByPermalink(params.permalink)
		println frolic
		return render(text: frolic as JSON)
	}
}
