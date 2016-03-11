
<%@ page import="br.com.reservas.Recurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recurso.label', default: 'Recurso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recurso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recurso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'recurso.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="exigeConfirmacao" title="${message(code: 'recurso.exigeConfirmacao.label', default: 'Exige Confirmacao')}" />
					
						<g:sortableColumn property="numeroMaxReservas" title="${message(code: 'recurso.numeroMaxReservas.label', default: 'Numero Max Reservas')}" />
					
						<g:sortableColumn property="ativo" title="${message(code: 'recurso.ativo.label', default: 'Ativo')}" />
					
						<th><g:message code="recurso.condominio.label" default="Condominio" /></th>
					
						<g:sortableColumn property="descricao" title="${message(code: 'recurso.descricao.label', default: 'Descricao')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recursoInstanceList}" status="i" var="recursoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recursoInstance.id}">${fieldValue(bean: recursoInstance, field: "nome")}</g:link></td>
					
						<td><g:formatBoolean boolean="${recursoInstance.exigeConfirmacao}" /></td>
					
						<td>${fieldValue(bean: recursoInstance, field: "numeroMaxReservas")}</td>
					
						<td><g:formatBoolean boolean="${recursoInstance.ativo}" /></td>
					
						<td>${fieldValue(bean: recursoInstance, field: "condominio")}</td>
					
						<td>${fieldValue(bean: recursoInstance, field: "descricao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recursoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
