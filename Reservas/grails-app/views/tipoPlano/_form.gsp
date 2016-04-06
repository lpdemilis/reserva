<%@ page import="br.com.reservas.TipoPlano" %>



<div class="fieldcontain ${hasErrors(bean: tipoPlanoInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="tipoPlano.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCriacao" precision="day"  value="${tipoPlanoInstance?.dataCriacao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPlanoInstance, field: 'dataEncerramento', 'error')} ">
	<label for="dataEncerramento">
		<g:message code="tipoPlano.dataEncerramento.label" default="Data Encerramento" />
		
	</label>
	<g:datePicker name="dataEncerramento" precision="day"  value="${tipoPlanoInstance?.dataEncerramento}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPlanoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="tipoPlano.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: tipoPlanoInstance, field: 'valor')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPlanoInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="tipoPlano.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${tipoPlanoInstance?.ativo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPlanoInstance, field: 'nuMaxRecursos', 'error')} required">
	<label for="nuMaxRecursos">
		<g:message code="tipoPlano.nuMaxRecursos.label" default="Nu Max Recursos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nuMaxRecursos" type="number" value="${tipoPlanoInstance.nuMaxRecursos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPlanoInstance, field: 'nuMaxApartamentos', 'error')} required">
	<label for="nuMaxApartamentos">
		<g:message code="tipoPlano.nuMaxApartamentos.label" default="Nu Max Apartamentos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nuMaxApartamentos" type="number" value="${tipoPlanoInstance.nuMaxApartamentos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPlanoInstance, field: 'nuMaxCondominios', 'error')} required">
	<label for="nuMaxCondominios">
		<g:message code="tipoPlano.nuMaxCondominios.label" default="Nu Max Condominios" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nuMaxCondominios" type="number" value="${tipoPlanoInstance.nuMaxCondominios}" required=""/>
</div>

