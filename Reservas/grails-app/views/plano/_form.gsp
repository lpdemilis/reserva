<%@ page import="br.com.reservas.Plano" %>



<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'dataInicio', 'error')} required">
	<label for="dataInicio">
		<g:message code="plano.dataInicio.label" default="Data Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataInicio" precision="day"  value="${planoInstance?.dataInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'dataFim', 'error')} required">
	<label for="dataFim">
		<g:message code="plano.dataFim.label" default="Data Fim" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataFim" precision="day"  value="${planoInstance?.dataFim}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="plano.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: planoInstance, field: 'valor')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="plano.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${planoInstance?.ativo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'nuMaxRecursos', 'error')} required">
	<label for="nuMaxRecursos">
		<g:message code="plano.nuMaxRecursos.label" default="Nu Max Recursos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nuMaxRecursos" type="number" value="${planoInstance.nuMaxRecursos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'nuMaxApartamentos', 'error')} required">
	<label for="nuMaxApartamentos">
		<g:message code="plano.nuMaxApartamentos.label" default="Nu Max Apartamentos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nuMaxApartamentos" type="number" value="${planoInstance.nuMaxApartamentos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'nuMaxCondominios', 'error')} required">
	<label for="nuMaxCondominios">
		<g:message code="plano.nuMaxCondominios.label" default="Nu Max Condominios" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nuMaxCondominios" type="number" value="${planoInstance.nuMaxCondominios}" required=""/>
</div>

