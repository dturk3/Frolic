package frolic
class ShiroUser {
    String username
    String passwordHash
	
	String displayName
	String name
	String email
	String city
	String gender
	
	String avatarName
    
    static hasMany = [ roles: ShiroRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
		name(nullable: false, blank: false)
		displayName(nullable: false, blank: false)
		email(nullable: false, blank: false, unique: true)
		city(nullable: false, blank: false)
		gender(nullable: false, blank: false, inList: ['M', 'F', 'O'] as List)
		avatarName(nullable: true, blank: true)
    }
}
