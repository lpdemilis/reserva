
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
					
						<g:sortableColumn property="dataInicio" title="${message(code: 'plano.dataInicio.label', default: 'Data Inicio')}" />
					
						<g:sortableColumn property="dataFim" title="${message(code: 'plano.dataFim.label', default: 'Data Fim')}" />
					
						<g:sortableColumn property="ativo" title="${message(code: 'plano.ativo.label', default: 'Ativo')}" />
					
						<th><g:message code="plano.tipoPlano.label" default="Tipo Plano" /></th>
					
						<th><g:message code="plano.condominio.label" default="Condominio" /></th>
					
						<th><g:message code="plano.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planoInstanceList}" status="i" var="planoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${planoInstance.id}">${fieldValue(bean: planoInstance, field: "dataInicio")}</g:link></td>
					
						<td><g:formatDate date="${planoInstance.dataFim}" /></td>
					
						<td><g:formatBoolean boolean="${planoInstance.ativo}" /></td>
					
						<td>${fieldValue(bean: planoInstance, field: "tipoPlano")}</td>
					
						<td>${fieldValue(bean: planoInstance, field: "condominio")}</td>
					
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
