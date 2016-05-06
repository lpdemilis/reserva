package br.com.reservas

class Condominio {
	
	String nome
	Endereco endereco
	
	static hasMany = [administradores:Usuario, usuarios:Usuario, apartamentos:Apartamento, recursos:Recurso, mensalidades:Mensalidade, convites:Convite]
	
	static belongsTo = [plano: Plano]

    static constraints = {
		nome nullable:false, blank: false
		endereco nullable:false, blank:false
    }
	
	String toString() {
		nome
	}
	
	Boolean verificarAdministrador() {
		CondominioController condominioController = new CondominioController()
		condominioController.verificarAdministrador(this.id)		
	}
}
