
<%@ page import="br.com.reservas.TipoPlano" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoPlano.label', default: 'TipoPlano')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoPlano" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoPlano" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoPlano">
			
				<g:if test="${tipoPlanoInstance?.dataCriacao}">
				<li class="fieldcontain">
					<span id="dataCriacao-label" class="property-label"><g:message code="tipoPlano.dataCriacao.label" default="Data Criacao" /></span>
					
						<span class="property-value" aria-labelledby="dataCriacao-label"><g:formatDate date="${tipoPlanoInstance?.dataCriacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPlanoInstance?.dataEncerramento}">
				<li class="fieldcontain">
					<span id="dataEncerramento-label" class="property-label"><g:message code="tipoPlano.dataEncerramento.label" default="Data Encerramento" /></span>
					
						<span class="property-value" aria-labelledby="dataEncerramento-label"><g:formatDate date="${tipoPlanoInstance?.dataEncerramento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPlanoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="tipoPlano.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${tipoPlanoInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPlanoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="tipoPlano.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${tipoPlanoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPlanoInstance?.nuMaxRecursos}">
				<li class="fieldcontain">
					<span id="nuMaxRecursos-label" class="property-label"><g:message code="tipoPlano.nuMaxRecursos.label" default="Nu Max Recursos" /></span>
					
						<span class="property-value" aria-labelledby="nuMaxRecursos-label"><g:fieldValue bean="${tipoPlanoInstance}" field="nuMaxRecursos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPlanoInstance?.nuMaxApartamentos}">
				<li class="fieldcontain">
					<span id="nuMaxApartamentos-label" class="property-label"><g:message code="tipoPlano.nuMaxApartamentos.label" default="Nu Max Apartamentos" /></span>
					
						<span class="property-value" aria-labelledby="nuMaxApartamentos-label"><g:fieldValue bean="${tipoPlanoInstance}" field="nuMaxApartamentos"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoPlanoInstance?.id}" />
					<g:link class="edit" action="edit" id="${tipoPlanoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
