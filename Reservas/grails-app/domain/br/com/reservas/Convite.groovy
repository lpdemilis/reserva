package br.com.reservas

class Convite {

	Usuario usuario
	Date dataConvite
	Date dataAceite
	String email
	
	static belongsTo = [apartamento:Apartamento]
	
    static constraints = {
		usuario nullable:true 
		dataConvite nullable:false 
		dataAceite nullable:true 
		email blank:false, nullable: false
    }
}
