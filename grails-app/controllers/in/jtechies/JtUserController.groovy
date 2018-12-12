package in.jtechies

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JtUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond JtUser.list(params), model:[jtUserInstanceCount: JtUser.count()]
    }
    @Secured("permitAll")
    def show(JtUser jtUserInstance) {
        respond jtUserInstance
    }
@Secured("permitAll")
    def create() {
        respond new JtUser(params)
    }

    @Transactional
    @Secured("permitAll")
    def save(JtUser jtUserInstance) {
        if (jtUserInstance == null) {
            notFound()
            return
        }
        //if (jtUserInstance.validate()) {
            println "validation"+jtUserInstance.validate()
//            //if (User.loggedInUser.validatePassword(updatePasswordCO.password)) {
//                flash.message = "Password updated successfully"
//            } else {
//                updatePasswordCO.errors.rejectValue("password", "password.mismatch.current.password")
//            }
       // }

        if (jtUserInstance.hasErrors()) {
            flash.message=jtUserInstance.errors.rejectValue("emailId","already.exist")
            flash.message=jtUserInstance.errors.rejectValue("username","already.exist")
            respond jtUserInstance.errors, view:'create'
            return
        }

        jtUserInstance.save flush:true

        def roleUser
        if(params.userRole==null) {
            roleUser = JtRole.findByAuthority('ROLE_USER') ?: new JtRole(authority: 'ROLE_USER').save(flush: true)
        }else{
            roleUser = JtRole.findByAuthority(params?.userRole)
        }
        JtUserJtRole.create jtUserInstance, roleUser, true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jtUser.label', default: 'JtUser'), jtUserInstance.id])
                redirect jtUserInstance
            }
            '*' { respond jtUserInstance, [status: CREATED] }
        }
    }

    def edit(JtUser jtUserInstance) {
        respond jtUserInstance
    }

    @Transactional
    def update(JtUser jtUserInstance) {
        if (jtUserInstance == null) {
            notFound()
            return
        }

        if (jtUserInstance.hasErrors()) {
            respond jtUserInstance.errors, view:'edit'
            return
        }

        jtUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'JtUser.label', default: 'JtUser'), jtUserInstance.id])
                redirect jtUserInstance
            }
            '*'{ respond jtUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(JtUser jtUserInstance) {

        if (jtUserInstance == null) {
            notFound()
            return
        }

        jtUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'JtUser.label', default: 'JtUser'), jtUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jtUser.label', default: 'JtUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
