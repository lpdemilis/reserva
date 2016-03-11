package br.com.reservas

class Apartamento {
	
	Integer numero
	String bloco 
	
	static hasMany = [usuarios:Usuario]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		numero nullable:false
		bloco nullable:true  
    }
	
	String toString(){
		numero + " " + bloco
	}
}
