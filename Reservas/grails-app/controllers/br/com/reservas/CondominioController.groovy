package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException

class CondominioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [condominioInstanceList: Condominio.list(params), condominioInstanceTotal: Condominio.count()]
    }

    def create() {
        [condominioInstance: new Condominio(params)]
    }

    def save() {
        def condominioInstance = new Condominio(params)
		
		def enderecoInstance = new Endereco(params)
		enderecoInstance.save()
		condominioInstance.endereco = enderecoInstance
				
        if (!condominioInstance.save(flush: true)) {
            render(view: "create", model: [condominioInstance: condominioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'condominio.label', default: 'Condominio'), condominioInstance.id])
        redirect(action: "show", id: condominioInstance.id)
    }

    def show(Long id) {
        def condominioInstance = Condominio.get(id)
        if (!condominioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "list")
            return
        }

        [condominioInstance: condominioInstance]
    }

    def edit(Long id) {
        def condominioInstance = Condominio.get(id)
        if (!condominioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "list")
            return
        }

        [condominioInstance: condominioInstance]
    }

    def update(Long id, Long version) {
        def condominioInstance = Condominio.get(id)
        if (!condominioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (condominioInstance.version > version) {
                condominioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'condominio.label', default: 'Condominio')] as Object[],
                          "Another user has updated this Condominio while you were editing")
                render(view: "edit", model: [condominioInstance: condominioInstance])
                return
            }
        }

        condominioInstance.properties = params

        if (!condominioInstance.save(flush: true)) {
            render(view: "edit", model: [condominioInstance: condominioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'condominio.label', default: 'Condominio'), condominioInstance.id])
        redirect(action: "show", id: condominioInstance.id)
    }

    def delete(Long id) {
        def condominioInstance = Condominio.get(id)
        if (!condominioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "list")
            return
        }

        try {
            condominioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "show", id: id)
        }
    }
}
