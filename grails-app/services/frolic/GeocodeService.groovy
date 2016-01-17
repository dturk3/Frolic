package frolic

import grails.transaction.Transactional

@Transactional
class GeocodeService {
	
	def API_KEY = "AIzaSyCly4CZBghd994spl4wnSzgKW9D2ovWw_I"

	def geocode(String newLocation) {
		GeocodeResponse responseObject = new GeocodeResponse()
		withHttp(uri: "https://maps.googleapis.com") {
			def geocodeResponse = get(
				path : '/maps/api/geocode/json',
				query : [
					address: newLocation,
					key: API_KEY
					],
				)
			println geocodeResponse
			if ( geocodeResponse.results != null && geocodeResponse.results.size() > 0 ) {
				def partial = geocodeResponse.results[0]
				responseObject.fromResponse(
					partial, 
					String.valueOf(partial.geometry.location.lng), 
					String.valueOf(partial.geometry.location.lat)
				)
			}
		}
		return responseObject
	}
	
    def geocode(String lat, String lng) {
		GeocodeResponse responseObject = new GeocodeResponse()
        withHttp(uri: "https://maps.googleapis.com") {
            def geocodeResponse = get(
				path : '/maps/api/geocode/json', 
				query : [
					latlng: lat + "," + lng,
					key: API_KEY
					],
				)
            if ( geocodeResponse.results != null && geocodeResponse.results.size() > 0 ) {
                def partial = geocodeResponse.results[0]
				responseObject.fromResponse(partial, lng, lat)
            }
        }
        return responseObject
    }

}
