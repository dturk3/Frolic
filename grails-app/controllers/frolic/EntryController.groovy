package frolic

class EntryController {
	
	GeocodeService geocodeService
	
    def index() { 
		return render(template: "index", 
			model: [city: "Toronto"])
	}
	
	def geolocate() {
		GeocodeResponse geocodeResponse = geocodeService.geocode(params.lat, params.lon)
		return render(template: "geolocate",
			model: [
				city: geocodeResponse.city,
				neighbourhood: geocodeResponse.neighbourhood
			])
	}
}
