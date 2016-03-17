package br.com.reservas

class Imagem {
	
	byte[] imagem
	String imagemType
	
	static belongsTo = [recurso:Recurso]
	  
	static constraints = {
		imagem(nullable:true, maxSize: 2048000 /* 2mb */)
		imagemType(nullable:true)
	}    
}
