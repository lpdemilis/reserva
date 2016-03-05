package br.com.reserva

class Recurso {
	
	String nome
	
	static hasMany = [reserva:Reserva]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		nome nullable:false 
    }
}
