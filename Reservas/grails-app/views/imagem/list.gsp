
<%@ page import="br.com.reservas.Imagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagem.label', default: 'Imagem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-imagem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-imagem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="recurso.condominio" title="${message(code: 'imagem.recurso.condominio.label', default: 'Condomínio')}" />
						
						<g:sortableColumn property="recurso" title="${message(code: 'imagem.recurso.label', default: 'Recurso')}" />
						
						<th><g:message code="imagem.imagem.label" default="Imagem" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${imagemInstanceList}" status="i" var="imagemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
							<g:if test="${imagemInstance.recurso.condominio?.id}">
								<g:link controller="condominio" action="show" id="${imagemInstance.recurso.condominio.id}">
									${fieldValue(bean: imagemInstance, field: "recurso.condominio")}
								</g:link>	
							</g:if>	
							<g:else>
								-
							</g:else>
						</td>
						
						<td>
							<g:link controller="recurso" action="show" id="${imagemInstance.recurso.id}">
								${fieldValue(bean: imagemInstance, field: "recurso")}
							</g:link>	
						</td>
						
						<td>
							<g:link action="show" id="${imagemInstance.id}">								
								<span id="imagem-label" class="property-label"><img class="imagem-miniatura" src="${createLink(controller:'imagem', action:'imagem', id:imagemInstance.id)}" /></span>
							</g:link>
						</td>						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${imagemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
