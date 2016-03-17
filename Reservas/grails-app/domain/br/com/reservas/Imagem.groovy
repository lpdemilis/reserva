package br.com.reservas

class Imagem {
	
	byte[] imagem
	String imagemType
	
	static belongsTo = [recurso:Recurso]
	  
	static constraints = {
		imagem(nullable:true, maxSize: 16384 /* 16K */)
		imagemType(nullable:true)
	}    
}
