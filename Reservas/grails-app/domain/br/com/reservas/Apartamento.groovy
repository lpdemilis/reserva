package br.com.reservas

class Apartamento {
	
	Integer numero
	char bloco 
	
	static hasMany = [usuarios:Usuario]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		numero nullable:false
		bloco nullable:false  
    }
}
