package frolic

import grails.transaction.Transactional

@Transactional
class FrolicService {

    def test() {
		final YelpApi yelpApi = new YelpApi()
		println yelpApi.searchForBusinessesByLocation("bar", "toronto")
    }
}
