package br.com.reservas

class Condominio {
	
	String nome
	Endereco endereco
	
	static hasMany = [recursos:Recurso]

    static constraints = {
		nome nullable:false
		endereco nullable:false
    }
}
