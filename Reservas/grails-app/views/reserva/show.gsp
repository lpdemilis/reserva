
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
<%--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="show-reserva" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reserva">
			
				<g:if test="${reservaInstance?.recurso?.condominio}">
				<li class="fieldcontain">
					<span id="condominio-label" class="property-label"><g:message code="reserva.condominio.label" default="Nome do condomínio" /></span>
					
						<span class="property-value" aria-labelledby="condominio-label"><g:link controller="condominio" action="show" id="${reservaInstance?.recurso?.condominio?.id}">${reservaInstance?.recurso?.condominio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.recurso}">
				<li class="fieldcontain">
					<span id="recurso-label" class="property-label"><g:message code="reserva.recurso.label" default="Recurso" /></span>
					
						<span class="property-value" aria-labelledby="recurso-label"><g:link controller="recurso" action="show" id="${reservaInstance?.recurso?.id}">${reservaInstance?.recurso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservaInstance?.dataInicioEvento}">
				<li class="fieldcontain">
					<span id="dataInicioEvento-label" class="property-label"><g:message code="reserva.dataInicioEvento.label" default="Início do evento" /></span>
					
						<g:if test="${reservaInstance?.recurso.unidadeTempoReserva.id == 3}">
							<span class="property-value" aria-labelledby="dataInicioEvento-label"><g:formatDate format="dd/MM/yyyy" date="${reservaInstance?.dataInicioEvento}" /></span>
						</g:if>
						<g:else>
							<span class="property-value" aria-labelledby="dataInicioEvento-label"><g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${reservaInstance?.dataInicioEvento}" /></span>
						</g:else>
					
				</li>
				</g:if>
				
				<g:if test="${reservaInstance?.dataFimEvento}">
				<li class="fieldcontain">
					<span id="dataFimEvento-label" class="property-label"><g:message code="reserva.dataFimEvento.label" default="Fim do evento" /></span>
					
						<g:if test="${reservaInstance?.recurso.unidadeTempoReserva.id == 3}">
							<span class="property-value" aria-labelledby="dataFimEvento-label"><g:formatDate format="dd/MM/yyyy" date="${reservaInstance?.dataFimEvento}" /></span>
						</g:if>
						<g:else>
							<span class="property-value" aria-labelledby="dataFimEvento-label"><g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${reservaInstance?.dataFimEvento}" /></span>
						</g:else>
					
				</li>
				</g:if>
				
				<g:if test="${reservaInstance?.dataSolicitacao}">
				<li class="fieldcontain">
					<span id="dataSolicitacao-label" class="property-label"><g:message code="reserva.dataSolicitacao.label" default="Data da Solicitação" /></span>
					
						<span class="property-value" aria-labelledby="dataSolicitacao-label"><g:formatDate format="dd/MM/yyyy HH:mm:ss" date="${reservaInstance?.dataSolicitacao}" /></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${reservaInstance?.aprovada}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="aprovada-label" class="property-label"><g:message code="reserva.aprovada.label" default="Aprovada" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="aprovada-label"><g:formatBoolean boolean="${reservaInstance?.aprovada}" /></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
<%--			--%>
<%--				<g:if test="${reservaInstance?.cancelada}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="cancelada-label" class="property-label"><g:message code="reserva.cancelada.label" default="Cancelada" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="cancelada-label"><g:formatBoolean boolean="${reservaInstance?.cancelada}" /></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${reservaInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="reserva.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:formatNumber number="${reservaInstance?.valor}" type="currency" currencyCode="BRL" /></span>
					
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
					<span id="comentario-label" class="property-label"><g:message code="reserva.comentario.label" default="Comentário" /></span>
					
						<span class="property-value" aria-labelledby="comentario-label"><g:fieldValue bean="${reservaInstance}" field="comentario"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${reservaInstance?.convidados}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="convidados-label" class="property-label"><g:message code="reserva.convidados.label" default="Convidados" /></span>--%>
<%--					--%>
<%--						<g:each in="${reservaInstance.convidados}" var="c">--%>
<%--						<span class="property-value" aria-labelledby="convidados-label"><g:link controller="convidado" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${reservaInstance?.aprovada}">
					<li class="fieldcontain">
						<span id="dataAprovacao-label" class="property-label"><g:message code="reserva.dataAprovacao.label" default="Data da aprovação" /></span>
						
							<span class="property-value" aria-labelledby="dataAprovacao-label"><g:formatDate date="${reservaInstance?.dataAprovacao}" /></span>
						
					</li>
				</g:if>
				<g:else>
					<li class="fieldcontain">
						<span id="aprovada-label" class="property-label"><g:message code="reserva.aprovada.label" default="Aprovada" /></span>
						
							<span class="property-value" aria-labelledby="aprovada-label"><g:message code="reserva.aprovada.label" default="Não" /></span>
						
					</li>
				</g:else>
			
				<g:if test="${reservaInstance?.cancelada}">
					<li class="fieldcontain">
						<span id="dataCancelamento-label" class="property-label"><g:message code="reserva.dataCancelamento.label" default="Data do cancelamento" /></span>
						
							<span class="property-value" aria-labelledby="dataCancelamento-label"><g:formatDate date="${reservaInstance?.dataCancelamento}" /></span>
						
					</li>
				</g:if>
				<g:else>
					<li class="fieldcontain">
						<span id="cancelada-label" class="property-label"><g:message code="reserva.cancelada.label" default="Cancelada" /></span>
						
							<span class="property-value" aria-labelledby="cancelada-label"><g:message code="reserva.cancelada.label" default="Não" /></span>
						
					</li>
				</g:else>
										
				<g:if test="${reservaInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="reserva.usuario.label" default="Usuário" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${reservaInstance?.usuario?.id}">${reservaInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
<%--				<g:if test="${ehAdministrador}">--%>
					<li class="fieldcontain">
						<span id="convidados-label" class="property-label"><g:message code="recurso.convidados.label" default="Convidados" /></span>
						
						<div class="property-value" aria-labelledby="convidados-label">
							<div class="add">
								<g:if test="${reservaInstance?.id}">
									<g:link class="adicionar-button" controller="convidado" action="create" params="['reserva.id': reservaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'convidado.label', default: 'Convidado')])}</g:link>
								</g:if>
								<g:else>
									<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'convidado.label', default: 'Convidado')])}</div>				
								</g:else>	
							</div>
						</div>
					</li>
<%--				</g:if>--%>
				
<%--				<g:render template="/recurso/calendar"/>--%>

				<g:render template="/convidado/list"/>
			
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
