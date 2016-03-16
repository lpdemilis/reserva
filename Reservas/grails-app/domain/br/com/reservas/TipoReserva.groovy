package br.com.reservas

class TipoReserva {
	
	String nome
	String descricao

    static constraints = {
		nome nullable:false, blank:false, unique:false
		descricao nullable:false, blank:false 
    }
	
	String toString(){
		nome
	}
}
