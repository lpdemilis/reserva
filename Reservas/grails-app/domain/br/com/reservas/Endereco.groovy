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
		logradouro + ", " + numero + "<br>" + complemento + "<br>" + bairro + "<br>" + cidade.toString() + "-" + cidade.estado.uf + "<br>" + cep
	}
}
