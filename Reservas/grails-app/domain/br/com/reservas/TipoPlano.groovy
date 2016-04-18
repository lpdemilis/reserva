package br.com.reservas


class TipoPlano {
	Date dataCriacao
	Date dataEncerramento
	BigDecimal valor
	Boolean ativo
	Integer nuMaxRecursos
	Integer nuMaxApartamentos
	
	static constraints = {
		dataCriacao nullable:false
		dataEncerramento nullable:true
		valor nullable:false
		ativo nullable:false
		nuMaxRecursos nullable:false
		nuMaxApartamentos nullable:false
	}
	
	static mapping = {
		ativo defaultValue:false
	}
	
	String toString(){
		"R\$ " + String.format("%.2f", (double)valor) + " ( " + nuMaxApartamentos + " apartamentos e " + nuMaxRecursos + " recursos)"
	}
	
	String encodeAsHTML(){
		"Valor: R\$ " + String.format("%.2f", (double)valor) + "<br>N&ordm; m&aacute;ximo de condom&iacute;nios: 01<br>N&ordm; m&aacute;ximo de apartamentos:  " + nuMaxApartamentos + "<br>N&ordm; m&aacute;ximo de recursos: " + nuMaxRecursos
	}
}
