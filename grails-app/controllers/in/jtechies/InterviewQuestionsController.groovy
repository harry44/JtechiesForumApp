package in.jtechies


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InterviewQuestionsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond InterviewQuestions.list(params), model: [interviewQuestionsInstanceCount: InterviewQuestions.count()]
    }

    def show(InterviewQuestions interviewQuestionsInstance) {
        respond interviewQuestionsInstance
    }

    def create() {
        respond new InterviewQuestions(params)
    }

    @Transactional
    def save(InterviewQuestions interviewQuestionsInstance) {
        if (interviewQuestionsInstance == null) {
            notFound()
            return
        }

        if (interviewQuestionsInstance.hasErrors()) {
            respond interviewQuestionsInstance.errors, view: 'create'
            return
        }

        interviewQuestionsInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'interviewQuestions.label', default: 'InterviewQuestions'), interviewQuestionsInstance.id])
                redirect interviewQuestionsInstance
            }
            '*' { respond interviewQuestionsInstance, [status: CREATED] }
        }
    }

    def edit(InterviewQuestions interviewQuestionsInstance) {
        respond interviewQuestionsInstance
    }

    @Transactional
    def update(InterviewQuestions interviewQuestionsInstance) {
        if (interviewQuestionsInstance == null) {
            notFound()
            return
        }

        if (interviewQuestionsInstance.hasErrors()) {
            respond interviewQuestionsInstance.errors, view: 'edit'
            return
        }

        interviewQuestionsInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'InterviewQuestions.label', default: 'InterviewQuestions'), interviewQuestionsInstance.id])
                redirect interviewQuestionsInstance
            }
            '*' { respond interviewQuestionsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(InterviewQuestions interviewQuestionsInstance) {

        if (interviewQuestionsInstance == null) {
            notFound()
            return
        }

        interviewQuestionsInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'InterviewQuestions.label', default: 'InterviewQuestions'), interviewQuestionsInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'interviewQuestions.label', default: 'InterviewQuestions'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
