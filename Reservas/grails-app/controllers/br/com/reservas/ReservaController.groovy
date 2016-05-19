package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ReservaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reservaInstanceList: Reserva.list(params), reservaInstanceTotal: Reserva.count()]
    }

	@Secured(['ROLE_USER'])
    def create() {
		def recursoInstance = Recurso.get(params.recurso?.id)
		
		Usuario usuario = springSecurityService.currentUser
		
		if((!recursoInstance.condominio.usuarios.contains(usuario)) && (!recursoInstance.condominio.administradores.contains(usuario))){
			redirect(controller: "login", action: "denied")
			return
		} 
		
		def conviteCriteria = Convite.createCriteria()
		def conviteInstanceList = conviteCriteria.list(){
			and{ 
				eq('usuario.id', usuario.id)
				
				apartamento{
					condominio{
						eq('id', recursoInstance.condominio.id)
					}
				}
			}
		}
								
		if (conviteInstanceList.size() == 0) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'apartamento.label', default: 'apartamento'), message(code: 'reserva.label', default: 'a reserva')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'apartamento.label', default: 'apartamento'), message(code: 'reserva.label', default: 'a reserva')])
			}
			
			if(recursoInstance?.condominio){
				redirect(controller:"condominio", action: "show", id: recursoInstance.condominio.id)
			}else{
				redirect(controller:"condominio", action: "list")
			}
			return
		}
		
		if (!params.recurso?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'recurso.label', default: 'recurso'), message(code: 'reservas.label', default: 'as reservas')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'recurso.label', default: 'recurso'), message(code: 'reservas.label', default: 'as reservas')])
			}
			redirect(controller:"recurso", action: "create")
			return
		}
		
		List<Apartamento> apartamentoInstanceList = new ArrayList<Apartamento>()
		
		for (conviteInstance in conviteInstanceList) {
			apartamentoInstanceList.add(conviteInstance.apartamento)
		} 
		
        [reservaInstance: new Reserva(params), recursoInstance: recursoInstance, action: 'create', apartamentoInstanceList: apartamentoInstanceList]
    }

	@Secured(['ROLE_USER'])
    def save() {
        def reservaInstance = new Reserva(params)
						
		if(!params.usuario.id){
			Usuario usuario = springSecurityService.currentUser
			reservaInstance.usuario = usuario
		}
		
		if(reservaInstance.dataSolicitacao == null){
			reservaInstance.dataSolicitacao = new Date()
		}
		
        if (!reservaInstance.save(flush: true)) {
            render(view: "create", model: [reservaInstance: reservaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reservaInstance.id])
        redirect(action: "show", id: reservaInstance.id)
    }

	@Secured(['ROLE_USER'])
    def show(Long id) {
        def reservaInstance = Reserva.get(id)
        if (!reservaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
            redirect(action: "list")
            return
        }

        [reservaInstance: reservaInstance]
    }

    def edit(Long id) {
        def reservaInstance = Reserva.get(id)
        if (!reservaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
            redirect(action: "list")
            return
        }

        [reservaInstance: reservaInstance]
    }

    def update(Long id, Long version) {
        def reservaInstance = Reserva.get(id)
        if (!reservaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reservaInstance.version > version) {
                reservaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reserva.label', default: 'Reserva')] as Object[],
                          "Another user has updated this Reserva while you were editing")
                render(view: "edit", model: [reservaInstance: reservaInstance])
                return
            }
        }

        reservaInstance.properties = params

        if (!reservaInstance.save(flush: true)) {
            render(view: "edit", model: [reservaInstance: reservaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reserva.label', default: 'Reserva'), reservaInstance.id])
        redirect(action: "show", id: reservaInstance.id)
    }

    def delete(Long id) {
        def reservaInstance = Reserva.get(id)
        if (!reservaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
            redirect(action: "list")
            return
        }

        try {
            reservaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
            redirect(action: "show", id: id)
        }
    }
}
