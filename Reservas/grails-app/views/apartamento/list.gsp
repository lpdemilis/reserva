
<%@page import="java.lang.Boolean"%>
<%@ page import="br.com.reservas.Apartamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'apartamento.label', default: 'Apartamento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-apartamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-apartamento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'apartamento.numero.label', default: 'Número')}" />
					
						<g:sortableColumn property="bloco" title="${message(code: 'apartamento.bloco.label', default: 'Bloco')}" />
					
						<th><g:message code="apartamento.condominio.label" default="Condomínio" /></th>
						
						<th><g:message code="apartamento.usuario.label" default="Usuário" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${apartamentoInstanceList}" status="i" var="apartamentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${apartamentoInstance.id}">${fieldValue(bean: apartamentoInstance, field: "numero")}</g:link></td>
					
						<td>${fieldValue(bean: apartamentoInstance, field: "bloco")}</td>
					
						<td>${fieldValue(bean: apartamentoInstance, field: "condominio")}</td>
						
						<td>
							<g:each in="${apartamentoInstance.convites}" status="k" var="conviteInstance">
								<g:if test="${conviteInstance.usuario && conviteInstance.aprovado}">
									<g:link controller="usuario" action="show" id="${conviteInstance.usuario.id}">
										${conviteInstance.usuario}
									</g:link>									
								</g:if>
								<g:elseif test="${conviteInstance.aprovado == null || conviteInstance.aprovado}">
									<g:link controller="convite" action="show" id="${conviteInstance.id}">
										${conviteInstance.email}
									</g:link>
									
									<span class="pendente"><g:message code="apartamento.pendente.label" default="(Pendente)" /></span>
								</g:elseif>
								
								<br>
								 
							</g:each>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${apartamentoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
