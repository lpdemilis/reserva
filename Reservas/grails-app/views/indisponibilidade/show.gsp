
<%@ page import="br.com.reservas.Indisponibilidade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'indisponibilidade.label', default: 'Indisponibilidade')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-indisponibilidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-indisponibilidade" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list indisponibilidade">
			
				<g:if test="${indisponibilidadeInstance?.dataInicio}">
				<li class="fieldcontain">
					<span id="dataInicio-label" class="property-label"><g:message code="indisponibilidade.dataInicio.label" default="Data Inicio" /></span>
					
						<span class="property-value" aria-labelledby="dataInicio-label"><g:formatDate date="${indisponibilidadeInstance?.dataInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${indisponibilidadeInstance?.dataFim}">
				<li class="fieldcontain">
					<span id="dataFim-label" class="property-label"><g:message code="indisponibilidade.dataFim.label" default="Data Fim" /></span>
					
						<span class="property-value" aria-labelledby="dataFim-label"><g:formatDate date="${indisponibilidadeInstance?.dataFim}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${indisponibilidadeInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="indisponibilidade.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${indisponibilidadeInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${indisponibilidadeInstance?.motivo}">
				<li class="fieldcontain">
					<span id="motivo-label" class="property-label"><g:message code="indisponibilidade.motivo.label" default="Motivo" /></span>
					
						<span class="property-value" aria-labelledby="motivo-label"><g:fieldValue bean="${indisponibilidadeInstance}" field="motivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${indisponibilidadeInstance?.recurso}">
				<li class="fieldcontain">
					<span id="recurso-label" class="property-label"><g:message code="indisponibilidade.recurso.label" default="Recurso" /></span>
					
						<span class="property-value" aria-labelledby="recurso-label"><g:link controller="recurso" action="show" id="${indisponibilidadeInstance?.recurso?.id}">${indisponibilidadeInstance?.recurso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${indisponibilidadeInstance?.id}" />
					<g:link class="edit" action="edit" id="${indisponibilidadeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
