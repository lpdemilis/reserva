package br.com.reservas

class Recurso {
	
	String nome
	Boolean exigeConfirmacao
	Integer numeroMaxReservas
	String descricao
	Boolean ativo
	
	static hasMany = [reserva:Reserva]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		nome nullable:false
		exigeConfirmacao nullable:false 
		numeroMaxReservas nullable:false
		ativo nullable:false   
    }
	
	static mapping = {
		exigeConfirmacao defaultValue: true
		numeroMaxReservas defaultValue: 1
		ativo defaultValue: true
	}
}
