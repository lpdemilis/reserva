
<%@ page import="br.com.reservas.Mensalidade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensalidade.label', default: 'Mensalidade')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mensalidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mensalidade" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mensalidade">
			
				<g:if test="${mensalidadeInstance?.mes}">
				<li class="fieldcontain">
					<span id="mes-label" class="property-label"><g:message code="mensalidade.mes.label" default="Mes" /></span>
					
						<span class="property-value" aria-labelledby="mes-label"><g:fieldValue bean="${mensalidadeInstance}" field="mes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mensalidadeInstance?.ano}">
				<li class="fieldcontain">
					<span id="ano-label" class="property-label"><g:message code="mensalidade.ano.label" default="Ano" /></span>
					
						<span class="property-value" aria-labelledby="ano-label"><g:fieldValue bean="${mensalidadeInstance}" field="ano"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mensalidadeInstance?.boleto}">
				<li class="fieldcontain">
					<span id="boleto-label" class="property-label"><g:message code="mensalidade.boleto.label" default="Boleto" /></span>
					
						<span class="property-value" aria-labelledby="boleto-label"><g:link controller="boleto" action="show" id="${mensalidadeInstance?.boleto?.id}">${mensalidadeInstance?.boleto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mensalidadeInstance?.id}" />
					<g:link class="edit" action="edit" id="${mensalidadeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
