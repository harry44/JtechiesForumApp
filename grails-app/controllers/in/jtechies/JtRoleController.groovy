package in.jtechies



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JtRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond JtRole.list(params), model:[jtRoleInstanceCount: JtRole.count()]
    }

    def show(JtRole jtRoleInstance) {
        respond jtRoleInstance
    }

    def create() {
        respond new JtRole(params)
    }

    @Transactional
    def save(JtRole jtRoleInstance) {
        if (jtRoleInstance == null) {
            notFound()
            return
        }

        if (jtRoleInstance.hasErrors()) {
            respond jtRoleInstance.errors, view:'create'
            return
        }

        jtRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jtRole.label', default: 'JtRole'), jtRoleInstance.id])
                redirect jtRoleInstance
            }
            '*' { respond jtRoleInstance, [status: CREATED] }
        }
    }

    def edit(JtRole jtRoleInstance) {
        respond jtRoleInstance
    }

    @Transactional
    def update(JtRole jtRoleInstance) {
        if (jtRoleInstance == null) {
            notFound()
            return
        }

        if (jtRoleInstance.hasErrors()) {
            respond jtRoleInstance.errors, view:'edit'
            return
        }

        jtRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'JtRole.label', default: 'JtRole'), jtRoleInstance.id])
                redirect jtRoleInstance
            }
            '*'{ respond jtRoleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(JtRole jtRoleInstance) {

        if (jtRoleInstance == null) {
            notFound()
            return
        }

        jtRoleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'JtRole.label', default: 'JtRole'), jtRoleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jtRole.label', default: 'JtRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
