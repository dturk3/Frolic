package frolic

class Place {
	
	String yelpId
	
	String name
	String address
	String city
	String country
	String summary
	double lon
	double lat
	int rating
	int popularity
	String link
	String phone
	String imageUrl
	
	int hits
	int frolics
	int upvotes
	int downvotes
	
	List voter
	
	List tags
	
	static hasMany = [tags: String, voter: String]
	
    static constraints = {
		imageUrl blank: true, nullable: true
		link blank: true, nullable: true
		phone blank: true, nullable: true
    }
	
	static mapping = {
		rating defaultValue: 0
		popularity defaultValue: 0
		hits defaultValue: 0
		frolics defaultValue: 0
		upvotes defaultValue: 0
		downvotes defaultValue: 0
	 }
	
	@Override
	public String toString() {
		return name + " (" + lon + ", " + lat + ")"
	}
}
