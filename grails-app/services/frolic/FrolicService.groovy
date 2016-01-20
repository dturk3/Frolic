package frolic

import frolic.parameter.YelpSortMode;
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class FrolicService {
	
	final static YelpApi yelpApi = new YelpApi()

    def searchYelp(String term, String location, String lon, String lat, int radiusMetres, int maxResults, YelpSortMode sortMode, String categories) {
		def yelpResult = JSON.parse(yelpApi.searchForBusinessesByLocation(term, location, lon, lat, radiusMetres, sortMode, categories, maxResults))
		def places = []
		yelpResult.businesses.each { business ->
			def existingPlace = Place.findByYelpId(business.id)
			if (!existingPlace) {
				Place place = Place.create()
				place.setYelpId(business.id)
				place.setName(business.name)
				place.setSummary(business.snippet_text)
				place.setCity(business.location?.city)
				place.setCountry(business.location?.country_code)
				place.setAddress(business.location?.display_address.join(" ").replace("\"", ""))
				println business.location.coordinate
				place.setLon(business.location?.coordinate?.longitude)
				place.setLat(business.location?.coordinate?.latitude)
				place.setLink(business.url)
				place.setPhone(business.display_phone)
				place.setRating((int)business.rating)
				place.setPopularity((int)business.review_count)
				place.setImageUrl(business.image_url)
				place.save()
				existingPlace = place
			}
			existingPlace.setHits(existingPlace.getHits() + 1)
			places << existingPlace
		}
		return places
    }
}
