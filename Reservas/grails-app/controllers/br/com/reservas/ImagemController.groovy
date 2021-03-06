package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class ImagemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	
	def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [imagemInstanceList: Imagem.list(params), imagemInstanceTotal: Imagem.count()]
    }

	@Secured(['ROLE_USER'])
    def create() {
		if (!params.recurso?.id) {
			if(flash.message == null){
				flash.message = message(code: 'my.default.not.found.message', args: [message(code: 'recurso.label', default: 'recurso'), message(code: 'images.label', default: 'as imagens')])
			}else{
				flash.message += '</div><div class="message" role="status">' + message(code: 'my.default.not.found.message', args: [message(code: 'recurso.label', default: 'recurso'), message(code: 'images.label', default: 'as imagens')])
			}
			redirect(controller:"recurso", action: "create")
			return
		}
		
		Usuario usuario = springSecurityService.currentUser
		
		def recursoInstance = Recurso.get(params.recurso?.id)
		
		if(!recursoInstance.condominio.administradores.contains(usuario)){
			redirect(controller: "login", action: "denied")
			return
		}
		
        [imagemInstance: new Imagem(params)]
    }

	@Secured(['ROLE_USER'])
    def save() {
        def imagemInstance = new Imagem(params)
        if (!imagemInstance.save(flush: true)) {
            render(view: "create", model: [imagemInstance: imagemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'imagem.label', default: 'Imagem'), imagemInstance.id])
        //redirect(action: "show", id: imagemInstance.id)
		redirect(controller: "recurso", action: "show", id: imagemInstance.recurso.id)
    }

	@Secured(['ROLE_USER'])
    def show(Long id) {
        def imagemInstance = Imagem.get(id)
        if (!imagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagem.label', default: 'Imagem'), id])
            redirect(action: "list")
            return
        }
		
		Usuario usuario = springSecurityService.currentUser

        [imagemInstance: imagemInstance, ehAdministrador:usuario.ehAdministrador(imagemInstance.recurso.condominio)]
    }

    def edit(Long id) {
        def imagemInstance = Imagem.get(id)
        if (!imagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagem.label', default: 'Imagem'), id])
            redirect(action: "list")
            return
        }

        [imagemInstance: imagemInstance]
    }

    def update(Long id, Long version) {
        def imagemInstance = Imagem.get(id)
        if (!imagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagem.label', default: 'Imagem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (imagemInstance.version > version) {
                imagemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'imagem.label', default: 'Imagem')] as Object[],
                          "Another user has updated this Imagem while you were editing")
                render(view: "edit", model: [imagemInstance: imagemInstance])
                return
            }
        }

        imagemInstance.properties = params

        if (!imagemInstance.save(flush: true)) {
            render(view: "edit", model: [imagemInstance: imagemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'imagem.label', default: 'Imagem'), imagemInstance.id])
        redirect(action: "show", id: imagemInstance.id)
    }

    def delete(Long id) {
        def imagemInstance = Imagem.get(id)
        if (!imagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagem.label', default: 'Imagem'), id])
            redirect(action: "list")
            return
        }

        try {
            imagemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'imagem.label', default: 'Imagem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'imagem.label', default: 'Imagem'), id])
            redirect(action: "show", id: id)
        }
    }
	
	@Secured(['ROLE_USER'])
	def imagem() {
		Imagem imagemInstance = Imagem.get(params.id)
		if (!imagemInstance) {
		  response.sendError(404)
		  return
		}

		response.contentLength = imagemInstance.imagem.size()
		OutputStream out = response.outputStream
		out.write(imagemInstance.imagem)
		out.close()
	}
}
