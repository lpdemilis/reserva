
<%@ page import="br.com.reservas.Mensalidade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensalidade.label', default: 'Mensalidade')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mensalidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mensalidade" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="mes" title="${message(code: 'mensalidade.mes.label', default: 'Mes')}" />
					
						<g:sortableColumn property="ano" title="${message(code: 'mensalidade.ano.label', default: 'Ano')}" />
					
						<th><g:message code="mensalidade.boleto.label" default="Boleto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mensalidadeInstanceList}" status="i" var="mensalidadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mensalidadeInstance.id}">${fieldValue(bean: mensalidadeInstance, field: "mes")}</g:link></td>
					
						<td>${fieldValue(bean: mensalidadeInstance, field: "ano")}</td>
					
						<td>${fieldValue(bean: mensalidadeInstance, field: "boleto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mensalidadeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
