package br.com.reservas

class Cidade {

	String nome

	static belongsTo = [estado: Estado]

	static constraints = {
		nome nullable:false 
	}

	String toString() {
		nome
	}
}
