package br.com.reserva

class Condominio {
	
	String nome
	Endereco endereco

    static constraints = {
		nome nullable:false
		endereco nullable:false
    }
}
