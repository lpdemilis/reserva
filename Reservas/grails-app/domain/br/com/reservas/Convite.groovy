package br.com.reservas

class Convite {

	Usuario usuario
	Date dataConvite
	Date dataAceite
	String email
	Boolean usuarioSolicitou
	Boolean aprovado
	
	static belongsTo = [apartamento:Apartamento]
	
    static constraints = {
		usuario nullable:true 
		dataConvite nullable:false 
		dataAceite nullable:true 
		email blank:false, nullable: false
		usuarioSolicitou nullable: false
		aprovado nullable: true
    }
	
	static mapping = {
		usuarioSolicitou defaultValue:false
		aprovado defaultValue:null
	}
}
