package frolic

class Frolic {
	
	String permalink
	Date creationDate
	Integer upvotes
	Integer downvotes
	Boolean isPublic
	
	static create() {
		Frolic instance = Frolic.create()
		instance.creationDate = new Date()
		instance.upvotes = 0
		instance.downvotes = 0
		instance.isPublic = true
		instance.permalink = Util.generateStringOfLength(8)
	}
	
	static hasMany = [places: Place]

    static constraints = {
    }
}
