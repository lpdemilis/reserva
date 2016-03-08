package br.com.reservas

class Convidado {
	
	String nome
	String cpf
	String telefone
	String email
	
	static belongsTo = [reserva:Reserva]

    static constraints = {
    }
}
