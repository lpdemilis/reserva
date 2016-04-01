package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_USER'])
class PlanoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
		
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [planoInstanceList: Plano.list(params), planoInstanceTotal: Plano.count()]
    }

    def create() {
        [planoInstance: new Plano(params)]
    }

    def save() {
        def planoInstance = new Plano(params)
        if (!planoInstance.save(flush: true)) {
            render(view: "create", model: [planoInstance: planoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plano.label', default: 'Plano'), planoInstance.id])
        redirect(action: "show", id: planoInstance.id)
    }

    def show(Long id) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        [planoInstance: planoInstance]
    }

    def edit(Long id) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        [planoInstance: planoInstance]
    }

    def update(Long id, Long version) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (planoInstance.version > version) {
                planoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plano.label', default: 'Plano')] as Object[],
                          "Another user has updated this Plano while you were editing")
                render(view: "edit", model: [planoInstance: planoInstance])
                return
            }
        }

        planoInstance.properties = params

        if (!planoInstance.save(flush: true)) {
            render(view: "edit", model: [planoInstance: planoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plano.label', default: 'Plano'), planoInstance.id])
        redirect(action: "show", id: planoInstance.id)
    }

    def delete(Long id) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        try {
            planoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "show", id: id)
        }
    }
}
