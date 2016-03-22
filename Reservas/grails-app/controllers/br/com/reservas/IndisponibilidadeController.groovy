package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException

class IndisponibilidadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [indisponibilidadeInstanceList: Indisponibilidade.list(params), indisponibilidadeInstanceTotal: Indisponibilidade.count()]
    }

    def create() {
		if (!params.recurso?.id) {
			flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'recurso.label', default: 'recurso'), message(code: 'indisponibilidades.label', default: 'as indisponibilidades')])
			redirect(controller:"recurso", action: "create")
			return
		}
        [indisponibilidadeInstance: new Indisponibilidade(params)]
    }

    def save() {
        def indisponibilidadeInstance = new Indisponibilidade(params)
        if (!indisponibilidadeInstance.save(flush: true)) {
            render(view: "create", model: [indisponibilidadeInstance: indisponibilidadeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), indisponibilidadeInstance.id])
        redirect(action: "show", id: indisponibilidadeInstance.id)
    }

    def show(Long id) {
        def indisponibilidadeInstance = Indisponibilidade.get(id)
        if (!indisponibilidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), id])
            redirect(action: "list")
            return
        }

        [indisponibilidadeInstance: indisponibilidadeInstance]
    }

    def edit(Long id) {
        def indisponibilidadeInstance = Indisponibilidade.get(id)
        if (!indisponibilidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), id])
            redirect(action: "list")
            return
        }

        [indisponibilidadeInstance: indisponibilidadeInstance]
    }

    def update(Long id, Long version) {
        def indisponibilidadeInstance = Indisponibilidade.get(id)
        if (!indisponibilidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (indisponibilidadeInstance.version > version) {
                indisponibilidadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'indisponibilidade.label', default: 'Indisponibilidade')] as Object[],
                          "Another user has updated this Indisponibilidade while you were editing")
                render(view: "edit", model: [indisponibilidadeInstance: indisponibilidadeInstance])
                return
            }
        }

        indisponibilidadeInstance.properties = params

        if (!indisponibilidadeInstance.save(flush: true)) {
            render(view: "edit", model: [indisponibilidadeInstance: indisponibilidadeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), indisponibilidadeInstance.id])
        redirect(action: "show", id: indisponibilidadeInstance.id)
    }

    def delete(Long id) {
        def indisponibilidadeInstance = Indisponibilidade.get(id)
        if (!indisponibilidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), id])
            redirect(action: "list")
            return
        }

        try {
            indisponibilidadeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade'), id])
            redirect(action: "show", id: id)
        }
    }
}
