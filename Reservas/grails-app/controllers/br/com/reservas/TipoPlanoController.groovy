package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class TipoPlanoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoPlanoInstanceList: TipoPlano.list(params), tipoPlanoInstanceTotal: TipoPlano.count()]
    }

    def create() {
        [tipoPlanoInstance: new TipoPlano(params)]
    }

    def save() {
        def tipoPlanoInstance = new TipoPlano(params)
        if (!tipoPlanoInstance.save(flush: true)) {
            render(view: "create", model: [tipoPlanoInstance: tipoPlanoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), tipoPlanoInstance.id])
        redirect(action: "show", id: tipoPlanoInstance.id)
    }

    def show(Long id) {
        def tipoPlanoInstance = TipoPlano.get(id)
        if (!tipoPlanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), id])
            redirect(action: "list")
            return
        }

        [tipoPlanoInstance: tipoPlanoInstance]
    }

    def edit(Long id) {
        def tipoPlanoInstance = TipoPlano.get(id)
        if (!tipoPlanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), id])
            redirect(action: "list")
            return
        }

        [tipoPlanoInstance: tipoPlanoInstance]
    }

    def update(Long id, Long version) {
        def tipoPlanoInstance = TipoPlano.get(id)
        if (!tipoPlanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoPlanoInstance.version > version) {
                tipoPlanoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoPlano.label', default: 'TipoPlano')] as Object[],
                          "Another user has updated this TipoPlano while you were editing")
                render(view: "edit", model: [tipoPlanoInstance: tipoPlanoInstance])
                return
            }
        }

        tipoPlanoInstance.properties = params

        if (!tipoPlanoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoPlanoInstance: tipoPlanoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), tipoPlanoInstance.id])
        redirect(action: "show", id: tipoPlanoInstance.id)
    }

    def delete(Long id) {
        def tipoPlanoInstance = TipoPlano.get(id)
        if (!tipoPlanoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoPlanoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoPlano.label', default: 'TipoPlano'), id])
            redirect(action: "show", id: id)
        }
    }
}
