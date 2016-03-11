<%@ page import="br.com.reservas.Mensalidade" %>



<div class="fieldcontain ${hasErrors(bean: mensalidadeInstance, field: 'mes', 'error')} required">
	<label for="mes">
		<g:message code="mensalidade.mes.label" default="Mes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="mes" type="number" value="${mensalidadeInstance.mes}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: mensalidadeInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="mensalidade.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" value="${mensalidadeInstance.ano}" required=""/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: mensalidadeInstance, field: 'boleto', 'error')} required">--%>
<%--	<label for="boleto">--%>
<%--		<g:message code="mensalidade.boleto.label" default="Boleto" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="boleto" name="boleto.id" from="${br.com.reservas.Boleto.list()}" optionKey="id" required="" value="${mensalidadeInstance?.boleto?.id}" class="many-to-one"/>--%>
<%--</div>--%>

<g:render template="/boleto/form" model="['boletoInstance':mensalidadeInstance?.boleto]"/>
