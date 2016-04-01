package br.com.reservas

class Mensalidade {
	
	Integer mes
	Integer ano
	Plano plano
	
	static hasMany = [boleto:Boleto]
	
	static belongsTo = [condominio:Condominio]
	
    static constraints = {
		mes nullable:false
		ano nullable:false
		plano nullable:false 
    }
}
