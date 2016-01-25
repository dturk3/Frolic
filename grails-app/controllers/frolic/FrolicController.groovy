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
			Strategies strategies = new Strategies(frolicService, params.location, params.lon, params.lat)
			
			TimeOfDay time = [
				"now": TimeOfDay.EVENING,
				"morning": TimeOfDay.MORNING,
				"afternoon": TimeOfDay.AFTERNOON,
				"evening": TimeOfDay.EVENING,
				"latenight": TimeOfDay.LATENIGHT
			].get(params.time)
			
			Duration duration = [
				"any": Duration.ANY,
				"one": Duration.ONESTOP,
				"brief": Duration.BRIEF,
				"typical": Duration.TYPICAL,
				"marathon": Duration.MARATHON
			].get(params.length)
			
			Distance distance = [
				"any": Distance.ANY,
				"walk": Distance.WALK,
				"bike": Distance.BIKE,
				"transit": Distance.TRANSIT,
				"drive": Distance.DRIVE
			].get(params.distance)
			
			FrolicStrategy strategy = [
				"surprise": strategies.DRINK,
				"drink": strategies.DRINK,
				"eat": strategies.DRINK,
				"date": strategies.DRINK,
				"tourism": strategies.DRINK
			].get(params.type)
			
			def frolic = strategy.execute(time, duration, distance)
			frolic.save(flush: true, failOnError: true)
			return redirect(url: "/frolic/index/?permalink=" + frolic.permalink)
		}
		
		Frolic frolic = Frolic.findByPermalink(params.permalink)
		println "NUMBER PLACES: " + frolic.numberOfPlaces
		println "PLACES: " + frolic.place
		return [frolic: frolic]
	}
	
	def get() {
		Frolic frolic = Frolic.findByPermalink(params.permalink)
		return render(text: frolic as JSON)
	}
}
