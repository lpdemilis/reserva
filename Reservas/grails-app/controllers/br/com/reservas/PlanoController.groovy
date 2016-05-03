package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class PlanoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
		
	def springSecurityService
	
	@Secured(['ROLE_USER'])
    def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_USER'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		Usuario usuario = springSecurityService.currentUser
		
		[planoInstanceList: Plano.list(params), planoInstanceTotal: Plano.count(), meusPlanosInstanceList: usuario.planos, meusPlanosInstanceTotal: usuario.planos.size()]
    }

	@Secured(['ROLE_USER'])
    def create() {
		Usuario usuario = springSecurityService.currentUser
		
        [planoInstance: new Plano(params), usuarioInstance: usuario]
    }

	@Secured(['ROLE_USER'])
    def save() {
		Condominio condominioInstance = new Condominio(params)
		Plano planoInstance = new Plano(params)
		Endereco enderecoInstance = new Endereco(params)
		
		if (!enderecoInstance.save()) {
			flash.message = message(code: 'default.created.message', args: [message(code: 'plano.label', default: 'Plano')])
			render(view: "create", model: [planoInstance: planoInstance])
		return
		}
		
		condominioInstance.endereco = enderecoInstance
		planoInstance.condominio = condominioInstance
		
		if (!planoInstance.save(flush: true)) {
			enderecoInstance.delete()
			flash.message = message(code: 'default.created.message', args: [message(code: 'plano.label', default: 'Plano')])
			render(view: "create", model: [planoInstance: planoInstance])
		return
		}
						
		Date data = new Date()
		
		Mensalidade mensalidadeInstance = new Mensalidade()
		mensalidadeInstance.mes = data.getAt(Calendar.MONTH)
		mensalidadeInstance.ano  = data.getAt(Calendar.YEAR)
		mensalidadeInstance.plano = planoInstance
		mensalidadeInstance.condominio = condominioInstance
		if (!mensalidadeInstance.save()) {
			enderecoInstance.delete()
			planoInstance.delete()
			flash.message = message(code: 'default.created.message', args: [message(code: 'plano.label', default: 'Plano')])
			render(view: "create", model: [planoInstance: planoInstance])
		return
		}
					
		Boleto boletoInstance = new Boleto()
		boletoInstance.valor = planoInstance.tipoPlano.valor
		boletoInstance.dataGeracao = data
		boletoInstance.dataVencimento = data
		boletoInstance.dataPagamento = null
		boletoInstance.codigo = 123456
		boletoInstance.pago = false
		boletoInstance.mensalidade = mensalidadeInstance
								
		if (!boletoInstance.save(flush: true)) {
			enderecoInstance.delete()
			planoInstance.delete()
			mensalidadeInstance.delete()
			flash.message = message(code: 'default.created.message', args: [message(code: 'plano.label', default: 'Plano')])
			render(view: "create", model: [planoInstance: planoInstance])
		return
		}
   
        flash.message = message(code: 'default.created.message', args: [message(code: 'plano.label', default: 'Plano'), planoInstance.id])
        redirect(action: "show", id: planoInstance.id)
    }

	@Secured(['ROLE_USER'])
    def show(Long id) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        [planoInstance: planoInstance]
    }

	def edit(Long id) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        [planoInstance: planoInstance]
    }

    def update(Long id, Long version) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (planoInstance.version > version) {
                planoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plano.label', default: 'Plano')] as Object[],
                          "Another user has updated this Plano while you were editing")
                render(view: "edit", model: [planoInstance: planoInstance])
                return
            }
        }

        planoInstance.properties = params

        if (!planoInstance.save(flush: true)) {
            render(view: "edit", model: [planoInstance: planoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plano.label', default: 'Plano'), planoInstance.id])
        redirect(action: "show", id: planoInstance.id)
    }

    def delete(Long id) {
        def planoInstance = Plano.get(id)
        if (!planoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
            return
        }

        try {
            planoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plano.label', default: 'Plano'), id])
            redirect(action: "show", id: id)
        }
    }
}
