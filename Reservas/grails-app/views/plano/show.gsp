
<%@ page import="br.com.reservas.Plano" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plano.label', default: 'Plano')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-plano" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-plano" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list plano">
			
				<g:if test="${planoInstance?.dataInicio}">
				<li class="fieldcontain">
					<span id="dataInicio-label" class="property-label"><g:message code="plano.dataInicio.label" default="Data Inicio" /></span>
					
						<span class="property-value" aria-labelledby="dataInicio-label"><g:formatDate date="${planoInstance?.dataInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${planoInstance?.dataFim}">
				<li class="fieldcontain">
					<span id="dataFim-label" class="property-label"><g:message code="plano.dataFim.label" default="Data Fim" /></span>
					
						<span class="property-value" aria-labelledby="dataFim-label"><g:formatDate date="${planoInstance?.dataFim}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${planoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="plano.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${planoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${planoInstance?.tipoPlano}">
				<li class="fieldcontain">
					<span id="tipoPlano-label" class="property-label"><g:message code="plano.tipoPlano.label" default="Tipo Plano" /></span>
					
						<span class="property-value" aria-labelledby="tipoPlano-label"><g:link controller="tipoPlano" action="show" id="${planoInstance?.tipoPlano?.id}">${planoInstance?.tipoPlano?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${planoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="plano.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${planoInstance?.usuario?.id}">${planoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${planoInstance?.condominio}">
<%--				<li class="fieldcontain">--%>
<%--					<span id="condominio-label" class="property-label"><g:message code="plano.condominio.label" default="Condominio" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="condominio-label"><g:link controller="condominio" action="show" id="${planoInstance?.condominio?.id}">${planoInstance?.condominio?.encodeAsHTML()}</g:link></span>--%>
<%--					--%>
<%--				</li>--%>
					<g:render template="/condominio/show" model="['condominioInstance':planoInstance?.condominio]"/>
				</g:if>
				
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${planoInstance?.id}" />
					<g:link class="edit" action="edit" id="${planoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
