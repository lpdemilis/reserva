
<%@ page import="br.com.reservas.Boleto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boleto.label', default: 'Boleto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-boleto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-boleto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="valor" title="${message(code: 'boleto.valor.label', default: 'Valor')}" />
					
						<g:sortableColumn property="dataGeracao" title="${message(code: 'boleto.dataGeracao.label', default: 'Data Geracao')}" />
					
						<g:sortableColumn property="dataVencimento" title="${message(code: 'boleto.dataVencimento.label', default: 'Data Vencimento')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'boleto.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="pago" title="${message(code: 'boleto.pago.label', default: 'Pago')}" />
					
						<g:sortableColumn property="dataPagamento" title="${message(code: 'boleto.dataPagamento.label', default: 'Data Pagamento')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${boletoInstanceList}" status="i" var="boletoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${boletoInstance.id}">${fieldValue(bean: boletoInstance, field: "valor")}</g:link></td>
					
						<td><g:formatDate date="${boletoInstance.dataGeracao}" /></td>
					
						<td><g:formatDate date="${boletoInstance.dataVencimento}" /></td>
					
						<td>${fieldValue(bean: boletoInstance, field: "codigo")}</td>
					
						<td><g:formatBoolean boolean="${boletoInstance.pago}" /></td>
					
						<td><g:formatDate date="${boletoInstance.dataPagamento}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${boletoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
