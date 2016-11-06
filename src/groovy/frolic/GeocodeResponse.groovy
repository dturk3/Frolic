package frolic

class GeocodeResponse {
	def city = ""
	def neighbourhood = ""
	def longitude = ""
	def latitude = ""
	
	def fromResponse(Map geocodeResponse, String lon, String lat) {
		longitude = lon
		latitude = lat
		geocodeResponse.address_components.each { component ->
			if (component?.types?.contains("locality")) {
				city = component.long_name
			}
			if (component?.types?.contains("neighborhood")) {
				neighbourhood = component.long_name
			}
			if (!neighbourhood) {
				neighbourhood = "-"
			}
		}
	}
	@Override
	public String toString() {
		return neighbourhood + ", " + city + " (" + longitude + ", " + latitude + ")"
	}	
}
