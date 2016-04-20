package br.com.reservas

class Endereco {

    String logradouro
	String complemento
	Integer numero
	String bairro
	String cep
	Cidade cidade
	
	//static belongsTo = [condominio: Condominio]
	
    static constraints = {
		logradouro nullable:false, blank:false
		complemento nullable:true
		numero nullable:false, blank:false
		bairro nullable:false, blank:false
		cep nullable:true
		cidade nullable:false, blank:false	 
    }
	
	String toString() {
		logradouro + " " + numero + " " + complemento + " " + bairro + " " + cidade.toString() + "-" + cidade.estado.toString() + " " + cep 
	}
	
	String toHTML() {
		StringBuilder sb = new StringBuilder()
		
		if(logradouro){
			sb.append(logradouro)
			
			if(numero){
				sb.append(", ")
				sb.append(numero)
			}
			
			sb.append("<br>")
		}
				
		if(complemento){
			 sb.append(complemento)
			 sb.append("<br>")
		}
		
		if(bairro){
			 sb.append(bairro)
			 sb.append("<br>")
		}
		
		if(cidade){
			sb.append(cidade.toString())
			if(cidade.estado.uf){
				sb.append("-")
				sb.append(cidade.estado.uf)
				sb.append("<br>")
			}
		}
		
		if(cep){
			sb.append(cep)
		}
		
		sb.toString()
	}
}
