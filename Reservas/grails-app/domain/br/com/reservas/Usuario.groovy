package br.com.reservas

class Usuario {

	transient springSecurityService

	String nome
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	String email
			
	static hasMany = [planos: Plano]

	static constraints = {
		nome blank: false
		username blank: false, unique: true, nullable: false
		password blank: false, nullable: false
		email blank: false, nullable: false, unique: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Papel> getAuthorities() {
		UsuarioPapel.findAllByUsuario(this).collect { it.papel } as Set
	}

	def beforeInsert() {
		username = email
		encodePassword()
	}

	def beforeUpdate() {
		username = email
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	public String toString(){
		nome
	}
}
