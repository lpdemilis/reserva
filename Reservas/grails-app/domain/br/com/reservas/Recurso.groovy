package br.com.reservas

class Recurso {
	
	String nome
	Boolean exigeConfirmacao
	Integer numeroMaxReservas
	String descricao
	Boolean ativo
	BigDecimal valor
	Integer capacidade
	Integer tempoReserva
	
	static hasMany = [reserva:Reserva, indisponibilidades:Indisponibilidade]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		nome nullable:false
		exigeConfirmacao nullable:false 
		numeroMaxReservas nullable:false
		ativo nullable:false   
		tempoReserva nullable: false
		valor scale: 2
		capacidade nullable:true 
    }
	
	static mapping = {
		exigeConfirmacao defaultValue: true
		numeroMaxReservas defaultValue: 1
		ativo defaultValue: true
		tempoReserva defaultValue: 24		
	}
	
	String toString(){
		nome
	}
}
