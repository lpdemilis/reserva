package br.com.reservas

class Imagem {
	
	byte[] imagem
	
	static belongsTo = [recurso:Recurso]
	  
	static constraints = {
		imagem(nullable:true, maxSize: 2048000 /* 2mb */)
	}    
}
