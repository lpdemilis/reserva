package br.com.reservas

class Apartamento {
	
	Integer numero
	String bloco 
	
	static hasMany = [convites:Convite]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		numero nullable:false
		bloco nullable:true  
    }
	
	String toString(){
		numero + " " + bloco
	}
}
