package br.com.reservas

class Condominio {
	
	static searchable = true
	
	String nome
	Endereco endereco
	
	static hasMany = [administradores:Usuario, usuarios:Usuario, apartamentos:Apartamento, recursos:Recurso, mensalidades:Mensalidade, convites:Convite]
	
	static belongsTo = [plano: Plano]

    static constraints = {
		nome nullable:false, blank: false
		endereco nullable:false, blank:false
    }
	
	static mapping = {
		convites cascade:'all-delete-orphan'
	}
	
	String toString() {
		nome
	}
	
	Boolean verificarAdministrador() {
		CondominioController condominioController = new CondominioController()
		condominioController.verificarAdministrador(this.id)		
	}
	
	Boolean verificarUsuario() {
		CondominioController condominioController = new CondominioController()
		condominioController.verificarUsuario(this.id)
	}
	
	Boolean verificarConvite() {
		CondominioController condominioController = new CondominioController()
		condominioController.verificarConvite(this.id)
	}
}
