package br.com.reservas


class TipoPlano {
	Date dataCriacao
	Date dataEncerramento
	BigDecimal valor
	Boolean ativo
	Integer nuMaxRecursos
	Integer nuMaxApartamentos
	Integer nuMaxCondominios
	
	static constraints = {
		dataCriacao nullable:false
		dataEncerramento nullable:true
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