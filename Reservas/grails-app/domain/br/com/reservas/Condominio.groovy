package br.com.reservas

class Condominio {
	
	String nome
	Endereco endereco
	
	static hasMany = [administradores:Usuario, usuarios:Usuario, apartamentos:Apartamento, recursos:Recurso, mensalidades:Mensalidade, convites:Convite]

    static constraints = {
		nome nullable:false
		endereco nullable:false
    }
	
	String toString() {
		nome
	}
}
