package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ConvidadoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [convidadoInstanceList: Convidado.list(params), convidadoInstanceTotal: Convidado.count()]
    }

	@Secured(['ROLE_USER'])
    def create() {
		if (!params.reserva?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'reserva.label', default: 'reserva'), message(code: 'convidados.label', default: 'os convidados')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'reserva.label', default: 'reserva'), message(code: 'convidados.label', default: 'os convidados')])
			}
			redirect(controller:"reserva", action: "create")
			return
		}
        [convidadoInstance: new Convidado(params)]
    }

	@Secured(['ROLE_USER'])
    def save() {
        def convidadoInstance = new Convidado(params)
        if (!convidadoInstance.save(flush: true)) {
            render(view: "create", model: [convidadoInstance: convidadoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'convidado.label', default: 'Convidado'), convidadoInstance.id])
        redirect(action: "show", id: convidadoInstance.id)
    }

    def show(Long id) {
        def convidadoInstance = Convidado.get(id)
        if (!convidadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convidado.label', default: 'Convidado'), id])
            redirect(action: "list")
            return
        }

        [convidadoInstance: convidadoInstance]
    }

    def edit(Long id) {
        def convidadoInstance = Convidado.get(id)
        if (!convidadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convidado.label', default: 'Convidado'), id])
            redirect(action: "list")
            return
        }

        [convidadoInstance: convidadoInstance]
    }

    def update(Long id, Long version) {
        def convidadoInstance = Convidado.get(id)
        if (!convidadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convidado.label', default: 'Convidado'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (convidadoInstance.version > version) {
                convidadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'convidado.label', default: 'Convidado')] as Object[],
                          "Another user has updated this Convidado while you were editing")
                render(view: "edit", model: [convidadoInstance: convidadoInstance])
                return
            }
        }

        convidadoInstance.properties = params

        if (!convidadoInstance.save(flush: true)) {
            render(view: "edit", model: [convidadoInstance: convidadoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'convidado.label', default: 'Convidado'), convidadoInstance.id])
        redirect(action: "show", id: convidadoInstance.id)
    }

    def delete(Long id) {
        def convidadoInstance = Convidado.get(id)
        if (!convidadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convidado.label', default: 'Convidado'), id])
            redirect(action: "list")
            return
        }

        try {
            convidadoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'convidado.label', default: 'Convidado'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'convidado.label', default: 'Convidado'), id])
            redirect(action: "show", id: id)
        }
    }
}
