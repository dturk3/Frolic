package frolic

import org.apache.shiro.SecurityUtils;

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
			println "TYPE: " + params.type
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
				"date": strategies.DATE,
				"tourism": strategies.DRINK
			].get(params.type)
			
			def frolic = strategy.execute(time, duration, distance)
			def userName  = SecurityUtils.subject?.principal
			def user = ShiroUser.findByUsername(userName)
			frolic.setCreator(user)
			frolic.save(flush: true, failOnError: true)
			return redirect(controller: "frolic",
				action: "index",
				params: [permalink: frolic.permalink]
			)
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
	
	def start() {
		Frolic frolic = Frolic.findByPermalink(params.permalink)
		List reorderedPlaces = []
		int placeIndex = Integer.valueOf(params.placeIdx)
		reorderedPlaces << frolic.place[placeIndex]
		frolic.place.remove(placeIndex)
		reorderedPlaces.addAll(frolic.place)
		frolic.place.clear()
		frolic.place = reorderedPlaces
		println frolic.place
		frolic.save(flush: true, failOnError: true)
		return redirect(controller: "frolic",
			action: "index",
			params: [permalink: frolic.permalink]
		)
	}
	
	def swap() {
		Frolic frolic = Frolic.findByPermalink(params.permalink)
		List currentPlaces = []
		currentPlaces.addAll(frolic.place.subList(0, frolic.numberOfPlaces))
		List subPlaces = []
		subPlaces.addAll(frolic.place.subList(frolic.numberOfPlaces, frolic.place.size()))
		int placeIndex = Integer.valueOf(params.placeIdx)
		def removedPlace = currentPlaces.remove(placeIndex)
		def subPlace = subPlaces.pop()
		currentPlaces.add(placeIndex, subPlace)
		frolic.place.clear()
		frolic.place.addAll(currentPlaces + subPlaces)
		frolic.place << removedPlace
		frolic.save(flush: true, failOnError: true)
		return redirect(url: "/frolic/index/?permalink=" + frolic.permalink)
	}
	
	def upvote() {
		Frolic frolic = Frolic.findByPermalink(params.permalink)
		String clientIp = request.getRemoteAddr()
		if (!params.placeIdx) {
			if (frolic.voter.contains(clientIp)) {
				return render(contentType: 'text/json') {[
					'votes': 0,
					'type': "frolic"
				]}
			}
			frolic.upvotes = frolic.upvotes + 1
			frolic.voter << clientIp
			frolic.save(flush: true, failOnError: true)
				return render(contentType: 'text/json') {[
					'votes': 1,
					'type': "frolic"
				]}		
			}
		int placeIndex = Integer.valueOf(params.placeIdx)
		Place place = frolic.place.get(placeIndex)
		if (place.voter.contains(clientIp)) {
			def result = [votes: 0, type: "place"]
			return render(contentType: 'text/json') {[
				'votes': 0,
				'type': "place"
			]}
		}
		place.upvotes = place.upvotes + 1
		place.voter << clientIp
		place.save(flush: true, failOnError: true)
		return render(contentType: 'text/json') {[
			'votes': 1,
			'type': "place"
		]}
	}
	
	def downvote() {
		Frolic frolic = Frolic.findByPermalink(params.permalink)
		String clientIp = request.getRemoteAddr()
		if (!params.placeIdx) {
			if (frolic.voter.contains(clientIp)) {
				return render(contentType: 'text/json') {[
					'votes': 0,
					'type': "frolic"
				]}
			}
			frolic.downvotes = frolic.downvotes + 1
			frolic.voter << clientIp
			frolic.save(flush: true, failOnError: true)
				return render(contentType: 'text/json') {[
					'votes': 1,
					'type': "frolic"
				]}
		}
		int placeIndex = Integer.valueOf(params.placeIdx)
		Place place = frolic.place.get(placeIndex)
		if (place.voter.contains(clientIp)) {
			return render(contentType: 'text/json') {[
				'votes': 0,
				'type': "place"
			]}
		}
		place.downvotes = place.downvotes + 1
		place.voter << clientIp
		place.save(flush: true, failOnError: true)
		return render(contentType: 'text/json') {[
			'votes': 1,
			'type': "place"
		]}
	}
	
	def menu() {
		return []
	}
	
	def live() {
		println "Live"
		return []
	}
}
