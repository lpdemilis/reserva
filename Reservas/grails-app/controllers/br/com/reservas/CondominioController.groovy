package br.com.reservas

import org.hibernate.Criteria
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

//@Secured(['ROLE_ADMIN'])
class CondominioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService

	@Secured(['ROLE_USER'])
    def index() {
        redirect(action: "list", params: params)
    }
	
	@Secured(['ROLE_USER'])
    def list(Integer max) {
		def usuario = springSecurityService.currentUser
		
		def verificarCriacaoCondominio = verificarCriacaoCondominio()
		
		def condominioCriteria = Condominio.createCriteria()
		def condominioInstanceList = condominioCriteria.list(max: params.max?:10, offset: params.offset?:0){
			createAlias('usuarios', 'usuarios', Criteria.LEFT_JOIN)
			createAlias("administradores", "administradores", Criteria.LEFT_JOIN)
						
			or {
				eq('administradores.id', usuario.id)
				eq('usuarios.id', usuario.id)
			}
		}
				
        [condominioInstanceList: condominioInstanceList, condominioInstanceTotal: condominioInstanceList.size(), verificarCriacaoCondominio:verificarCriacaoCondominio]
    }

    def create() {
		if (!params.plano?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'plano.label', default: 'plano'), message(code: 'condominio.label', default: 'o condom\u00EDnio')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'plano.label', default: 'plano'), message(code: 'condominio.label', default: 'o condom\u00EDnio')])
			}
			redirect(controller:"tipoPlano", action: "list")
			return
		}
		
		Usuario usuario = springSecurityService.currentUser
						
		def planoCriteria = Plano.createCriteria()
		def meusPlanosInstanceList = planoCriteria.list(max: params.max?:10, offset: params.offset?:0){
			and{
				eq('usuario.id', usuario.id)			
				isNull("condominio")
			}
		}
				
        [condominioInstance: new Condominio(params), meusPlanosInstanceList: meusPlanosInstanceList]
    }

    def save() {
        def condominioInstance = new Condominio(params)
		
		def enderecoInstance = new Endereco(params)
		//enderecoInstance.save()
		condominioInstance.endereco = enderecoInstance
				
        if (!condominioInstance.save(flush: true)) {
            render(view: "create", model: [condominioInstance: condominioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'condominio.label', default: 'Condominio'), condominioInstance.id])
        redirect(action: "show", id: condominioInstance.id)
    }

	@Secured(['ROLE_USER'])
    def show(Long id) {
        def condominioInstance = Condominio.get(id)
        if (!condominioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "list")
            return
        }
		
		def verificarCriacaoCondominio = verificarCriacaoCondominio()
		
		Usuario usuario = springSecurityService.currentUser
				
        [condominioInstance: condominioInstance, verificarCriacaoCondominio: verificarCriacaoCondominio, ehAdministrador:usuario.ehAdministrador(condominioInstance)]
    }

	@Secured(['ROLE_USER'])
    def edit(Long id) {
		def condominioInstance = Condominio.get(id)
        if (!condominioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condominio.label', default: 'Condominio'), id])
            redirect(action: "list")
            return
        }
		
		Usuario usuario = springSecurityService.currentUser
		
		if(!condominioInstance.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
			return
		}
		
		def cidadeCriteria = Cidade.createCriteria()
		def cidadeInstanceList = cidadeCriteria.list(){
			eq('estado.id', condominioInstance.endereco.cidade.estado.id)			
		}
		
		def verificarCriacaoCondominio = verificarCriacaoCondominio()
				
        [condominioInstance: condominioInstance, cidadeInstanceList: cidadeInstanceList, cidadeInstance: condominioInstance.endereco.cidade, verificarCriacaoCondominio: verificarCriacaoCondominio]
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
		
		condominioInstance.endereco.properties = params

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
	
	def verificarCriacaoCondominio() {
		Usuario usuario = springSecurityService.currentUser
		def nuCondominiosDisponiveis = 0
		
		for (Plano plano in usuario.planos) {			
			if (plano != null){
				if (plano.condominio == null){
					nuCondominiosDisponiveis++
				}
			}			
		} 
		
		if (nuCondominiosDisponiveis > 0) {
			return true
		}
		
		return false
	}
	
	def verificarAdministrador(Long id) {
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(id)
		
		
		if(condominioInstance?.administradores.contains(usuario)){
			return true		
		}
		
		return false
	}
	
	def verificarUsuario(Long id) {
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(id)
		
		
		if(condominioInstance?.usuarios.contains(usuario)){
			return true
		}
		
		return false
	}
	
	def verificarConvite(Long id) {
		Usuario usuario = springSecurityService.currentUser
		
		def condominioInstance = Condominio.get(id)
		
		for (convite in condominioInstance?.convites) {
			if (convite.usuario.id == usuario.id) {
				return true
			}
		}	
		
		return false
	}
	
	static String WILDCARD = "*"
	def searchableService
	
	/**
	 * Index page with search form and results
	 */
	def search = {
		println params
		def condominioCriteria = Condominio.createCriteria()
		def condominioInstanceList = condominioCriteria.list(max: params.max?:10, offset: params.offset?:0){
			endereco {
				cidade {
					eq("id", Long.parseLong(params.cidade.id))
				}
			}
			
			like("nome", '%' + params.nome + '%')
		}
				
		render(template: 'list', model:  [condominioInstanceList: condominioInstanceList, condominioInstanceTotal: condominioInstanceList.size()])
		
//		if (!params.q?.trim()) {
//			return [:]
//		}
//		try {
//			String searchTerm = WILDCARD + params.q + WILDCARD
//			
//			def searchResult = Condominio.search(searchTerm, params)
//												
//			List<Condominio> condominioInstanceList = new ArrayList<Condominio>()
//						
//			for (result in searchResult.results) {
//				def condominioInstance = Condominio.get(result.id)
//				condominioInstanceList.add(condominioInstance) 
//			}
//						
//			render(template: 'list', model:  [condominioInstanceList: condominioInstanceList, condominioInstanceTotal: condominioInstanceList.size()])
//		} catch (SearchEngineQueryParseException ex) {
//			return [parseException: true]
//		}
	}

	/**
	 * Perform a bulk index of every searchable object in the database
	 */
	def indexAll = {
		Thread.start {
			searchableService.index()
		}
		render("bulk index started in a background thread")
	}

	/**
	 * Perform a bulk index of every searchable object in the database
	 */
	def unindexAll = {
		searchableService.unindex()
		render("unindexAll done")
	}
}
