package br.com.reservas

class Apartamento {
	
	Integer numero
	String bloco 
	
	static hasMany = [convites:Convite]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		numero nullable:false
		bloco nullable:true 
		
		condominio(unique: ['numero','bloco'])
    }
	
	String toString(){
		numero + " " + bloco
	}
}
