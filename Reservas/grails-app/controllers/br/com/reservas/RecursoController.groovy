package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException

class RecursoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [recursoInstanceList: Recurso.list(params), recursoInstanceTotal: Recurso.count()]
    }

    def create() {
		if (!params.condominio?.id) {
			flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'condominio.label', default: 'condom\u00EDnio'), message(code: 'recursos.label', default: 'os recursos')])
			redirect(controller:"condominio", action: "create")
			return
		}
        [recursoInstance: new Recurso(params)]
    }

    def save() {
        def recursoInstance = new Recurso(params)
        if (!recursoInstance.save(flush: true)) {
            render(view: "create", model: [recursoInstance: recursoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'recurso.label', default: 'Recurso'), recursoInstance.id])
        redirect(action: "show", id: recursoInstance.id)
    }

    def show(Long id) {
        def recursoInstance = Recurso.get(id)
        if (!recursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
            return
        }

        [recursoInstance: recursoInstance]
    }

    def edit(Long id) {
        def recursoInstance = Recurso.get(id)
        if (!recursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
            return
        }

        [recursoInstance: recursoInstance]
    }

    def update(Long id, Long version) {
        def recursoInstance = Recurso.get(id)
        if (!recursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (recursoInstance.version > version) {
                recursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'recurso.label', default: 'Recurso')] as Object[],
                          "Another user has updated this Recurso while you were editing")
                render(view: "edit", model: [recursoInstance: recursoInstance])
                return
            }
        }

        recursoInstance.properties = params

        if (!recursoInstance.save(flush: true)) {
            render(view: "edit", model: [recursoInstance: recursoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'recurso.label', default: 'Recurso'), recursoInstance.id])
        redirect(action: "show", id: recursoInstance.id)
    }

    def delete(Long id) {
        def recursoInstance = Recurso.get(id)
        if (!recursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
            return
        }

        try {
            recursoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "show", id: id)
        }
    }
}
