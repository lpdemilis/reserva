package br.com.reservas

class Recurso {
	
	String nome
	Boolean exigeConfirmacao
	Integer numeroMaxReservas
	
	static hasMany = [reserva:Reserva]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		nome nullable:false
		exigeConfirmacao nullable:false 
		numeroMaxReservas nullable:false  
    }
}
