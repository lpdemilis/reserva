<%@ page import="br.com.reservas.Boleto" %>



<div class="fieldcontain ${hasErrors(bean: boletoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="boleto.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: boletoInstance, field: 'valor')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: boletoInstance, field: 'dataGeracao', 'error')} required">
	<label for="dataGeracao">
		<g:message code="boleto.dataGeracao.label" default="Data Geracao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataGeracao" precision="day"  value="${boletoInstance?.dataGeracao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: boletoInstance, field: 'dataVencimento', 'error')} required">
	<label for="dataVencimento">
		<g:message code="boleto.dataVencimento.label" default="Data Vencimento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataVencimento" precision="day"  value="${boletoInstance?.dataVencimento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: boletoInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="boleto.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" value="${boletoInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: boletoInstance, field: 'pago', 'error')} ">
	<label for="pago">
		<g:message code="boleto.pago.label" default="Pago" />
		
	</label>
	<g:checkBox name="pago" value="${boletoInstance?.pago}" />
</div>

<div class="fieldcontain ${hasErrors(bean: boletoInstance, field: 'dataPagamento', 'error')} required">
	<label for="dataPagamento">
		<g:message code="boleto.dataPagamento.label" default="Data Pagamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataPagamento" precision="day"  value="${boletoInstance?.dataPagamento}"  />
</div>

