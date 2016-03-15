import br.com.reservas.Cidade;
import br.com.reservas.Condominio;
import br.com.reservas.Endereco;

class BootStrap {

    def init = { servletContext ->
		Condominio condominioInstance = Condominio.findByNome("Achilles Ceccato");
		if (condominioInstance == null) {
			condominioInstance = new Condominio();
			condominioInstance.nome = "Achilles Ceccato";
			
			Endereco enderecoInstance = new Endereco();
			enderecoInstance.logradouro = "Rua Salvatina Feliciana dos Santos";
			enderecoInstance.complemento = "";
			enderecoInstance.numero = 155;
			enderecoInstance.bairro = "Itacorubi";
			enderecoInstance.cep = "88034-600";
			enderecoInstance.cidade = Cidade.findByNome("Florianopolis");
			enderecoInstance.save()
			
			condominioInstance.endereco = enderecoInstance;
			condominioInstance.save() 			
		}
		
		condominioInstance = Condominio.findByNome("Grenoble");
		if (condominioInstance == null) {
			condominioInstance = new Condominio();
			condominioInstance.nome = "Grenoble";
			
			Endereco enderecoInstance = new Endereco();
			enderecoInstance.logradouro = "Rua Presidente Coutinho";
			enderecoInstance.complemento = "";
			enderecoInstance.numero = 1965;
			enderecoInstance.bairro = "Centro";
			enderecoInstance.cep = "88034-000";
			enderecoInstance.cidade = Cidade.findByNome("Florianopolis");
			enderecoInstance.save()
			
			condominioInstance.endereco = enderecoInstance;
			condominioInstance.save()			
		}
				
    }
    def destroy = {
    }
}
