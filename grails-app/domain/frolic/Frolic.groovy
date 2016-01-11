package frolic

class Frolic {
	
	String permalink
	Date creationDate
	Integer upvotes
	Integer downvotes
	Boolean isPublic
	
	static hasMany = [places: Place]

    static constraints = {
    }
}
