package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException

class ImagemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [imagemInstanceList: Imagem.list(params), imagemInstanceTotal: Imagem.count()]
    }

    def create() {
		if (!params.recurso?.id) {
			flash.message = message(code: 'default.recurso.not.found.message')
			redirect(action: "list")
			return
		}
        [imagemInstance: new Imagem(params)]
    }

    def save() {
        def imagemInstance = new Imagem(params)
        if (!imagemInstance.save(flush: true)) {
            render(view: "create", model: [imagemInstance: imagemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'imagem.label', default: 'Imagem'), imagemInstance.id])
        redirect(action: "show", id: imagemInstance.id)
    }

    def show(Long id) {
        def imagemInstance = Imagem.get(id)
        if (!imagemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagem.label', default: 'Imagem'), id])
            redirect(action: "list")
            return
        }

        [imagemInstance: imagemInstance]
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
