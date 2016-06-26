
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
				<li><g:link class="list" controller="condominio" action="list"><g:message code="default.list.reservas.label" default="Lista de Condomínios" /></g:link></li>
			</ul>
		</div>
		<div id="list-reserva" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.reservas.label" default="Lista de Reservas" /></h1>
			
			<div class="nav">
				<g:formRemote name="search" url="[action:'search']" update="searchResult">	
					<label for="condominio">
						<g:message code="condominio.label" default="Condomínio" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="condominio" name="condominio.id" from="${condominioInstanceListSelect}" optionKey="id" required="" value="0" class="many-to-one" onchange="${remoteFunction(controller: 'recurso', action: 'buscaRecursos', params: '\'condominio=\' + this.value', update:'recursoSelect')}" />
					
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
		
<%--		<div class="spacer"></div>--%>
<%----%>
<%--		--%>
<%--	 Lista condomínio --%>
<%--		<div id="list-condominio" class="content scaffold-list" role="main">--%>
<%--			<h1><g:message code="default.list.condominio.label" default="Lista de Condomínios" /></h1>--%>
<%--			<g:if test="${flash.message}">--%>
<%--			<div class="message" role="status">${flash.message}</div>--%>
<%--			</g:if>--%>
<%--			<table>--%>
<%--				<thead>--%>
<%--					<tr>--%>
<%--					--%>
<%--						<g:sortableColumn property="nome" title="${message(code: 'condominio.nome.label', default: 'Nome do Condomínio')}" />--%>
<%--					--%>
<%--						<th><g:message code="condominio.endereco.label" default="Endereço" /></th>--%>
<%--						--%>
<%--						<th><g:message code="condominio.recurso.label" default="Recursos" /></th>--%>
<%--						--%>
<%--						<th><g:message code="condominio.administradores.label" default="Administradores" /></th>--%>
<%--					--%>
<%--					</tr>--%>
<%--				</thead>--%>
<%--				<tbody>--%>
<%--				<g:each in="${condominioInstanceList}" status="i" var="condominioInstance">--%>
<%--					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--%>
<%--					--%>
<%--						<td><g:link action="show" id="${condominioInstance.id}">${fieldValue(bean: condominioInstance, field: "nome")}</g:link></td>--%>
<%--					--%>
<%--						<td>${condominioInstance.endereco.toHTML()}</td>--%>
<%--						--%>
<%--						<td>--%>
<%--							<g:each in="${condominioInstance.recursos.sort { it.nome }}" status="k" var="recursoInstance">--%>
<%--								<div class="tab-value"><g:link controller="recurso" action="show" id="${recursoInstance.id}"><span class="marker">► </span>${recursoInstance}</g:link></div>--%>
<%--							</g:each>--%>
<%--						</td>--%>
<%--						--%>
<%--						<td>--%>
<%--							<g:each in="${condominioInstance.administradores}" status="k" var="administradorInstance">--%>
<%--								<div class="tab-value"><g:link controller="usuario" action="show" id="${administradorInstance.id}"><span class="marker">► </span>${fieldValue(bean: administradorInstance, field: "nome")}</g:link></div>--%>
<%--							</g:each> --%>
<%--						</td>--%>
<%--					--%>
<%--					</tr>--%>
<%--				</g:each>--%>
<%--				</tbody>--%>
<%--			</table>--%>
<%--			--%>
<%--			<div class="pagination">--%>
<%--				<g:paginate total="${condominioInstanceTotal}" />--%>
<%--			</div>--%>
<%--			--%>
<%--		</div>--%>
<%--		--%>
<%--		<div class="spacer"></div>--%>
<%--		--%>
<%--		<div id="list-condominio" class="content scaffold-list" role="main">--%>
<%--			<h1><g:message code="condominio.buscar.label" default="Buscar Condomínios" /></h1>--%>
<%----%>
<%--			<div class="nav">--%>
<%--				<g:formRemote name="search" url="[action:'search']" update="searchResult">	--%>
<%--					<label for="nome">--%>
<%--						<g:message code="condominio.nome.label" default="Nome" />--%>
<%--						<span class="required-indicator">*</span>--%>
<%--					</label>--%>
<%--					<g:textField name="nome" value="${params.nome}" required="true"/>--%>
<%--					--%>
<%--					<label for="estado">--%>
<%--						<g:message code="condominio.estado.label" default="Estado" />--%>
<%--						<span class="required-indicator">*</span>--%>
<%--					</label>--%>
<%--					<g:select id="estado" name="estado.id" from="${br.com.reservas.Estado.list()}" optionKey="id" required="" value="" class="many-to-one" noSelection="['':'Selecione um Estado...']" onchange="${remoteFunction(controller: 'cidade', action: 'buscaCidades', params: '\'estado=\' + this.value', update:'cidadeSelect')}" />--%>
<%--					--%>
<%--					<label for="cidade">--%>
<%--						<g:message code="condominio.cidade.label" default="Cidade" />--%>
<%--						<span class="required-indicator">*</span>--%>
<%--					</label>--%>
<%--					<div id="cidadeSelect" style="display: inline;">--%>
<%--						<g:render template="/cidade/cidade" model="[cidades: cidades]" ></g:render>--%>
<%--					</div>--%>
<%--									--%>
<%--			        <g:submitButton name="search" value="Buscar"/>--%>
<%--			        --%>
<%--	    		</g:formRemote>--%>
<%--			</div>--%>
<%--			--%>
<%--			<div id="searchResult"></div>--%>
<%--		</div>--%>
<%--		--%>
<%--	 Lista condomínio --%>
		
	</body>
</html>
