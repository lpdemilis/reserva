package br.com.reservas

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ApartamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService

	@Secured(['ROLE_USER'])
	def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_USER'])
    def list(Integer max) {
		if(!params.condominio){
			if(!SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')){
				redirect(controller: "login", action: "denied")
				return
			}
		}
		
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(params.condominio)
		
		if(!condominioInstance.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
			return
		}
		        		
		def apartamentoCriteria = Apartamento.createCriteria()
		def apartamentoInstanceList = apartamentoCriteria.list(max: params.max?:10, offset: params.offset?:0){
			if(params.condominio && Long.valueOf(params.condominio) != 0){
				condominio{
					eq('id', Long.valueOf(params.condominio))
				}
			}			
		}
		
        [apartamentoInstanceList: apartamentoInstanceList, apartamentoInstanceTotal: apartamentoInstanceList.totalCount]
    }

	@Secured(['ROLE_USER'])
    def create() {
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(params.condominio?.id)
		
		if(!condominioInstance?.administradores?.contains(usuario)){
			redirect(controller: "login", action: "denied")
			return
		}
		
		
		if (!params.condominio?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'condominio.label', default: 'condom\u00EDnio'), message(code: 'apartamentos.label', default: 'os apartamentos')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'condominio.label', default: 'condom\u00EDnio'), message(code: 'apartamentos.label', default: 'os apartamentos')])
			}
			redirect(controller:"condominio", action: "create")
			return
		}
        [apartamentoInstance: new Apartamento(params)]
    }
	
	@Secured(['ROLE_USER'])
    def save() {
		def aux1
		def aux2
		ArrayList<Integer> apartamentos = new ArrayList<Integer>()
		
		aux1 = params.numero.split(';')		
		for (a1 in aux1) {
			aux2 = a1.split('-')
			if (aux2.size() == 1) {
				apartamentos.add(aux2.first().toInteger())
			}else{
				for(int i=aux2.first().toInteger(); i <= aux2.last().toInteger(); i++){
					apartamentos.add(i)
				}				
			}	
		}
		
		def blocos = params.bloco.split(';')
		
		def apartamentoInstance = new Apartamento()
		
		for (bloco in blocos) {
			for (numero in apartamentos) {
				apartamentoInstance = Apartamento.findByBlocoAndNumero(bloco, numero)
				if(!apartamentoInstance?.id){
					params.bloco = bloco
					params.numero = numero
					apartamentoInstance = new Apartamento(params)
					if (!apartamentoInstance.save()) {
						render(view: "create", model: [apartamentoInstance: apartamentoInstance])
						return
					}
				}
			}
		}		
		
		if (apartamentos.size() == 1){
			flash.message = message(code: 'default.created.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), apartamentoInstance.id])
			redirect(action: "show", id: apartamentoInstance.id)
		}else{
			flash.message = message(code: 'default.created.message', args: [message(code: 'apartamento.label', default: 'Grupo de Apartamentos'), ""])
			redirect(action: "list", params: [condominio: apartamentoInstance.condominio.id])
		}
    }

	@Secured(['ROLE_USER'])
    def show(Long id) {
        def apartamentoInstance = Apartamento.get(id)
        if (!apartamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "list")
            return
        }

        [apartamentoInstance: apartamentoInstance]
    }

	@Secured(['ROLE_USER'])
    def edit(Long id) {
        def apartamentoInstance = Apartamento.get(id)
        if (!apartamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "list")
            return
        }

        [apartamentoInstance: apartamentoInstance]
    }

	@Secured(['ROLE_USER'])
    def update(Long id, Long version) {
        def apartamentoInstance = Apartamento.get(id)
        if (!apartamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (apartamentoInstance.version > version) {
                apartamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'apartamento.label', default: 'Apartamento')] as Object[],
                          "Another user has updated this Apartamento while you were editing")
                render(view: "edit", model: [apartamentoInstance: apartamentoInstance])
                return
            }
        }

        apartamentoInstance.properties = params

        if (!apartamentoInstance.save(flush: true)) {
            render(view: "edit", model: [apartamentoInstance: apartamentoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), apartamentoInstance.id])
        redirect(action: "show", id: apartamentoInstance.id)
    }

	@Secured(['ROLE_USER'])
    def delete(Long id) {
        def apartamentoInstance = Apartamento.get(id)
        if (!apartamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "list")
            return
        }

        try {
            apartamentoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "show", id: id)
        }
    }
}
