
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
					
						<th><g:message code="convite.usuario.label" default="Usuário" /></th>
					
						<g:sortableColumn property="dataConvite" title="${message(code: 'convite.dataConvite.label', default: 'Data do convite')}" />
					
						<g:sortableColumn property="dataAceite" title="${message(code: 'convite.dataAceite.label', default: 'Data do aceite')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'convite.email.label', default: 'E-mail')}" />
						
						<g:sortableColumn property="condominio" title="${message(code: 'convite.condominio.label', default: 'Condomínio')}" />
					
						<th><g:message code="convite.apartamento.label" default="Apartamento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conviteInstanceList}" status="i" var="conviteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conviteInstance.id}">${fieldValue(bean: conviteInstance, field: "usuario")}</g:link></td>
					
						<td><g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${conviteInstance.dataConvite}" /></td>
					
						<td>
							<g:if test="${conviteInstance.dataAceite}">
								<g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${conviteInstance.dataAceite}" />
							</g:if>
							<g:else>
								<div id="aceite_${conviteInstance.id}">
									<div class="adicionar-button" onclick="${remoteFunction(controller: 'convite', action: 'confirmarConvite', params: '\'convite=\' + ' + conviteInstance.id, update:'aceite_' + conviteInstance.id)}" />${message(code: 'aceitar.label', default: 'Aceitar')}</div>
								</div>	
							</g:else>								
						</td>
					
						<td>${fieldValue(bean: conviteInstance, field: "email")}</td>
						
						<td><g:link controller="condominio" action="show" id="${conviteInstance.apartamento.condominio.id}">${fieldValue(bean: conviteInstance, field: "apartamento.condominio")}</g:link></td>
					
						<td><g:link controller="apartamento" action="show" id="${conviteInstance.apartamento.id}">${fieldValue(bean: conviteInstance, field: "apartamento")}</g:link></td>
					
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
