package frolic



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PlaceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Place.list(params), model:[placeInstanceCount: Place.count()]
    }

    def show(Place placeInstance) {
        respond placeInstance
    }

    def create() {
        respond new Place(params)
    }

    @Transactional
    def save(Place placeInstance) {
        if (placeInstance == null) {
            notFound()
            return
        }

        if (placeInstance.hasErrors()) {
            respond placeInstance.errors, view:'create'
            return
        }

        placeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'place.label', default: 'Place'), placeInstance.id])
                redirect placeInstance
            }
            '*' { respond placeInstance, [status: CREATED] }
        }
    }

    def edit(Place placeInstance) {
        respond placeInstance
    }

    @Transactional
    def update(Place placeInstance) {
        if (placeInstance == null) {
            notFound()
            return
        }

        if (placeInstance.hasErrors()) {
            respond placeInstance.errors, view:'edit'
            return
        }

        placeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Place.label', default: 'Place'), placeInstance.id])
                redirect placeInstance
            }
            '*'{ respond placeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Place placeInstance) {

        if (placeInstance == null) {
            notFound()
            return
        }

        placeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Place.label', default: 'Place'), placeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'place.label', default: 'Place'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
