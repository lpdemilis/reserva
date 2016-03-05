package br.com.reserva

class Reserva {
	
	Date dataSolicitacao
	Date dataReserva
	Boolean aprovada
	Boolean cancelada
	
	static belongsTo = [usuario:Usuario, recurso:Recurso]

    static constraints = {
		dataSolicitacao nullable:false 
		dataReserva nullable:false 
		aprovada nullable:false 
		cancelada nullable:false 
    }
}
