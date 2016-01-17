package frolic

import java.text.Normalizer;

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
	
	def cityIntro = { attrs ->
		String city = attrs.city
		String neighbourhodd = attrs.neighbourhood
		
		city = Normalizer.normalize(city, Normalizer.Form.NFD).replaceAll("[\\p{InCombiningDiacriticalMarks}]", "")
		
		String imageFilename = city.replace(" ", "").toLowerCase() + ".jpg"
		String url = resource(dir:'assets/city', file:imageFilename)
		
		out << String.format(CITY_INTRO_TEMPLATE, url)
	}
}
