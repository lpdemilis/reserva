package br.com.reservas

class Plano {
	
	Date dataInicio
	Date dataFim
	BigDecimal valor
	Boolean ativo
	Integer nuMaxRecursos
	Integer nuMaxApartamentos
	Integer nuMaxCondominios
	
	static hasMany = [condominios:Condominio]
	
	static constraints = {
		dataInicio nullable:false
		dataFim nullable:true
		valor nullable:false
		ativo nullable:false
		nuMaxRecursos nullable:false
		nuMaxApartamentos nullable:false
		nuMaxCondominios nullable:false
    }
	
	static mapping = {
		ativo defaultValue:false
	}
}
