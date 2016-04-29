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
//		"Valor: R\$ " + String.format("%.2f", (double)valor) + "<br>N&ordm; m&aacute;ximo de condom&iacute;nios: 01<br>N&ordm; m&aacute;ximo de apartamentos:  " + nuMaxApartamentos + "<br>N&ordm; m&aacute;ximo de recursos: " + nuMaxRecursos
		StringBuilder sb = new StringBuilder()
		
		if(valor){
			sb.append("Valor: R\$ ")
			sb.append(String.format("%.2f", (double)valor))
		}
		
		sb.append("<ul>")		

		sb.append("<li>")			 
		sb.append("N&ordm; m&aacute;ximo de condom&iacute;nios:")
		sb.append("01")
		sb.append("</li>")
		
		if(nuMaxApartamentos){
			sb.append("<li>")
			sb.append("N&ordm; m&aacute;ximo de apartamentos:")
			sb.append(nuMaxApartamentos)
			sb.append("</li>")
		}
		
		if(nuMaxRecursos){
			sb.append("<li>")
			sb.append("N&ordm; m&aacute;ximo de recursos:")
			sb.append(nuMaxRecursos)
			sb.append("</li>")
		}		
		
		sb.append("</ul>")
		//sb.toString()
		
		"<div class=\"tipoPlano-box-valor\">Valor: R\$ " + String.format("%.2f", (double)valor) + "</div>"
//		<div class="tipoPlano-box-valor-mes">${message(code: 'tipoPlano.valor.mes.label', default: 'por mês')}</div>
//		<div class="tipoPlano-box-descricao"><span class="marker"></span>${message(code: 'tipoPlano.nuCondominios.label', default: 'Nº máximo de condomínios: ')}<span>01</span></div>
//		<div class="tipoPlano-box-descricao"><span class="marker"></span>${message(code: 'tipoPlano.nuMaxApartamentos.label', default: 'Nº máximo de apartamentos: ')}<span>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxApartamentos")}</span></div>
//		<div class="tipoPlano-box-descricao"><span class="marker"></span>${message(code: 'tipoPlano.nuMaxRecursos.label', default: 'Nº máximo de recursos: ')}<span>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxRecursos")}</span></div>

	}
}
