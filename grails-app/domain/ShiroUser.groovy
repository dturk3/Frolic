class ShiroUser {
    String username
    String passwordHash
	
	String displayName
	String name
	String email
	String city
	String gender
	
	int avatar
    
    static hasMany = [ roles: ShiroRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
		name(nullable: false, blank: false)
		displayName(nullable: false, blank: false)
		email(nullable: false, blank: false, unique: true)
		city(nullable: false, blank: false)
		gender(nullable: false, blank: false, inList: ['M', 'F', 'O'] as List)
		avatar(nullable: false, blank: false)
    }
	
	static mapping = {
		avatar defaultValue: 1
	}
}
