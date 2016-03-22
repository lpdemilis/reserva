
<%@ page import="br.com.reservas.Indisponibilidade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'indisponibilidade.label', default: 'Indisponibilidade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-indisponibilidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-indisponibilidade" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dataInicio" title="${message(code: 'indisponibilidade.dataInicio.label', default: 'Data Inicio')}" />
					
						<g:sortableColumn property="dataFim" title="${message(code: 'indisponibilidade.dataFim.label', default: 'Data Fim')}" />
					
						<g:sortableColumn property="ativo" title="${message(code: 'indisponibilidade.ativo.label', default: 'Ativo')}" />
					
						<g:sortableColumn property="motivo" title="${message(code: 'indisponibilidade.motivo.label', default: 'Motivo')}" />
					
						<th><g:message code="indisponibilidade.recurso.label" default="Recurso" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${indisponibilidadeInstanceList}" status="i" var="indisponibilidadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${indisponibilidadeInstance.id}">${fieldValue(bean: indisponibilidadeInstance, field: "dataInicio")}</g:link></td>
					
						<td><g:formatDate date="${indisponibilidadeInstance.dataFim}" /></td>
					
						<td><g:formatBoolean boolean="${indisponibilidadeInstance.ativo}" /></td>
					
						<td>${fieldValue(bean: indisponibilidadeInstance, field: "motivo")}</td>
					
						<td>${fieldValue(bean: indisponibilidadeInstance, field: "recurso")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${indisponibilidadeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
