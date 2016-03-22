
<%@ page import="br.com.reservas.Recurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recurso.label', default: 'Recurso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recurso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recurso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recurso">
			
				<g:if test="${recursoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="recurso.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${recursoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.exigeConfirmacao}">
				<li class="fieldcontain">
					<span id="exigeConfirmacao-label" class="property-label"><g:message code="recurso.exigeConfirmacao.label" default="Exige Confirmacao" /></span>
					
						<span class="property-value" aria-labelledby="exigeConfirmacao-label"><g:formatBoolean boolean="${recursoInstance?.exigeConfirmacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.numeroMaxReservas}">
				<li class="fieldcontain">
					<span id="numeroMaxReservas-label" class="property-label"><g:message code="recurso.numeroMaxReservas.label" default="Numero Max Reservas" /></span>
					
						<span class="property-value" aria-labelledby="numeroMaxReservas-label"><g:fieldValue bean="${recursoInstance}" field="numeroMaxReservas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="recurso.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${recursoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.tempoReserva}">
				<li class="fieldcontain">
					<span id="tempoReserva-label" class="property-label"><g:message code="recurso.tempoReserva.label" default="Tempo Reserva" /></span>
					
						<span class="property-value" aria-labelledby="tempoReserva-label"><g:fieldValue bean="${recursoInstance}" field="tempoReserva"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="recurso.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${recursoInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.capacidade}">
				<li class="fieldcontain">
					<span id="capacidade-label" class="property-label"><g:message code="recurso.capacidade.label" default="Capacidade" /></span>
					
						<span class="property-value" aria-labelledby="capacidade-label"><g:fieldValue bean="${recursoInstance}" field="capacidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.condominio}">
				<li class="fieldcontain">
					<span id="condominio-label" class="property-label"><g:message code="recurso.condominio.label" default="Condominio" /></span>
					
						<span class="property-value" aria-labelledby="condominio-label"><g:link controller="condominio" action="show" id="${recursoInstance?.condominio?.id}">${recursoInstance?.condominio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="recurso.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${recursoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.imagens}">
				<li class="fieldcontain">
					<span id="imagens-label" class="property-label"><g:message code="recurso.imagens.label" default="Imagens" /></span>
					
						<g:each in="${recursoInstance.imagens}" var="i">
							<span class="property-value" aria-labelledby="imagens-label"><g:link controller="imagem" action="show" id="${i.id}"><img class="imagem-miniatura" src="${createLink(controller:'imagem', action:'imagem', id:i.id)}" /></g:link></span>							
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.indisponibilidades}">
				<li class="fieldcontain">
					<span id="indisponibilidades-label" class="property-label"><g:message code="recurso.indisponibilidades.label" default="Indisponibilidades" /></span>
					
						<g:each in="${recursoInstance.indisponibilidades}" var="i">
						<span class="property-value" aria-labelledby="indisponibilidades-label"><g:link controller="indisponibilidade" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.reserva}">
				<li class="fieldcontain">
					<span id="reserva-label" class="property-label"><g:message code="recurso.reserva.label" default="Reserva" /></span>
					
						<g:each in="${recursoInstance.reserva}" var="r">
						<span class="property-value" aria-labelledby="reserva-label"><g:link controller="reserva" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.tipoReserva}">
				<li class="fieldcontain">
					<span id="tipoReserva-label" class="property-label"><g:message code="recurso.tipoReserva.label" default="Tipo Reserva" /></span>
					
						<g:each in="${recursoInstance.tipoReserva}" var="t">
						<span class="property-value" aria-labelledby="tipoReserva-label"><g:link controller="tipoReserva" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${recursoInstance?.id}" />
					<g:link class="edit" action="edit" id="${recursoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
