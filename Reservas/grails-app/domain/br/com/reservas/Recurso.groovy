package br.com.reservas

class Recurso {
	
	String nome
	Boolean exigeConfirmacao
	Integer numeroMaxReservas
	String descricao
	Boolean ativo
	BigDecimal valor
	Integer capacidade
	Integer tempoReserva
	UnidadeTempoReserva unidadeTempoReserva
	Cor cor
		
	static hasMany = [reserva:Reserva, indisponibilidades:Indisponibilidade, tipoReserva:TipoReserva, imagens:Imagem]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		nome nullable:false
		exigeConfirmacao nullable:false 
		numeroMaxReservas nullable:false
		ativo nullable:false   
		tempoReserva nullable: false
		unidadeTempoReserva nullable: false
		valor nullable:true, scale: 2
		capacidade nullable:true
    }
	
	static mapping = {
		exigeConfirmacao defaultValue: true
		numeroMaxReservas defaultValue: 1
		ativo defaultValue: true
		tempoReserva defaultValue: 24
		descricao defaltValue: "", type: 'text'
	}
	
	String toString(){
		nome
	}
	
	String listaIndisponibilidades(){
		RecursoController recursoController = new RecursoController()
		recursoController.listaIndisponibilidades(this.id)
	}
	
	String listaReservas(){
		RecursoController recursoController = new RecursoController()
		recursoController.listaReservas(this.id)
	}
}
