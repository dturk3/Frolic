package frolic

import java.text.Normalizer;
import java.util.logging.Logger;

class FrolicTagLib {
//    static defaultEncodeAs = [taglib:'html']
	static namespace = "frolic"
	
	static CITY_INTRO_TEMPLATE = """
		    <style>
				.intro {
					display: table;
					width: 100%%;
					height: auto;
					padding: 220px 0;
					text-align: center;
					color: #fff;
					background: url(%s) no-repeat bottom center scroll;
					background-color: #000;
					-webkit-background-size: cover;
					-moz-background-size: cover;
					background-size: cover;
					-o-background-size: cover;
				}
		    </style>
		"""
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	
	def CITY_LIST = [
		"albuquerque",
		"amsterdam",
		"austin",
		"baltimore",
		"barcelona",
		"boston",
		"budapest",
		"calgary",
		"charlotte",
		"chicago",
		"cleveland",
		"columbus",
		"dallas",
		"denver",
		"detroit",
		"edmonton",
		"elpaso",
		"florence",
		"fortworth",
		"halifax",
		"hamilton",
		"houston",
		"indianapolis",
		"jacksonville",
		"kiev",
		"lasvegas",
		"laval",
		"london",
		"losangeles",
		"memphis",
		"miami",
		"minneapolis",
		"mississauga",
		"montreal",
		"nashville",
		"neworleans",
		"newyork",
		"oklahomacity",
		"ottawa",
		"paris",
		"philadelphia",
		"phoenix",
		"portland",
		"prague",
		"quebeccity",
		"raleigh",
		"regina",
		"rome",
		"sanantonio",
		"sandiego",
		"sanfrancisco",
		"sanjose",
		"santafe",
		"saskatoon",
		"seattle",
		"st.john's",
		"st.paul",
		"surrey",
		"tampa",
		"toronto",
		"vancouver",
		"venice",
		"washington",
		"winnipeg"
	]
		
	def cityIntro = { attrs ->
		String city = attrs.city
		String neighbourhodd = attrs.neighbourhood
		
		city = Normalizer.normalize(city, Normalizer.Form.NFD).replaceAll("[\\p{InCombiningDiacriticalMarks}]", "")
		city = city.replace(" ", "").toLowerCase()

		if (!(city in CITY_LIST)) {
			city = "other"
		}
		
		String imageFilename = city + ".jpg"
		String url = resource(dir:'assets/city', file:imageFilename)
		
		
		
		out << String.format(CITY_INTRO_TEMPLATE, url)
	}
}
