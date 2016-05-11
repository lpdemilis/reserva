
<%@ page import="br.com.reservas.Convite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'convite.label', default: 'Convite')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-convite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-convite" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list convite">
			
				<g:if test="${conviteInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="convite.usuario.label" default="Usuário" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${conviteInstance?.usuario?.id}">${conviteInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
										
				<g:if test="${conviteInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="convite.email.label" default="E-mail" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${conviteInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conviteInstance?.apartamento}">
				<li class="fieldcontain">
					<span id="apartamento-label" class="property-label"><g:message code="convite.apartamento.label" default="Apartamento" /></span>
					
						<span class="property-value" aria-labelledby="apartamento-label"><g:link controller="apartamento" action="show" id="${conviteInstance?.apartamento?.id}">${conviteInstance?.apartamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${conviteInstance?.dataConvite}">
				<li class="fieldcontain">
					<span id="dataConvite-label" class="property-label"><g:message code="convite.dataConvite.label" default="Data do convite" /></span>
					
						<span class="property-value" aria-labelledby="dataConvite-label"><g:formatDate date="${conviteInstance?.dataConvite}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conviteInstance?.dataAceite}">
				<li class="fieldcontain">
					<span id="dataAceite-label" class="property-label"><g:message code="convite.dataAceite.label" default="Data do aceite" /></span>
					
						<span class="property-value" aria-labelledby="dataAceite-label"><g:formatDate date="${conviteInstance?.dataAceite}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${conviteInstance?.id}" />
					<g:link class="edit" action="edit" id="${conviteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
