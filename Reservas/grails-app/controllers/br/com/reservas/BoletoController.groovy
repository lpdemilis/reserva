package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException

class BoletoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [boletoInstanceList: Boleto.list(params), boletoInstanceTotal: Boleto.count()]
    }

    def create() {
		if (!params.mensalidade?.id) {
			flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'mensalidade.label', default: 'mensalidade'), message(code: 'boleto.label', default: 'o boleto')])
			redirect(controller:"mensalidade", action: "create")
			return
		}
		
        [boletoInstance: new Boleto(params)]
    }

    def save() {
        def boletoInstance = new Boleto(params)
        if (!boletoInstance.save(flush: true)) {
            render(view: "create", model: [boletoInstance: boletoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'boleto.label', default: 'Boleto'), boletoInstance.id])
        redirect(action: "show", id: boletoInstance.id)
    }

    def show(Long id) {
        def boletoInstance = Boleto.get(id)
        if (!boletoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleto.label', default: 'Boleto'), id])
            redirect(action: "list")
            return
        }

        [boletoInstance: boletoInstance]
    }

    def edit(Long id) {
        def boletoInstance = Boleto.get(id)
        if (!boletoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleto.label', default: 'Boleto'), id])
            redirect(action: "list")
            return
        }

        [boletoInstance: boletoInstance]
    }

    def update(Long id, Long version) {
        def boletoInstance = Boleto.get(id)
        if (!boletoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleto.label', default: 'Boleto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (boletoInstance.version > version) {
                boletoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'boleto.label', default: 'Boleto')] as Object[],
                          "Another user has updated this Boleto while you were editing")
                render(view: "edit", model: [boletoInstance: boletoInstance])
                return
            }
        }

        boletoInstance.properties = params

        if (!boletoInstance.save(flush: true)) {
            render(view: "edit", model: [boletoInstance: boletoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'boleto.label', default: 'Boleto'), boletoInstance.id])
        redirect(action: "show", id: boletoInstance.id)
    }

    def delete(Long id) {
        def boletoInstance = Boleto.get(id)
        if (!boletoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'boleto.label', default: 'Boleto'), id])
            redirect(action: "list")
            return
        }

        try {
            boletoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'boleto.label', default: 'Boleto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'boleto.label', default: 'Boleto'), id])
            redirect(action: "show", id: id)
        }
    }
}
