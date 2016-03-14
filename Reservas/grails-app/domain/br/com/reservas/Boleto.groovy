package br.com.reservas

class Boleto {
	
	BigDecimal valor
	Date dataGeracao
	Date dataVencimento
	Date dataPagamento
	String codigo
	Boolean pago
	
	static belongsTo = [mensalidade:Mensalidade]

    static constraints = {
		valor nullable:false 
		dataGeracao nullable:false 
		dataVencimento nullable:false 
		codigo blank:false, nullable:false
		pago nullable:false 
    }
	
	static mapping = {
		pago defaultValue:false 
	}
}
