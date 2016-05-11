package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ConviteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [conviteInstanceList: Convite.list(params), conviteInstanceTotal: Convite.count()]
    }

	@Secured(['ROLE_USER'])
    def create() {
		if (!params.apartamento?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'apartamento.label', default: 'apartamento'), message(code: 'convites.label', default: 'os convites')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'apartamento.label', default: 'apartamento'), message(code: 'convites.label', default: 'os convites')])
			}
			redirect(controller:"apartamento", action: "create")
			return
		}
		
		Usuario usuario = springSecurityService.currentUser
		
		def apartamentoInstance = Apartamento.get(params.apartamento.id)
		
		if(!apartamentoInstance.condominio.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
			return
		}
		
        [conviteInstance: new Convite(params), condominioInstance: apartamentoInstance.condominio]
    }

	@Secured(['ROLE_USER'])
    def save() {
		if (!params.dataConvite) {
			def data = new Date()
			params.dataConvite = data
		}
		
		def conviteCriteria = Convite.createCriteria()
		def conviteInstanceList = conviteCriteria.list(max: params.max?:10, offset: params.offset?:0){
			and {
				eq('email', params.email)
				eq ('apartamento.id', Long.valueOf(params.apartamento.id))
			}
		}
		
		if (conviteInstanceList.size() > 0){
			flash.message = message(code: 'default.created.message', args: [message(code: 'convite.label', default: 'Convite'), conviteInstanceList.get(0).id])
			redirect(action: "show", id: conviteInstanceList.get(0).id)
		}else{
			Usuario usuarioInstance = Usuario.findByEmail(params.email)
			
			if(usuarioInstance){
				params.usuario = usuarioInstance
			}
		
			def conviteInstance = new Convite(params)
			
			if (!conviteInstance.save(flush: true)) {
				render(view: "create", model: [conviteInstance: conviteInstance])
				return
			}
			
			flash.message = message(code: 'default.created.message', args: [message(code: 'convite.label', default: 'Convite'), conviteInstance.id])
			redirect(action: "show", id: conviteInstance.id)	
		}
    }

	@Secured(['ROLE_USER'])
    def show(Long id) {
        def conviteInstance = Convite.get(id)
        if (!conviteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convite.label', default: 'Convite'), id])
            redirect(action: "list")
            return
        }

        [conviteInstance: conviteInstance]
    }

	@Secured(['ROLE_USER'])
    def edit(Long id) {
        def conviteInstance = Convite.get(id)
        if (!conviteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convite.label', default: 'Convite'), id])
            redirect(action: "list")
            return
        }

        [conviteInstance: conviteInstance]
    }

    def update(Long id, Long version) {
        def conviteInstance = Convite.get(id)
        if (!conviteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convite.label', default: 'Convite'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (conviteInstance.version > version) {
                conviteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'convite.label', default: 'Convite')] as Object[],
                          "Another user has updated this Convite while you were editing")
                render(view: "edit", model: [conviteInstance: conviteInstance])
                return
            }
        }

        conviteInstance.properties = params

        if (!conviteInstance.save(flush: true)) {
            render(view: "edit", model: [conviteInstance: conviteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'convite.label', default: 'Convite'), conviteInstance.id])
        redirect(action: "show", id: conviteInstance.id)
    }

    def delete(Long id) {
        def conviteInstance = Convite.get(id)
        if (!conviteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'convite.label', default: 'Convite'), id])
            redirect(action: "list")
            return
        }

        try {
            conviteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'convite.label', default: 'Convite'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'convite.label', default: 'Convite'), id])
            redirect(action: "show", id: id)
        }
    }
}
