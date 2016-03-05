package br.com.reserva

class Recurso {
	
	String nome
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		nome nullable:false 
    }
}
