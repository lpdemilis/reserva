
<%@ page import="br.com.reservas.Boleto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boleto.label', default: 'Boleto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-boleto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-boleto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list boleto">
			
				<g:if test="${boletoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="boleto.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${boletoInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${boletoInstance?.dataGeracao}">
				<li class="fieldcontain">
					<span id="dataGeracao-label" class="property-label"><g:message code="boleto.dataGeracao.label" default="Data Geracao" /></span>
					
						<span class="property-value" aria-labelledby="dataGeracao-label"><g:formatDate date="${boletoInstance?.dataGeracao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${boletoInstance?.dataVencimento}">
				<li class="fieldcontain">
					<span id="dataVencimento-label" class="property-label"><g:message code="boleto.dataVencimento.label" default="Data Vencimento" /></span>
					
						<span class="property-value" aria-labelledby="dataVencimento-label"><g:formatDate date="${boletoInstance?.dataVencimento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${boletoInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="boleto.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${boletoInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${boletoInstance?.pago}">
				<li class="fieldcontain">
					<span id="pago-label" class="property-label"><g:message code="boleto.pago.label" default="Pago" /></span>
					
						<span class="property-value" aria-labelledby="pago-label"><g:formatBoolean boolean="${boletoInstance?.pago}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${boletoInstance?.dataPagamento}">
				<li class="fieldcontain">
					<span id="dataPagamento-label" class="property-label"><g:message code="boleto.dataPagamento.label" default="Data Pagamento" /></span>
					
						<span class="property-value" aria-labelledby="dataPagamento-label"><g:formatDate date="${boletoInstance?.dataPagamento}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${boletoInstance?.id}" />
					<g:link class="edit" action="edit" id="${boletoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
