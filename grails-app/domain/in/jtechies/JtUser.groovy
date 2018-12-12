package in.jtechies

class JtUser {

	transient springSecurityService

	String username
	String password
	String emailId
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		emailId email:true,nullable:false,validator: {val,obj->
			if(obj.id){
				if(JtUser.countByEmailIdAndIdNotEqual(val,obj.id)){
					 return "already.exist"
				}
			}else{
				if(JtUser.countByEmailId(val)>0){
					return "already.exist"
				}
			}
		}
	}

	static mapping = {
		password column: '`password`'
	}

	Set<JtRole> getAuthorities() {
		JtUserJtRole.findAllByJtUser(this).collect { it.jtRole }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
