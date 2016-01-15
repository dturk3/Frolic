package frolic

class Place {
	
	String yelpId
	
	String name
	String address
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
	
	static hasMany = [tags: String]
	
    static constraints = {
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
