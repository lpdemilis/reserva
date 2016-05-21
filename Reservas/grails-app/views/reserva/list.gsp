
<%@ page import="br.com.reservas.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reserva" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dataSolicitacao" title="${message(code: 'reserva.dataSolicitacao.label', default: 'Data da Solicitação')}" />
					
						<g:sortableColumn property="dataInicioEvento" title="${message(code: 'reserva.dataInicioEvento.label', default: 'Início do evento')}" />
						
						<g:sortableColumn property="dataFimEvento" title="${message(code: 'reserva.dataFimEvento.label', default: 'Fim do evento')}" />
					
						<g:sortableColumn property="aprovada" title="${message(code: 'reserva.aprovada.label', default: 'Aprovada')}" />
					
						<g:sortableColumn property="cancelada" title="${message(code: 'reserva.cancelada.label', default: 'Cancelada')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'reserva.valor.label', default: 'Valor')}" />
					
						<th><g:message code="reserva.apartamento.label" default="Apartamento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservaInstanceList}" status="i" var="reservaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservaInstance.id}">${fieldValue(bean: reservaInstance, field: "dataSolicitacao")}</g:link></td>
					
						<td><g:formatDate date="${reservaInstance.dataInicioEvento}" /></td>
						
						<td><g:formatDate date="${reservaInstance.dataFimEvento}" /></td>
					
						<td><g:formatBoolean boolean="${reservaInstance.aprovada}" /></td>
					
						<td><g:formatBoolean boolean="${reservaInstance.cancelada}" /></td>
					
						<td>${fieldValue(bean: reservaInstance, field: "valor")}</td>
					
						<td>${fieldValue(bean: reservaInstance, field: "apartamento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
