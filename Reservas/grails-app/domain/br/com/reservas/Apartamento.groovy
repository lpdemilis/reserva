package br.com.reservas

class Apartamento {
	
	Integer numero
	String bloco 
	
	static hasMany = [convites:Convite]
	
	static belongsTo = [condominio:Condominio]

    static constraints = {
		numero nullable:false
		bloco nullable:true 
		
		condominio(unique: ['numero','bloco'])
    }
	
	String toString(){
		StringBuilder sb = new StringBuilder()
		
		sb.append("Ap. ")
		
		if(numero){
			sb.append(numero)
			
			if(bloco){
				sb.append(" Bloco ")
				sb.append(bloco)
			}
		}
		sb.toString()
	}
	
	String toHTML(){
		StringBuilder sb = new StringBuilder()
		
		sb.append("Ap. ")
		
		if(numero){
			sb.append(numero)
			
			if(bloco){
				sb.append(" Bloco ")
				sb.append(bloco)
			}
		}
		sb.toString()
	}
}
