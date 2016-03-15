package br.com.reservas

import org.springframework.dao.DataIntegrityViolationException

class ApartamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		def apartamentoCriteria = Apartamento.createCriteria()
		def apartamentoInstanceList = apartamentoCriteria.list(max: params.max?:10, offset: params.offset?:0){
			if(params.condominio && Long.valueOf(params.condominio) != 0){
				condominio{
					eq('id', Long.valueOf(params.condominio))
				}
			}			
		}
		
        [apartamentoInstanceList: apartamentoInstanceList, apartamentoInstanceTotal: apartamentoInstanceList.size()]
    }

    def create() {
        [apartamentoInstance: new Apartamento(params)]
    }

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
				params.bloco = bloco
				params.numero = numero
				apartamentoInstance = new Apartamento(params)
				if (!apartamentoInstance.save()) {
					render(view: "create", model: [apartamentoInstance: apartamentoInstance])
					return
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

    def show(Long id) {
        def apartamentoInstance = Apartamento.get(id)
        if (!apartamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "list")
            return
        }

        [apartamentoInstance: apartamentoInstance]
    }

    def edit(Long id) {
        def apartamentoInstance = Apartamento.get(id)
        if (!apartamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apartamento.label', default: 'Apartamento'), id])
            redirect(action: "list")
            return
        }

        [apartamentoInstance: apartamentoInstance]
    }

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
