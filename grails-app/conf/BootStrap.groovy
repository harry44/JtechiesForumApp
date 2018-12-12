import in.jtechies.JtRole
import in.jtechies.JtUser
import in.jtechies.JtUserJtRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = JtRole.findByAuthority('ROLE_ADMIN') ?: new JtRole(authority: 'ROLE_ADMIN').save(flush: true)
        //def mrRole = Role.findByAuthority('ROLE_MR') ?: new Role(authority: 'ROLE_MR').save(flush: true)
        //def asmRole = Role.findByAuthority('ROLE_ASM') ?: new Role(authority: 'ROLE_ASM').save(flush: true)
        //def rsmRole = Role.findByAuthority('ROLE_RSM') ?: new Role(authority: 'ROLE_RSM').save(flush: true)

        if (!JtUser.findByUsername('admin')) {
            def user1 = new JtUser(username: 'admin', password: 'admin',emailId: 'admin@jforum.com').save(flush: true)
            //def user1 = new User(username: 'admin', password: 'admin', tenant:tenant).save(flush: true)
            JtUserJtRole.create user1, adminRole, true
        }
    }
    def destroy = {
    }
}
