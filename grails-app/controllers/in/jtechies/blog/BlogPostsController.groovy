package in.jtechies.blog



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BlogPostsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
       // params.max = Math.min(max ?: 10, 100)
        respond BlogPosts.list(params).reverse(), model:[blogPostsInstanceCount: BlogPosts.count()]
    }

    def show(BlogPosts blogPostsInstance) {
        respond blogPostsInstance
    }

    def create() {
        respond new BlogPosts(params)
    }

    @Transactional
    def save(BlogPosts blogPostsInstance) {
        if (blogPostsInstance == null) {
            notFound()
            return
        }

        if (blogPostsInstance.hasErrors()) {
            respond blogPostsInstance.errors, view:'create'
            return
        }

        blogPostsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'blogPosts.label', default: 'BlogPosts'), blogPostsInstance.id])
                redirect blogPostsInstance
            }
            '*' { respond blogPostsInstance, [status: CREATED] }
        }
    }

    def edit(BlogPosts blogPostsInstance) {
        respond blogPostsInstance
    }

    @Transactional
    def update(BlogPosts blogPostsInstance) {
        if (blogPostsInstance == null) {
            notFound()
            return
        }

        if (blogPostsInstance.hasErrors()) {
            respond blogPostsInstance.errors, view:'edit'
            return
        }

        blogPostsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BlogPosts.label', default: 'BlogPosts'), blogPostsInstance.id])
                redirect blogPostsInstance
            }
            '*'{ respond blogPostsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BlogPosts blogPostsInstance) {

        if (blogPostsInstance == null) {
            notFound()
            return
        }

        blogPostsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BlogPosts.label', default: 'BlogPosts'), blogPostsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blogPosts.label', default: 'BlogPosts'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
