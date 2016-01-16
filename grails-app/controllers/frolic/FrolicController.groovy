package frolic

import frolic.parameter.Distance
import frolic.parameter.Duration
import frolic.parameter.TimeOfDay
import frolic.strategy.Strategies

class FrolicController {
	
	FrolicService frolicService
		
    def index() { 
		
		Strategies strategies = new Strategies(frolicService, "grange park toronto", "43.7000", "79.4000")
		def frolic = strategies.DRINK.execute(TimeOfDay.EVENING, Duration.TYPICAL, Distance.WALK) 
	}
}
