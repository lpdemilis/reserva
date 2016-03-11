package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException

class MensalidadeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mensalidadeInstanceList: Mensalidade.list(params), mensalidadeInstanceTotal: Mensalidade.count()]
    }

    def create() {
        [mensalidadeInstance: new Mensalidade(params)]
    }

    def save() {
        def mensalidadeInstance = new Mensalidade(params)
		
		def boletoInstance = new Boleto(params)
		boletoInstance.save()
		mensalidadeInstance.boleto = boletoInstance
		
        if (!mensalidadeInstance.save(flush: true)) {
            render(view: "create", model: [mensalidadeInstance: mensalidadeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), mensalidadeInstance.id])
        redirect(action: "show", id: mensalidadeInstance.id)
    }

    def show(Long id) {
        def mensalidadeInstance = Mensalidade.get(id)
        if (!mensalidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), id])
            redirect(action: "list")
            return
        }

        [mensalidadeInstance: mensalidadeInstance]
    }

    def edit(Long id) {
        def mensalidadeInstance = Mensalidade.get(id)
        if (!mensalidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), id])
            redirect(action: "list")
            return
        }

        [mensalidadeInstance: mensalidadeInstance]
    }

    def update(Long id, Long version) {
        def mensalidadeInstance = Mensalidade.get(id)
        if (!mensalidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mensalidadeInstance.version > version) {
                mensalidadeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mensalidade.label', default: 'Mensalidade')] as Object[],
                          "Another user has updated this Mensalidade while you were editing")
                render(view: "edit", model: [mensalidadeInstance: mensalidadeInstance])
                return
            }
        }

        mensalidadeInstance.properties = params

        if (!mensalidadeInstance.save(flush: true)) {
            render(view: "edit", model: [mensalidadeInstance: mensalidadeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), mensalidadeInstance.id])
        redirect(action: "show", id: mensalidadeInstance.id)
    }

    def delete(Long id) {
        def mensalidadeInstance = Mensalidade.get(id)
        if (!mensalidadeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), id])
            redirect(action: "list")
            return
        }

        try {
            mensalidadeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mensalidade.label', default: 'Mensalidade'), id])
            redirect(action: "show", id: id)
        }
    }
}
