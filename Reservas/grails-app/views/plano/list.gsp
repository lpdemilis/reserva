
<%@ page import="br.com.reservas.Plano" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plano.label', default: 'Plano')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plano" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<g:if test="${!params.todos}">
						<li><g:link class="list" action="list" params="['todos':true]"><g:message code="default.todos.plano.label" args="[entityName]" default="Todos os Planos"/></g:link></li>
					</g:if>	
				</sec:ifAnyGranted>
				<g:if test="${params.todos}">
					<li><g:link class="list" action="list"><g:message code="default.meus.planos.label" args="[entityName]" default="Meus Planos"/></g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="list-plano" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="plano.tipoPlano.label" default="Tipo de Plano" /></th>
						
						<th><g:message code="plano.condominio.label" default="Condomínio" /></th>
	
						<g:sortableColumn property="dataInicio" title="${message(code: 'plano.dataInicio.label', default: 'Data de Início')}" />
					
						<g:sortableColumn property="dataFim" title="${message(code: 'plano.dataFim.label', default: 'Data de Fim')}" />
					
						<g:sortableColumn property="ativo" title="${message(code: 'plano.ativo.label', default: 'Ativo')}" />
																	
						<th><g:message code="plano.usuario.label" default="Usuário" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planoInstanceList}" status="i" var="planoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<td>${planoInstance.tipoPlano.encodeAsHTML()}</td>
						
						<td><g:link controller="condominio" action="show" id="${planoInstance.id}">${fieldValue(bean: planoInstance, field: "condominio")}</g:link></td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${planoInstance.dataInicio}" /></td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${planoInstance.dataFim}" /></td>
					
						<td><g:formatBoolean boolean="${planoInstance.ativo}" /></td>
											
						<td>${fieldValue(bean: planoInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
