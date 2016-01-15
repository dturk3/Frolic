package frolic

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class FrolicService {
	
	final static YelpApi yelpApi = new YelpApi()

    def searchYelp(String term, String location, String lon, String lat, int radiusMetres, int maxResults) {
		def yelpResult = JSON.parse(yelpApi.searchForBusinessesByLocation(term, location, lon, lat, radiusMetres))
		def places = []
		yelpResult.businesses.each { business ->
			def existingPlace = Place.findByYelpId(business.id)
			if (!existingPlace) {
				Place place = Place.create()
				place.setYelpId(business.id)
				place.setName(business.name)
				place.setSummary(business.snippet_text)
				place.setAddress(business.location?.display_address.join(" ").replace("\"", ""))
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
