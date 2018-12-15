package in.jtechies.blog


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BlogUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BlogUser.list(params), model: [blogUserInstanceCount: BlogUser.count()]
    }


    def show(BlogUser blogUserInstance) {
        respond blogUserInstance
    }

    def create() {
        respond new BlogUser(params)
    }

    @Transactional
    def save(BlogUser blogUserInstance) {
        if (blogUserInstance == null) {
            notFound()
            return
        }

        if (blogUserInstance.hasErrors()) {
            respond blogUserInstance.errors, view: 'create'
            return
        }

        blogUserInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'blogUser.label', default: 'BlogUser'), blogUserInstance.id])
                redirect blogUserInstance
            }
            '*' { respond blogUserInstance, [status: CREATED] }
        }
    }

    def edit(BlogUser blogUserInstance) {
        respond blogUserInstance
    }

    @Transactional
    def update(BlogUser blogUserInstance) {
        if (blogUserInstance == null) {
            notFound()
            return
        }

        if (blogUserInstance.hasErrors()) {
            respond blogUserInstance.errors, view: 'edit'
            return
        }

        blogUserInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BlogUser.label', default: 'BlogUser'), blogUserInstance.id])
                redirect blogUserInstance
            }
            '*' { respond blogUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BlogUser blogUserInstance) {

        if (blogUserInstance == null) {
            notFound()
            return
        }

        blogUserInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BlogUser.label', default: 'BlogUser'), blogUserInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blogUser.label', default: 'BlogUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
