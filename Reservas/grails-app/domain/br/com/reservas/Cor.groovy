package br.com.reservas

class Cor {
	
	String cor

    static constraints = {
		cor nullable: false, blank: false
    }
	
	String toString(){
		cor
	}
}
