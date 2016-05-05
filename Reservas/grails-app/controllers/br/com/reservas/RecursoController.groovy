package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class RecursoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	
	def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [recursoInstanceList: Recurso.list(params), recursoInstanceTotal: Recurso.count()]
    }

	@Secured(['ROLE_USER'])
    def create() {
		if (!params.condominio?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'condominio.label', default: 'condom\u00EDnio'), message(code: 'recursos.label', default: 'os recursos')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'condominio.label', default: 'condom\u00EDnio'), message(code: 'recursos.label', default: 'os recursos')])
			}
			redirect(controller:"condominio", action: "create")
			return
		}
		
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(params.condominio?.id)
		
		if(!condominioInstance.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
			return
		}
		
        [recursoInstance: new Recurso(params)]
    }

	@Secured(['ROLE_USER'])
    def save() {
        def recursoInstance = new Recurso(params)
        if (!recursoInstance.save(flush: true)) {
            render(view: "create", model: [recursoInstance: recursoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'recurso.label', default: 'Recurso'), recursoInstance.id])
        redirect(action: "show", id: recursoInstance.id)
    }

	@Secured(['ROLE_USER'])
    def show(Long id) {
        def recursoInstance = Recurso.get(id)
        if (!recursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
            return
        }

        [recursoInstance: recursoInstance]
    }

	@Secured(['ROLE_USER'])
    def edit(Long id) {
        def recursoInstance = Recurso.get(id)
        if (!recursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
            return
        }
		
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(recursoInstance.condominio?.id)
		
		if(!condominioInstance.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
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

	@Secured(['ROLE_USER'])
    def delete(Long id) {
        def recursoInstance = Recurso.get(id)
        if (!recursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "list")
            return
        }
		
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(recursoInstance.condominio?.id)
		
		if(!condominioInstance.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
			return
		}

        try {
            recursoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            //redirect(action: "list")
			redirect(controller: "condominio", action: "show", id: condominioInstance.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'recurso.label', default: 'Recurso'), id])
            redirect(action: "show", id: id)
        }
    }
}
