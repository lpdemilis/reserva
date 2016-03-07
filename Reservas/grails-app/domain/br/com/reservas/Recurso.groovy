package br.com.reservas

class Recurso {
	
	String nome
	
	static hasMany = [reserva:Reserva]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		nome nullable:false 
    }
}
