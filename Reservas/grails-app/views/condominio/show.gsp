
<%@ page import="br.com.reservas.Condominio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'condominio.label', default: 'Condominio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-condominio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-condominio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list condominio">
			
				<g:if test="${condominioInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="condominio.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${condominioInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${condominioInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="condominio.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:link controller="endereco" action="show" id="${condominioInstance?.endereco?.id}">${condominioInstance?.endereco?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${condominioInstance?.administradores}">
				<li class="fieldcontain">
					<span id="administradores-label" class="property-label"><g:message code="condominio.administradores.label" default="Administradores" /></span>
					
						<g:each in="${condominioInstance.administradores}" var="a">
						<span class="property-value" aria-labelledby="administradores-label"><g:link controller="usuario" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${condominioInstance?.apartamentos}">
				<li class="fieldcontain">
					<span id="apartamentos-label" class="property-label"><g:message code="condominio.apartamentos.label" default="Apartamentos" /></span>
					
						<g:each in="${condominioInstance.apartamentos}" var="a">
						<span class="property-value" aria-labelledby="apartamentos-label"><g:link controller="apartamento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${condominioInstance?.recursos}">
				<li class="fieldcontain">
					<span id="recursos-label" class="property-label"><g:message code="condominio.recursos.label" default="Recursos" /></span>
					
						<g:each in="${condominioInstance.recursos}" var="r">
						<span class="property-value" aria-labelledby="recursos-label"><g:link controller="recurso" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${condominioInstance?.id}" />
					<g:link class="edit" action="edit" id="${condominioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
