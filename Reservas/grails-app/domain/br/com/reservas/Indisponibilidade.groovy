package br.com.reservas

class Indisponibilidade {
	
	Date dataInicio
	Date dataFim
	String motivo
	Boolean ativo
	
	static belongsTo = [recurso:Recurso]

    static constraints = {
		dataInicio nullable:false 
		dataFim nullable:false 
		ativo nullable:false 
    }
	
	static mapping = {
		ativo defaultValue: true
	}
}
