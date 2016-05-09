package br.com.reservas

class UnidadeTempoReserva {
	
	String nome
	String descricao

    static constraints = {
		nome nullable:false, blank: false 
    }
	
	String toString(){
		nome
	}
}
