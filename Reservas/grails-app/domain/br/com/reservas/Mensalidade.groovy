package br.com.reservas

class Mensalidade {
	
	Integer mes
	Integer ano
	Boleto boleto
	
    static constraints = {
		mes nullable:false
		ano nullable:false 
		boleto nullable:false   
    }
}
