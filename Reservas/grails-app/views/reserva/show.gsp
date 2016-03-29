
<%@ page import="br.com.reservas.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reserva" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reserva">
			
				<g:if test="${reservaInstance?.dataSolicitacao}">
				<li class="fieldcontain">
					<span id="dataSolicitacao-label" class="property-label"><g:message code="reserva.dataSolicitacao.label" default="Data Solicitacao" /></span>
					
						<span class="property-value" aria-labelledby="dataSolicitacao-label"><g:formatDate date="${reservaInstance?.dataSolicitacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.dataEvento}">
				<li class="fieldcontain">
					<span id="dataEvento-label" class="property-label"><g:message code="reserva.dataEvento.label" default="Data Evento" /></span>
					
						<span class="property-value" aria-labelledby="dataEvento-label"><g:formatDate date="${reservaInstance?.dataEvento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.aprovada}">
				<li class="fieldcontain">
					<span id="aprovada-label" class="property-label"><g:message code="reserva.aprovada.label" default="Aprovada" /></span>
					
						<span class="property-value" aria-labelledby="aprovada-label"><g:formatBoolean boolean="${reservaInstance?.aprovada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.cancelada}">
				<li class="fieldcontain">
					<span id="cancelada-label" class="property-label"><g:message code="reserva.cancelada.label" default="Cancelada" /></span>
					
						<span class="property-value" aria-labelledby="cancelada-label"><g:formatBoolean boolean="${reservaInstance?.cancelada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="reserva.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${reservaInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.apartamento}">
				<li class="fieldcontain">
					<span id="apartamento-label" class="property-label"><g:message code="reserva.apartamento.label" default="Apartamento" /></span>
					
						<span class="property-value" aria-labelledby="apartamento-label"><g:link controller="apartamento" action="show" id="${reservaInstance?.apartamento?.id}">${reservaInstance?.apartamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.comentario}">
				<li class="fieldcontain">
					<span id="comentario-label" class="property-label"><g:message code="reserva.comentario.label" default="Comentario" /></span>
					
						<span class="property-value" aria-labelledby="comentario-label"><g:fieldValue bean="${reservaInstance}" field="comentario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.convidados}">
				<li class="fieldcontain">
					<span id="convidados-label" class="property-label"><g:message code="reserva.convidados.label" default="Convidados" /></span>
					
						<g:each in="${reservaInstance.convidados}" var="c">
						<span class="property-value" aria-labelledby="convidados-label"><g:link controller="convidado" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.dataAprovacao}">
				<li class="fieldcontain">
					<span id="dataAprovacao-label" class="property-label"><g:message code="reserva.dataAprovacao.label" default="Data Aprovacao" /></span>
					
						<span class="property-value" aria-labelledby="dataAprovacao-label"><g:formatDate date="${reservaInstance?.dataAprovacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.dataCancelamento}">
				<li class="fieldcontain">
					<span id="dataCancelamento-label" class="property-label"><g:message code="reserva.dataCancelamento.label" default="Data Cancelamento" /></span>
					
						<span class="property-value" aria-labelledby="dataCancelamento-label"><g:formatDate date="${reservaInstance?.dataCancelamento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.recurso}">
				<li class="fieldcontain">
					<span id="recurso-label" class="property-label"><g:message code="reserva.recurso.label" default="Recurso" /></span>
					
						<span class="property-value" aria-labelledby="recurso-label"><g:link controller="recurso" action="show" id="${reservaInstance?.recurso?.id}">${reservaInstance?.recurso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="reserva.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${reservaInstance?.usuario?.id}">${reservaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reservaInstance?.id}" />
					<g:link class="edit" action="edit" id="${reservaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
