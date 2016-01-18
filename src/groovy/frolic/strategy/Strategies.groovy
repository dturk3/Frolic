package frolic.strategy

import frolic.Frolic
import frolic.FrolicService
import frolic.FrolicStrategy
import frolic.parameter.Distance
import frolic.parameter.Duration
import frolic.parameter.TimeOfDay
import frolic.parameter.YelpSortMode

class Strategies {

	Random rand
	FrolicService frolicService

	String location
	String lon
	String lat

	Strategies(FrolicService frolicS, String locationParam, String lonParam, String latParam) {
		rand = new Random()

		frolicService = frolicS
		location = locationParam
		lon = lonParam
		lat = latParam
	}

	FrolicStrategy DRINK = [
		execute: { TimeOfDay time, Duration duration, Distance distance ->
			int yelpCalls = randomNumber(1, 2)

			Map radiusStrategy = [
				(Distance.ANY): randomNumber(500, 40000),
				(Distance.WALK): randomNumber(500, 2000),
				(Distance.BIKE): randomNumber(1000, 5000),
				(Distance.TRANSIT): randomNumber(3000, 15000),
				(Distance.DRIVE): randomNumber(10000, 40000)
			]

			Map termsStrategy = [
				(TimeOfDay.NOW): [
					"irish pub",
					"mimosa",
					"irish coffee",
				], //TODO
				(TimeOfDay.MORNING): [
					"irish pub",
					"mimosa",
					"irish coffee",
				],
				(TimeOfDay.AFTERNOON): [
					"pub",
					"bar",
					"beer",
					"draft",
					"craft beer",
				],
				(TimeOfDay.EVENING): [
					"wine bar",
					"lounge",
					"pub",
					"bar",
					"beer",
					"wine",
					"scotch",
					"whiskey",
					"bourbon",
					"draft",
					"craft beer",
					"cocktail"
				],
				(TimeOfDay.LATENIGHT): [
					"lounge",
					"speakeasy",
					"nightclub",
					"club",
					"scotch",
					"wine",
					"wine bar",
					"pub",
					"bar",
					"cocktail"
				],
			]
			
			Map durationStrategy = [
				(Duration.ANY): randomNumber(1, 8),
				(Duration.ONESTOP): 1,
				(Duration.BRIEF): randomNumber(2, 3),
				(Duration.TYPICAL): randomNumber(3, 5),
				(Duration.MARATHON): randomNumber(6, 7)
			]
			
			Map categoriesStrategy = [
				(TimeOfDay.MORNING): [
					"irish_pubs",
					"sportsbars",
					"hotel_bar",
					"pubs",
				],
				(TimeOfDay.AFTERNOON): [
					"beer_and_wine",
					"beverage_stores",
					"breweries",
					"distilleries",
					"bars",
					"beerbars",
					"divebars",
					"irish_pubs",
					"pubs",
					"sportsbars",
				],
				(TimeOfDay.EVENING): [
					"beverage_stores",
					"distilleries",
					"bars",
					"beerbars",
					"cocktailbars",
					"divebars",
					"irish_pubs",
					"lounges",
					"pubs",
					"hotel_bar",
					"sportsbars",
					"wine_bars",
					"danceclubs",
					"karaoke",
				],
				(TimeOfDay.LATENIGHT): [
					"lounge",
					"beer_and_wine",
					"bars",
					"beerbars",
					"cocktailbars",
					"lounges",
					"pubs",
					"hotel_bar",
					"wine_bars",
					"danceclubs",
				],
			]
			
			int numCategories = randomNumber(0, 2)
			
			List categoryList = []
			(0..numCategories).each {
				categoryList << popRandomFromList(categoriesStrategy.get(time))
			}
			
			List sortStrategy = [YelpSortMode.DISTANCE, YelpSortMode.RELEVANCE, YelpSortMode.RATING]

			int radius = radiusStrategy.get(distance)
			String term = popRandomFromList(termsStrategy.get(time))
			Integer maxResults = Math.max(durationStrategy.get(duration), 8)
			YelpSortMode sortOrder = popRandomFromList(sortStrategy) 
			String categories = categoryList.join(",")

			println maxResults
			List places = []			
			(0..yelpCalls).each {
				places.addAll(frolicService.searchYelp(term, location, lon, lat, radius, maxResults, sortOrder, categories))
			}
			
			Set uniquePlaces = places.unique()
			
			List placesList = uniquePlaces.toList().subList(0, Math.max(Math.min(maxResults, 8), uniquePlaces.size()))
			
			Frolic frolic = new Frolic()
			frolic.setCentreLon(lon)
			frolic.setCentreLat(lat)
			frolic.setLocation(location)
			if (!placesList) {
				frolic.save()
				return frolic
			}
			(1..maxResults).each {
				def nextPlace = popRandomFromList(placesList)
				if (nextPlace) {
					frolic.addToPlace(nextPlace)
					println "ADDED PLACE: " + nextPlace
				}
			}
			frolic.save()
			return frolic
		}
	] as FrolicStrategy

	FrolicStrategy EAT = [
		execute: { TimeOfDay time, Duration duration, Distance distance ->
		}
	] as FrolicStrategy

	FrolicStrategy DATE = [
		execute: { TimeOfDay time, Duration duration, Distance distance ->
		}
	] as FrolicStrategy

	FrolicStrategy TOURISM = [
		execute: { TimeOfDay time, Duration duration, Distance distance ->
		}
	] as FrolicStrategy

	FrolicStrategy SURPRISE = [
		execute: { TimeOfDay time, Duration duration, Distance distance ->
		}
	] as FrolicStrategy

	def int randomNumber(int min, int max) {
		return rand.nextInt(max) + min
	}
	
	def popRandomFromList(List l) {
		if (!l) {
			return null
		}
		
		if (l.size() == 1) {
			return l.remove(0)
		}
		return l.remove(randomNumber(0, l.size() - 1))
	}
}
