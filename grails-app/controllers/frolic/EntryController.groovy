package frolic

class EntryController {
	
	GeocodeService geocodeService
	
    def index() { 
		return render(template: "index", 
			model: [city: "Toronto"])
	}
	
	def geolocate() {
		if (params.newLocation) {
			GeocodeResponse geocodeResponse = geocodeService.geocode(params.newLocation)
			println geocodeResponse
			
			return render(template: "geolocate",
				model: [
					city: geocodeResponse.city,
					neighbourhood: geocodeResponse.neighbourhood,
					lon: params.lon,
					lat: params.lat
				])
		}
		
		GeocodeResponse geocodeResponse = geocodeService.geocode(params.lat, params.lon)
		println geocodeResponse
		
		return render(template: "geolocate",
			model: [
				city: geocodeResponse.city,
				neighbourhood: geocodeResponse.neighbourhood,
				lon: params.lon,
				lat: params.lat
			])
	}
}
