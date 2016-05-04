
<%@ page import="br.com.reservas.Condominio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'condominio.label', default: 'Condominio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-condominio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<g:if test="${verificarCriacaoCondominio}">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</g:if>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<g:if test="${!params.todos}">
						<li><g:link class="list" action="list" params="['todos':true]"><g:message code="default.todos.condominio.label" args="[entityName]" default="Todos os Condomínios"/></g:link></li>
					</g:if>	
				</sec:ifAnyGranted>
				<g:if test="${params.todos}">
					<li><g:link class="list" action="list"><g:message code="default.meus.condominio.label" args="[entityName]" default="Meus Condomínios"/></g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="list-condominio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'condominio.nome.label', default: 'Nome do Condomínio')}" />
					
						<th><g:message code="condominio.endereco.label" default="Endereço" /></th>
						
						<th><g:message code="condominio.recurso.label" default="Recursos" /></th>
						
						<th><g:message code="condominio.administradores.label" default="Administradores" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${condominioInstanceList}" status="i" var="condominioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${condominioInstance.id}">${fieldValue(bean: condominioInstance, field: "nome")}</g:link></td>
					
						<td>${condominioInstance.endereco.toHTML()}</td>
						
						<td>
							<g:each in="${condominioInstance.recursos}" status="k" var="recursoInstance">
								*
							</g:each>
						</td>
						
						<td>
							<g:each in="${condominioInstance.administradores}" status="k" var="administradorInstance">
								<g:link controller="usuario" action="show" id="${administradorInstance.id}">${fieldValue(bean: administradorInstance, field: "nome")}</g:link><br>
							</g:each> 
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${condominioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
