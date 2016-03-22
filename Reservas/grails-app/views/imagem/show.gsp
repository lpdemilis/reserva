
<%@ page import="br.com.reservas.Imagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagem.label', default: 'Imagem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-imagem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-imagem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list imagem">
			
				<g:if test="${imagemInstance?.imagem}">
				<li class="fieldcontain">
					<span id="imagem-label" class="property-label"><g:message code="imagem.imagem.label" default="Imagem" /></span>
					<span class="property-value" aria-labelledby="imagem-label"><img class="imagem-miniatura" src="${createLink(controller:'imagem', action:'imagem', id:imagemInstance.id)}" /></span>
					
				</li>
				</g:if>
						
				<g:if test="${imagemInstance?.recurso}">
				<li class="fieldcontain">
					<span id="recurso-label" class="property-label"><g:message code="imagem.recurso.label" default="Recurso" /></span>
					
						<span class="property-value" aria-labelledby="recurso-label"><g:link controller="recurso" action="show" id="${imagemInstance?.recurso?.id}">${imagemInstance?.recurso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${imagemInstance?.id}" />
					<g:link class="edit" action="edit" id="${imagemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
