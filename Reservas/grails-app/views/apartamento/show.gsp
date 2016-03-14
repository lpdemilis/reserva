
<%@ page import="br.com.reservas.Apartamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'apartamento.label', default: 'Apartamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-apartamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-apartamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list apartamento">
			
				<g:if test="${apartamentoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="apartamento.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${apartamentoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apartamentoInstance?.bloco}">
				<li class="fieldcontain">
					<span id="bloco-label" class="property-label"><g:message code="apartamento.bloco.label" default="Bloco" /></span>
					
						<span class="property-value" aria-labelledby="bloco-label"><g:fieldValue bean="${apartamentoInstance}" field="bloco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apartamentoInstance?.condominio}">
				<li class="fieldcontain">
					<span id="condominio-label" class="property-label"><g:message code="apartamento.condominio.label" default="Condominio" /></span>
					
						<span class="property-value" aria-labelledby="condominio-label"><g:link controller="condominio" action="show" id="${apartamentoInstance?.condominio?.id}">${apartamentoInstance?.condominio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${apartamentoInstance?.convites}">
				<li class="fieldcontain">
					<span id="convites-label" class="property-label"><g:message code="apartamento.convites.label" default="Convites" /></span>
					
						<g:each in="${apartamentoInstance.convites}" var="c">
						<span class="property-value" aria-labelledby="convites-label"><g:link controller="convite" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${apartamentoInstance?.id}" />
					<g:link class="edit" action="edit" id="${apartamentoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
