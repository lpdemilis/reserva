import grails.plugins.springsecurity.SpringSecurityService
import br.com.reservas.Cidade
import br.com.reservas.Condominio
import br.com.reservas.Endereco
import br.com.reservas.Papel
import br.com.reservas.Plano
import br.com.reservas.Recurso
import br.com.reservas.TipoPlano;
import br.com.reservas.TipoReserva
import br.com.reservas.Usuario
import br.com.reservas.UsuarioPapel

class BootStrap {
	
	SpringSecurityService springSecurityService = new SpringSecurityService();

    def init = { servletContext ->
		/** Papel **/
		Papel papelInstanceUser = Papel.findByAuthority("ROLE_USER");
		if (papelInstanceUser == null) {
			papelInstanceUser = new Papel();
			papelInstanceUser.authority = "ROLE_USER";
			
			papelInstanceUser.save(flush: true);
		}
		
		Papel papelInstanceAdmin = Papel.findByAuthority("ROLE_ADMIN");
		if (papelInstanceAdmin == null) {
			papelInstanceAdmin = new Papel();
			papelInstanceAdmin.authority = "ROLE_ADMIN";
			
			papelInstanceAdmin.save(flush: true);
		}
		/** Papel **/
		
		/** Ususário **/
		Usuario usuarioInstanceAdmin = Usuario.get(1);
		if (usuarioInstanceAdmin == null) {
			usuarioInstanceAdmin = new Usuario();
			usuarioInstanceAdmin.nome = 'Administrador';
			usuarioInstanceAdmin.email = 'administrador@email.com.br';
			usuarioInstanceAdmin.username = 'administrador@email.com.br';
			//usuarioInstanceAdmin.password = springSecurityService.encodePassword("123456");
			usuarioInstanceAdmin.password = '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92';
			usuarioInstanceAdmin.enabled = true;
			usuarioInstanceAdmin.accountExpired = false;
			usuarioInstanceAdmin.accountLocked = false;
			usuarioInstanceAdmin.passwordExpired = false;
			
			usuarioInstanceAdmin.save(flush: true);			
		}
		
		/** Papel Usuário **/
		UsuarioPapel usuarioPapelInstanceUser = UsuarioPapel.findByPapelAndUsuario(papelInstanceUser, usuarioInstanceAdmin);
		if (usuarioPapelInstanceUser == null) {
			usuarioPapelInstanceUser = new UsuarioPapel();
			usuarioPapelInstanceUser.usuario = usuarioInstanceAdmin;
			usuarioPapelInstanceUser.papel = papelInstanceUser;
		
			usuarioPapelInstanceUser.save(flush: true);
		}
		/** Papel Usuário **/
		
		/** Papel Usuário **/
		UsuarioPapel usuarioPapelInstanceAdmin = UsuarioPapel.findByPapelAndUsuario(papelInstanceAdmin, usuarioInstanceAdmin);
		if (usuarioPapelInstanceAdmin == null) {
			usuarioPapelInstanceAdmin = new UsuarioPapel();
			usuarioPapelInstanceAdmin.usuario = usuarioInstanceAdmin;
			usuarioPapelInstanceAdmin.papel = papelInstanceAdmin;
			
			usuarioPapelInstanceAdmin.save(flush: true);
		}
		/** Papel Usuário **/
		
		Usuario usuarioInstanceUser = Usuario.get(2);
		if (usuarioInstanceUser == null) {
			usuarioInstanceUser = new Usuario();
			usuarioInstanceUser.nome = 'Usu\u00E1rio';
			usuarioInstanceUser.email = 'usuario@email.com.br';
			usuarioInstanceUser.username = 'usuario@email.com.br';
			//usuarioInstanceUser.password = springSecurityService.encodePassword("123456");
			usuarioInstanceUser.password = '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92';
			usuarioInstanceUser.enabled = true;
			usuarioInstanceUser.accountExpired = false;
			usuarioInstanceUser.accountLocked = false;
			usuarioInstanceUser.passwordExpired = false;
			
			usuarioInstanceUser.save(flush: true);
		}		
		
		/** Papel Usuário **/
		usuarioPapelInstanceUser = UsuarioPapel.findByPapelAndUsuario(papelInstanceUser, usuarioInstanceUser);
		if (usuarioPapelInstanceUser == null) {
			usuarioPapelInstanceUser = new UsuarioPapel();
			usuarioPapelInstanceUser.usuario = usuarioInstanceUser;
			usuarioPapelInstanceUser.papel = papelInstanceUser;
		
			usuarioPapelInstanceUser.save(flush: true);
		}
		/** Papel Usuário **/
		/** Usuário **/
		
		/** TipoPlano **/
		TipoPlano tipoPlanoInstance1 = TipoPlano.get(1);
		if (tipoPlanoInstance1 == null) {
			tipoPlanoInstance1 = new TipoPlano();
			tipoPlanoInstance1.dataCriacao = new Date();
			//tipoPlanoInstance1.dataFim = new Date();
			tipoPlanoInstance1.valor = 50.00;
			tipoPlanoInstance1.ativo = true;
			tipoPlanoInstance1.nuMaxRecursos = 5;
			tipoPlanoInstance1.nuMaxApartamentos = 50;
			tipoPlanoInstance1.save(flush: true);
		}
		
		TipoPlano tipoPlanoInstance2 = TipoPlano.get(2);
		if (tipoPlanoInstance2 == null) {
			tipoPlanoInstance2 = new TipoPlano();
			tipoPlanoInstance2.dataCriacao = new Date();
			//tipoPlanoInstance2.dataFim = new Date();
			tipoPlanoInstance2.valor = 70.00;
			tipoPlanoInstance2.ativo = true;
			tipoPlanoInstance2.nuMaxRecursos = 7;
			tipoPlanoInstance2.nuMaxApartamentos = 70;
			tipoPlanoInstance2.save(flush: true);
		}
		
		TipoPlano tipoPlanoInstance3 = TipoPlano.get(3);
		if (tipoPlanoInstance3 == null) {
			tipoPlanoInstance3 = new TipoPlano();
			tipoPlanoInstance3.dataCriacao = new Date();
			//planoInstance3.dataFim = new Date();
			tipoPlanoInstance3.valor = 100.00;
			tipoPlanoInstance3.ativo = true;
			tipoPlanoInstance3.nuMaxRecursos = 10;
			tipoPlanoInstance3.nuMaxApartamentos = 100;
			tipoPlanoInstance3.save(flush: true);
		}
		/** Planos **/
				
//		/** Condominios **/
//		Condominio condominioInstance = Condominio.findByNome("Achilles Ceccato");
//		if (condominioInstance == null) {
//			condominioInstance = new Condominio();
//			condominioInstance.nome = "Achilles Ceccato";
//			
//			Endereco enderecoInstance = new Endereco();
//			enderecoInstance.logradouro = "Rua Salvatina Feliciana dos Santos";
//			enderecoInstance.complemento = "";
//			enderecoInstance.numero = 155;
//			enderecoInstance.bairro = "Itacorubi";
//			enderecoInstance.cep = "88034-600";
//			enderecoInstance.cidade = Cidade.findByNome("Florian\u00F3polis");
//			enderecoInstance.save(flush: true);
//			
//			condominioInstance.endereco = enderecoInstance;
//			condominioInstance.plano = planoInstance1;
//			
//			condominioInstance.save(flush: true); 			
//		}
		
//		/** Recursos **/
//		Recurso recursoInstance = Recurso.get(1);
//		if (recursoInstance == null) {
//			recursoInstance = new Recurso();
//			recursoInstance.nome = "Sal\u00E3o de Festas";
//			recursoInstance.descricao = "";			
//			recursoInstance.condominio = condominioInstance;
//			
//			recursoInstance.save(flush: true);
//		}
//		/** Recursos **/
		
//		condominioInstance = Condominio.findByNome("Grenoble");
//		if (condominioInstance == null) {
//			condominioInstance = new Condominio();
//			condominioInstance.nome = "Grenoble";
//			
//			Endereco enderecoInstance = new Endereco();
//			enderecoInstance.logradouro = "Rua Presidente Coutinho";
//			enderecoInstance.complemento = "";
//			enderecoInstance.numero = 1965;
//			enderecoInstance.bairro = "Centro";
//			enderecoInstance.cep = "88034-000";
//			enderecoInstance.cidade = Cidade.findByNome("Florian\u00F3polis");
//			enderecoInstance.save(flush: true);
//			
//			condominioInstance.endereco = enderecoInstance;
//			condominioInstance.plano = planoInstance1;
//			
//			condominioInstance.save(flush: true);			
//		}
		
//		/** Recursos **/
//		recursoInstance = Recurso.get(2);
//		if (recursoInstance == null) {
//			recursoInstance = new Recurso();
//			recursoInstance.nome = "Sal\u00E3o de Festas";
//			recursoInstance.descricao = "";
//			recursoInstance.condominio = condominioInstance;
//			
//			recursoInstance.save(flush: true);
//		}
//		/** Recursos **/		
//		/** Condominios **/
						
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
