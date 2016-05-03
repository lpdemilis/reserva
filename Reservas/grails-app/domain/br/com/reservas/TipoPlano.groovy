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
		StringBuilder sb = new StringBuilder()
		
//		if(valor){
//			sb.append("Valor: R\$ ")
//			sb.append(String.format("%.2f", (double)valor))
//		}
//		
//		sb.append("<ul>")		
//
//		sb.append("<li>")			 
//		sb.append("N&ordm; m&aacute;ximo de condom&iacute;nios:")
//		sb.append("01")
//		sb.append("</li>")
//		
//		if(nuMaxApartamentos){
//			sb.append("<li>")
//			sb.append("N&ordm; m&aacute;ximo de apartamentos:")
//			sb.append(nuMaxApartamentos)
//			sb.append("</li>")
//		}
//		
//		if(nuMaxRecursos){
//			sb.append("<li>")
//			sb.append("N&ordm; m&aacute;ximo de recursos:")
//			sb.append(nuMaxRecursos)
//			sb.append("</li>")
//		}		
//		
//		sb.append("</ul>")
//		sb.toString()
			
		sb.append('<div class="tipoPlano-box">')
		sb.append('<div class="tipoPlano-box-valor">Valor: R\$ ')
		sb.append(String.format("%.2f", (double)valor))
		sb.append('</div>')
		sb.append('<div class="tipoPlano-box-valor-mes">por m&ecirc;s</div>')
		sb.append('<div class="tipoPlano-box-descricao"><span class="marker">►</span>N&ordm; m&aacute;ximo de condom&iacute;nios: <span>')
		sb.append('01')
		sb.append('</span></div>')
		sb.append('<div class="tipoPlano-box-descricao"><span class="marker">►</span>N&ordm; m&aacute;ximo de apartamentos: <span>')
		sb.append(nuMaxApartamentos)
		sb.append('</span></div>')
		sb.append('<div class="tipoPlano-box-descricao"><span class="marker">►</span>N&ordm; m&aacute;ximo de recursos: <span>')
		sb.append(nuMaxRecursos)
		sb.append('</span></div>')
		sb.append('</div>')
		
		sb.toString()
	}
}
