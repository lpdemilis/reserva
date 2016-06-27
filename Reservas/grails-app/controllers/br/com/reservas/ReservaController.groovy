package br.com.reservas

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.hibernate.Criteria
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ReservaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	
	@Secured(['ROLE_USER'])
	def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_USER'])
    def list(Integer max) {
        Usuario usuario = springSecurityService.currentUser
		
		params.max = Math.min(max ?: 10, 100)
		
		def reservaCriteria = Reserva.createCriteria()
		def reservaInstanceList = reservaCriteria.list(max: params.max?:10, offset: params.offset?:0){
			eq('usuario.id', usuario.id)
		}
		
		def condominioCriteria = Condominio.createCriteria()
		def condominioInstanceList = condominioCriteria.list(){
			createAlias('usuarios', 'usuarios', Criteria.LEFT_JOIN)
			createAlias("administradores", "administradores", Criteria.LEFT_JOIN)
						
			or {
				eq('administradores.id', usuario.id)
				eq('usuarios.id', usuario.id)
			}
		}
		
		List<Condominio> condominioInstanceListSelect = new ArrayList<Condominio>() 
		
		condominioInstanceListSelect.addAll(condominioInstanceList)
		
		def condominioInstance = new Condominio()
		condominioInstance.id = 0
		condominioInstance.nome = message(code: 'meus.condominios.label', default: 'Meus condom\u00EDnios')
		condominioInstanceListSelect.add(0, condominioInstance)
		
		if(SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')){
			condominioInstance = new Condominio()
			condominioInstance.id = -1
			condominioInstance.nome = message(code: 'todos.condominios.label', default: 'Todos os condom\u00EDnios')
			condominioInstanceListSelect.add(0, condominioInstance)
		}
		
		def recursoCriteria = Recurso.createCriteria()
		def recursoInstanceList = recursoCriteria.list(){
			or {
				for (condominio in condominioInstanceList) {
					eq('condominio.id', condominio.id)
				}
			}
		}
		
		def recursoInstance = new Recurso()
		recursoInstance.id = 0
		recursoInstance.nome = message(code: 'todos.recursos.label', default: 'Todos os recursos')
		recursoInstanceList.add(0, recursoInstance)
		
		Calendar c = Calendar.getInstance()
		c.add(Calendar.DAY_OF_MONTH, 90)
		
		CondominioController condominioController = new CondominioController()
		
		def verificarCriacaoCondominio = condominioController.verificarCriacaoCondominio()
						
        [reservaInstanceList: reservaInstanceList, reservaInstanceTotal: reservaInstanceList.totalCount, condominioInstanceList: condominioInstanceList, recursoInstanceList: recursoInstanceList, dataFim: c.getTime(), condominioInstanceTotal: condominioInstanceList.totalCount, verificarCriacaoCondominio:verificarCriacaoCondominio, condominioInstanceListSelect: condominioInstanceListSelect]
    }

	@Secured(['ROLE_USER'])
    def create() {
		if (!params.recurso?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'recurso.label', default: 'recurso'), message(code: 'reservas.label', default: 'as reservas')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'recurso.label', default: 'recurso'), message(code: 'reservas.label', default: 'as reservas')])
			}
			redirect(controller:"recurso", action: "create")
			return
		}
		
		Calendar c = Calendar.getInstance()
		if(params.anoEvento){
			c.set(Calendar.YEAR, Integer.valueOf(params.anoEvento)) 
			c.set(Calendar.MONTH, Integer.valueOf(params.mesEvento) - 1)
			c.set(Calendar.DAY_OF_MONTH, Integer.valueOf(params.diaEvento))
			c.set(Calendar.HOUR_OF_DAY, Integer.valueOf(params.horaEvento))
			c.set(Calendar.MINUTE, Integer.valueOf(params.minutoEvento))
			c.set(Calendar.SECOND, Integer.valueOf(params.segundoEvento))
		}
		
		Date dataInicioEvento = c.getTime()
						
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
				
				eq('aprovado', true)
			}
		}
								
		if ((!recursoInstance.condominio.verificarAdministrador()) && (!recursoInstance.condominio.verificarUsuario())) {
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
				
		List<Apartamento> apartamentoInstanceList = new ArrayList<Apartamento>()
		
		if(recursoInstance.condominio.verificarAdministrador()){
			apartamentoInstanceList = Apartamento.findAllByCondominio(recursoInstance.condominio)
		}else{
			for (conviteInstance in conviteInstanceList) {
				apartamentoInstanceList.add(conviteInstance.apartamento)
			}
		}
		
		def precision 
		
		if(recursoInstance.unidadeTempoReserva?.id == 3){ //dia
			precision = "day"
			c.add(Calendar.DAY_OF_YEAR, recursoInstance.tempoReserva - 1)
			c.add(Calendar.HOUR_OF_DAY, 23)
			c.add(Calendar.MINUTE, 59)
			c.add(Calendar.SECOND, 59)
		}else{
			precision = "minute"
			
			if(recursoInstance.unidadeTempoReserva?.id == 1){ //minuto
				c.add(Calendar.MINUTE, recursoInstance.tempoReserva)
			}
			
			if(recursoInstance.unidadeTempoReserva?.id == 2){ //hora
				c.add(Calendar.HOUR_OF_DAY, recursoInstance.tempoReserva)
			}
		}
		
		Date dataFimEvento = c.getTime()
		
		def reservaInstance = new Reserva(params) 
		
		reservaInstance.dataInicioEvento = dataInicioEvento 
		reservaInstance.dataFimEvento = dataFimEvento
		
		def recursoController = new RecursoController()
		
        [reservaInstance: reservaInstance, recursoInstance: recursoInstance, action: 'create', apartamentoInstanceList: apartamentoInstanceList, precision:precision, anoEvento: params.anoEvento, mesEvento: params.mesEvento, diaEvento: params.diaEvento, horaEvento: params.horaEvento, minutoEvento: params.minutoEvento, segundoEvento: params.segundoEvento, tipoCalendario: recursoController.tipoCalendario(recursoInstance)]
    }

	@Secured(['ROLE_USER'])
    def save() {
        def reservaInstance = new Reserva(params)
		
		Calendar c = Calendar.getInstance()
		c.setTime(reservaInstance.dataInicioEvento)
		
		if(reservaInstance?.recurso?.unidadeTempoReserva?.id == 3){ //dia
			c.add(Calendar.DAY_OF_YEAR, reservaInstance.recurso.tempoReserva - 1)
			c.add(Calendar.HOUR_OF_DAY, 23)
			c.add(Calendar.MINUTE, 59)
			c.add(Calendar.SECOND, 59)
		}else{
			if(reservaInstance?.recurso?.unidadeTempoReserva?.id == 1){ //minuto
				c.add(Calendar.MINUTE, reservaInstance?.recurso?.tempoReserva)
			}
			
			if(reservaInstance?.recurso?.unidadeTempoReserva?.id == 2){ //hora
				c.add(Calendar.HOUR_OF_DAY, reservaInstance?.recurso?.tempoReserva)
			}
		}
		
		Date dataFimEvento = c.getTime()
		
		reservaInstance.dataFimEvento = dataFimEvento
						
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
		
		def recursoController = new RecursoController()

        [reservaInstance: reservaInstance, recursoInstance: reservaInstance.recurso, tipoCalendario:recursoController.tipoCalendario(reservaInstance.recurso)]
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
	
	@Secured(['ROLE_USER'])
	def search(Integer max) {
		Usuario usuario = springSecurityService.currentUser
								
		def reservaCriteria = Reserva.createCriteria()
		def reservaInstanceList = reservaCriteria.list(max: params.max?:10, offset: params.offset?:0){
			and{
				if (params.recurso.id != "0"){
					eq("recurso.id", Long.valueOf(params.recurso.id))				
				}
				
				if(params.reserva == "0"){
					eq('usuario.id', usuario.id)
				}
				
				if(params.status_reserva == "1"){
					eq('aprovada', true)
				}else if(params.status_reserva == "2"){
					eq('cancelada', true)
				}else if(params.status_reserva == "3"){
					isNull('dataAprovacao')
				}
				
				between("dataInicioEvento", params.dataInicio, params.dataFim)
			}	
			
			if(Long.valueOf(params.condominio.id) > 0){
				recurso{
					condominio{
						eq('id', Long.valueOf(params.condominio.id))
					}
				}
			}
		}
		
		render(template: 'list', model:  [reservaInstanceList: reservaInstanceList, reservaInstanceTotal: reservaInstanceList.totalCount])		
	}	
}
