package in.jtechies


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VideosController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Videos.list(params), model: [videosInstanceCount: Videos.count()]
    }

    def show(Videos videosInstance) {
        respond videosInstance
    }
    def showPoster(){
        Videos videosInstance=Videos.get(params.id)
       // OutputStream out=response.getOutputStream()
         //response.getOutputStream()<<videosInstance.videoPoster
        response.outputStream << videosInstance.videoPoster // write the image to the outputstream
        response.outputStream.flush()
       // response.getOutputStream().flush()
       // out.flush()
       /// out.close()

    }
    def showVideo(){
        Videos videosInstance=Videos.get(params.id)
        //OutputStream out=response.getOutputStream()
        response.outputStream<<videosInstance.videoFile
        render response.outputStream.flush()
        //out.close()
    }

    def create() {
        respond new Videos(params)
    }

    @Transactional
    def save(Videos videosInstance) {
        if (videosInstance == null) {
            notFound()
            return
        }

        if (videosInstance.hasErrors()) {
            respond videosInstance.errors, view: 'create'
            return
        }

        videosInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'videos.label', default: 'Videos'), videosInstance.id])
                redirect videosInstance
            }
            '*' { respond videosInstance, [status: CREATED] }
        }
    }

    def edit(Videos videosInstance) {
        respond videosInstance
    }

    @Transactional
    def update(Videos videosInstance) {
        if (videosInstance == null) {
            notFound()
            return
        }

        if (videosInstance.hasErrors()) {
            respond videosInstance.errors, view: 'edit'
            return
        }

        videosInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Videos.label', default: 'Videos'), videosInstance.id])
                redirect videosInstance
            }
            '*' { respond videosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Videos videosInstance) {

        if (videosInstance == null) {
            notFound()
            return
        }

        videosInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Videos.label', default: 'Videos'), videosInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'videos.label', default: 'Videos'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
