package frolic

class FrolicController {
	
	FrolicService frolicService
		
    def index() { 
		def results = frolicService.searchYelp("tacos", "grange park toronto", "43.7000", "79.4000", 800, 5)
		println results
	}
}
