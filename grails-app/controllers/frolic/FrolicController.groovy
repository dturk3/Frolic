package frolic

class FrolicController {
	
	FrolicService frolicService
		
    def index() { 
		frolicService.test()
	}
}
