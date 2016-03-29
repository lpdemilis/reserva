
<%@ page import="br.com.reservas.Convite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'convite.label', default: 'Convite')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-convite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-convite" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="convite.usuario.label" default="Usuario" /></th>
					
						<g:sortableColumn property="dataConvite" title="${message(code: 'convite.dataConvite.label', default: 'Data Convite')}" />
					
						<g:sortableColumn property="dataAceite" title="${message(code: 'convite.dataAceite.label', default: 'Data Aceite')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'convite.email.label', default: 'Email')}" />
					
						<th><g:message code="convite.apartamento.label" default="Apartamento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conviteInstanceList}" status="i" var="conviteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conviteInstance.id}">${fieldValue(bean: conviteInstance, field: "usuario")}</g:link></td>
					
						<td><g:formatDate date="${conviteInstance.dataConvite}" /></td>
					
						<td><g:formatDate date="${conviteInstance.dataAceite}" /></td>
					
						<td>${fieldValue(bean: conviteInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: conviteInstance, field: "apartamento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conviteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
