package br.com.reservas

import java.text.SimpleDateFormat

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
		
		Usuario usuario = springSecurityService.currentUser
		
        [recursoInstance: recursoInstance, ehAdministrador:usuario.ehAdministrador(recursoInstance.condominio), tipoCalendario:tipoCalendario(recursoInstance)]
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
		
		Usuario usuario = springSecurityService.currentUser
						
		if(!recursoInstance.condominio.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
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
	
	def listaIndisponibilidades(id){
		
		def recursoInstance = Recurso.get(id)
		
		StringBuilder indisponibilidadesSB = new StringBuilder()
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd")
				
		if(recursoInstance){
			for (indisponibilidade in recursoInstance.indisponibilidades) {
				//indisponibilidadesSB.append("var dataInicio = new Date('")
				//indisponibilidadesSB.append(indisponibilidade.dataInicio)
				//indisponibilidadesSB.append("');")
				//indisponibilidadesSB.append("var dataFim = new Date('")
				//indisponibilidadesSB.append(indisponibilidade.dataFim)
				//indisponibilidadesSB.append("');")
				//indisponibilidadesSB.append("if ((data >= dataInicio) && (data <= dataFim)){")
//				indisponibilidadesSB.append("\$(cell).css('background-color', 'blue');")
				//indisponibilidadesSB.append("\$(cell).addClass('disabled-day');")
				//indisponibilidadesSB.append("\$(cell).addClass('disabled-day-indisponivel');")
				//indisponibilidadesSB.append("}")
//				indisponibilidadesSB.append("{")
//				indisponibilidadesSB.append("title: '")
//				indisponibilidadesSB.append(recursoInstance.nome)
//				indisponibilidadesSB.append("',")
//				indisponibilidadesSB.append("start: '")
//				indisponibilidadesSB.append(sdf.format(indisponibilidade.dataInicio))
//				indisponibilidadesSB.append("'")
//				indisponibilidadesSB.append(",")
//				indisponibilidadesSB.append("end: '")
//				indisponibilidadesSB.append(sdf.format(indisponibilidade.dataFim))
//				indisponibilidadesSB.append("'")
//				indisponibilidadesSB.append(",")
//				indisponibilidadesSB.append("overlap: false,")
//				indisponibilidadesSB.append("rendering: 'background',")
//				indisponibilidadesSB.append("color: '#ff9f89'")
//				indisponibilidadesSB.append("},")
			}
		}
		
		indisponibilidadesSB.toString()
	}
	
	def listaReservas(id){
		
		def recursoInstance = Recurso.get(id)
		
		StringBuilder reservasSB = new StringBuilder()
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd")
		
		if(recursoInstance){
			for (reserva in recursoInstance.reserva) {
				reservasSB.append("{")
				reservasSB.append("id: '")
				reservasSB.append(reserva.id)
				reservasSB.append("',")
				reservasSB.append("title: '")
				reservasSB.append(reserva.apartamento)
				reservasSB.append("',")
				reservasSB.append("start: '")
				if (recursoInstance.unidadeTempoReserva.id == 3) {
					reservasSB.append(sdf.format(reserva.dataInicioEvento))
				}else{
					reservasSB.append(reserva.dataInicioEvento)
				}
				reservasSB.append("'")
				reservasSB.append(",")
				reservasSB.append("end: '")
				if (recursoInstance.unidadeTempoReserva.id == 3) {
					reservasSB.append(sdf.format(reserva.dataFimEvento))
				}else{
					reservasSB.append(reserva.dataFimEvento)
				}
				reservasSB.append("'")
				reservasSB.append(",")
				reservasSB.append("color: '")
				reservasSB.append(recursoInstance.cor)
				reservasSB.append("'")
				reservasSB.append("},")
			}
		}
		
		reservasSB.toString() 
	}
	
	def tipoCalendario(Recurso recursoInstance){
		def result
		
		switch(recursoInstance?.unidadeTempoReserva?.id){
			case 1: //minuto
				result = 'agendaWeek'
				break
			case 2: //hora
				result = 'agendaWeek'
				break
			case 3: //dia
				result = 'month'
				break
			default:
				result = 'month'
				break
		}   
		
		result
	}
}
