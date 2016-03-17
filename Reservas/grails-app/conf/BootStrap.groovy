import java.nio.charset.Charset;

import br.com.reservas.Cidade;
import br.com.reservas.Condominio;
import br.com.reservas.Endereco;
import br.com.reservas.TipoReserva;

class BootStrap {

    def init = { servletContext ->
		/** Condominios **/
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
		/** Condominios **/
		
		/** Tipo Reserva **/
		TipoReserva tipoReserva;
		
		tipoReserva =TipoReserva.get(1);
		if (tipoReserva == null) {
			tipoReserva = new TipoReserva();
			tipoReserva.nome = "Apartamento obrigat\u00F3rio";
			tipoReserva.descricao = "A reserva somente poder\u00E1 ser feita por um usu\u00E1rio relacionado \u00E0 um apartamento.";
			tipoReserva.save();
		}
		
		tipoReserva =TipoReserva.get(2);
		if (tipoReserva == null) {
			tipoReserva = new TipoReserva();
			tipoReserva.nome = "Condom\u00EDnio obrigat\u00F3rio";
			tipoReserva.descricao = "A reserva somente poder\u00E1 ser feita por um usu\u00E1rio relacionado ao condominio.";
			tipoReserva.save();
		}
		
		tipoReserva =TipoReserva.get(3);
		if (tipoReserva == null) {
			tipoReserva = new TipoReserva();
			tipoReserva.nome = "Todos os usu\u00E1rios";			
			tipoReserva.descricao = "A reserva poder\u00E1 ser feita por todos os usu\u00E1rios.";
			tipoReserva.save();
		}
		/** Tipo Reserva **/
    }
    def destroy = {
    }
}
