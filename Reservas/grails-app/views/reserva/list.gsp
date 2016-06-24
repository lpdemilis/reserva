
<%@ page import="br.com.reservas.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>	
			</ul>
		</div>
		<div id="list-reserva" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<div class="nav">
				<g:formRemote name="search" url="[action:'search']" update="searchResult">	
					<label for="condominio">
						<g:message code="condominio.label" default="Condomínio" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="condominio" name="condominio.id" from="${condominioInstanceList}" optionKey="id" required="" value="0" class="many-to-one" onchange="${remoteFunction(controller: 'recurso', action: 'buscaRecursos', params: '\'condominio=\' + this.value', update:'recursoSelect')}" />
					
					<label for="recurso">
						<g:message code="condominio.recurso.label" default="Recurso" />
						<span class="required-indicator">*</span>
					</label>
					<div id="recursoSelect" style="display: inline;">
						<g:render template="/recurso/recurso" model="[recursoInstanceList: recursoInstanceList]" ></g:render>
					</div>
					
					<label for="reserva">
						<g:message code="condominio.reserva.label" default="Reserva" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="reserva" name="reserva" from="${[message(code: 'minhas.reservas.label', default: 'Minhas reservas'), message(code: 'todas.reservas.label', default: 'Todas as reservas')]}" keys="${[0, 1]}" required="" value="0" class="many-to-one"/>
					
					<label for="status">
						<g:message code="condominio.reserva.status.label" default="Status" />
					</label>
					<g:select id="status_reserva" name="status_reserva" from="${[message(code: 'todos.label', default: 'Todos'), message(code: 'aprovada.label', default: 'Aprovada'), message(code: 'cancelada.label', default: 'Cancelada'), message(code: 'pendente.label', default: 'Pendente')]}" keys="${[0, 1, 2, 3]}" required="" value="0" class="many-to-one"/>
					
					<label for="dataInicio">
						<g:message code="condominio.reserva.data.inicio.label" default="A partir de" />
					</label>
					<g:datePicker name="dataInicio" precision="day"/>
					
					<label for="dataFim">
						<g:message code="condominio.reserva.data.fim.label" default="Até" />
					</label>
					<g:datePicker name="dataFim" precision="day" value="${dataFim}" />
									
			        <g:submitButton name="search" value="Buscar"/>
			        
	    		</g:formRemote>
			</div>
			
			<div id="searchResult">
				<g:render template="list"/>
			</div>
		</div>
	</body>
</html>
