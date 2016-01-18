package frolic

class Frolic {
	
	String permalink
	Date creationDate
	Integer upvotes
	Integer downvotes
	Boolean isPublic
	String centreLon;
	String centreLat;
	
	List place
	
	Frolic() {
		permalink = Util.generateStringOfLength(8)
		
		creationDate = new Date()
		upvotes = 0
		downvotes = 0
		isPublic = true
	}
	
	static hasMany = [place: Place]

    static constraints = {
    }
	
	static mapping = {
		creationDate defaultValue: "now()"
		upvotes defaultValue: 0
		downvotes defaultValue: 0
		isPublic defaultValue: true
	}
}
