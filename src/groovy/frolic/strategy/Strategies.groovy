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
	
	int attempts

	Strategies(FrolicService frolicS, String locationParam, String lonParam, String latParam) {
		rand = new Random()

		frolicService = frolicS
		location = locationParam
		lon = lonParam
		lat = latParam
		attempts = 0
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
				(Duration.MARATHON): randomNumber(6, 8)
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
			
			//int numCategories = randomNumber(0, 2)
			int numCategories = 0
			
			List categoryList = []
			if (numCategories > 0) {
				(0..numCategories).each {
					categoryList << popRandomFromList(categoriesStrategy.get(time))
				}
			}
			
			List sortStrategy = [YelpSortMode.DISTANCE, YelpSortMode.RELEVANCE, YelpSortMode.RATING]

			int radius = radiusStrategy.get(distance)
			String term = popRandomFromList(termsStrategy.get(time))
			Integer maxResults = durationStrategy.get(duration)
			YelpSortMode sortOrder = popRandomFromList(sortStrategy) 
			String categories = categoryList.join(",")

			println maxResults
			List places = []			
			(0..yelpCalls).each {
				places.addAll(frolicService.searchYelp(term, location, lon, lat, radius, 15, sortOrder, categories))
			}
			
			Set uniquePlaces = places.unique()
			
			if (uniquePlaces == 0) {
				if (attempts > 2) {
					throw new IllegalStateException("Nothing to do here!")
				}
				attempts++ 
				return DRINK.execute(time, duration, distance)
			}
			
			//List placesList = uniquePlaces.toList().subList(0, Math.min(maxResults, uniquePlaces.size()))
			List placesList = uniquePlaces.toList()
			
			Frolic frolic = new Frolic()
			frolic.setCentreLon(lon)
			frolic.setCentreLat(lat)
			frolic.setLocation(location)
			frolic.setType("drink")
			if (!placesList) {
				frolic.save()
				return frolic
			}
			(0..placesList.size()).each {
				def nextPlace = popRandomFromList(placesList)
				if (nextPlace) {
					frolic.addToPlace(nextPlace)
				}
			}
			frolic.setNumberOfPlaces(maxResults)
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
					"breakfast",
					"park",
					"mall",
					"brunch",
					"mall",
				],
				(TimeOfDay.AFTERNOON): [
					"pub",
					"movie",
					"museum",
					"brunch",
					"bowling",
					"art gallery",
					"mall",
				],
				(TimeOfDay.EVENING): [
					"lounge",
					"bowling",
					"drinks",
					"dinner",
					"movie",
					"nightclub",
				],
				(TimeOfDay.LATENIGHT): [
					"lounge",
					"nightclub",
					"club",
					"wine bar",
					"bar",
					"drinks",
					"movie",
				],
			]
			
			Map durationStrategy = [
				(Duration.ANY): randomNumber(1, 8),
				(Duration.ONESTOP): 1,
				(Duration.BRIEF): randomNumber(1, 2),
				(Duration.TYPICAL): randomNumber(2, 4),
				(Duration.MARATHON): randomNumber(5, 6)
			]
			
			Map categoriesStrategy = [
				(TimeOfDay.MORNING): [
					"irish_pubs",
					"sportsbars",
					"hotel_bar",
					"pubs",
					"parks",
					"tennis",
					"zoos",
				],
				(TimeOfDay.AFTERNOON): [
					"aquariums",
					"archery",
					"pubs",
					"bowling",
					"climbing",
					"escapegames",
					"mini_golf",
					"parks",
					"tennis",
					"zoos",
					"arts",
					"shopping",
				],
				(TimeOfDay.EVENING): [
					"beverage_stores",
					"escapegames",
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
					"bowling",
					"arts",
					"musicvenues",
					"theater",
					"museums",
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
					"musicvenues",
				],
			]
			
			//int numCategories = randomNumber(0, 2)
			int numCategories = 0
			
			List categoryList = []
			if (numCategories > 0) {
				(0..numCategories).each {
					categoryList << popRandomFromList(categoriesStrategy.get(time))
				}
			}
			
			List sortStrategy = [YelpSortMode.DISTANCE, YelpSortMode.RELEVANCE, YelpSortMode.RATING]

			int radius = radiusStrategy.get(distance)
			//String term = popRandomFromList(termsStrategy.get(time))
			Integer maxResults = durationStrategy.get(duration)
			YelpSortMode sortOrder = popRandomFromList(sortStrategy)
			String categories = categoryList.join(",")

			println "CATEGORIES: " + categoryList
			
			List places = []
			(0..yelpCalls).each {
				//term = popRandomFromList(termsStrategy.get(time))
				String nextSearch = popRandomFromList(termsStrategy.get(time))
				println "TERM: " + nextSearch
				places.addAll(frolicService.searchYelp(nextSearch, location, lon, lat, radius, 4, sortOrder, categories))
			}
			
			Set uniquePlaces = places.unique()
			
			if (uniquePlaces == 0) {
				if (attempts > 2) {
					throw new IllegalStateException("Nothing to do here!")
				}
				attempts++
				return DRINK.execute(time, duration, distance)
			}
			
			//List placesList = uniquePlaces.toList().subList(0, Math.min(maxResults, uniquePlaces.size()))
			List placesList = uniquePlaces.toList()
			
			Frolic frolic = new Frolic()
			frolic.setCentreLon(lon)
			frolic.setCentreLat(lat)
			frolic.setLocation(location)
			frolic.setType("date")
			if (!placesList) {
				frolic.save()
				return frolic
			}
			
			println "FINAL LIST: " + placesList
						
			(0..placesList.size()).each {
				if (placesList.isEmpty()) {
					return
				}
				def nextPlace = popRandomFromList(placesList)
				println "NEXT PLACE: " + nextPlace
				if (nextPlace == null) {
					return
				}
				println nextPlace.id
				if (nextPlace.id != null) {
					frolic.addToPlace(nextPlace)
				}
			}
			frolic.setNumberOfPlaces(maxResults)
			println frolic.place
			try {
				frolic.save()
			}
			catch (Exception e) {
				e.printStackTrace()
			}
			return frolic
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
