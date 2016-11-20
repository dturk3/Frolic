package frolic

class Frolic {
	
	String permalink
	Date creationDate
	Integer upvotes
	Integer downvotes
	Boolean isPublic
	String centreLon
	String centreLat
	String location
	Integer numberOfPlaces
	String type
	frolic.ShiroUser creator
	
	List voter
	
	List place
	
	Frolic() {
		permalink = Util.generateStringOfLength(8)
		
		creationDate = new Date()
		upvotes = 0
		downvotes = 0
		isPublic = true
		numberOfPlaces = 0
	}
	
	static hasMany = [place: Place, voter: String]
	
    static constraints = {
		type blank: true, nullable: true
		creator blank: true, nullable: true
    }
	
	static mapping = {
		creationDate defaultValue: "now()"
		upvotes defaultValue: 0
		downvotes defaultValue: 0
		isPublic defaultValue: true
		numberOfPlaces defaultValue: 0
	}
}
