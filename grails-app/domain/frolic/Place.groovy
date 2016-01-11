package frolic

class Place {
	
	String name
	String address

	static hasMany = [tags: String]
	
    static constraints = {
    }
}
