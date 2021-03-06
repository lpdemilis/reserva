package br.com.reservas

class Plano {
	
	Date dataInicio
	Date dataFim
	Boolean ativo
	TipoPlano tipoPlano
		
	static hasOne = [condominio: Condominio]
	
	static belongsTo = [usuario: Usuario]
	
	static constraints = {
		dataInicio nullable:false
		dataFim nullable:true
		ativo nullable:false
		tipoPlano nullable: false
		//condominio nullable: true
    }
	
	static mapping = {
		ativo defaultValue:true
	}
	
	String toString(){
		tipoPlano
	}
}
