package br.com.reservas

class Reserva {
	
	Date dataSolicitacao
	Date dataReserva
	Boolean aprovada
	Boolean cancelada
	Date dataAprovacao
	Date dataCancelamento
	
	static hasMany = [convidados:Convidado]
	
	static belongsTo = [usuario:Usuario, recurso:Recurso]

    static constraints = {
		dataSolicitacao nullable:false 
		dataReserva nullable:false 
		aprovada nullable:false 
		cancelada nullable:false 
    }
}
