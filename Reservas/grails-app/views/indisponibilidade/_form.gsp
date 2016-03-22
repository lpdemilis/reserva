<%@ page import="br.com.reservas.Indisponibilidade" %>



<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'dataInicio', 'error')} required">
	<label for="dataInicio">
		<g:message code="indisponibilidade.dataInicio.label" default="Data Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataInicio" precision="day"  value="${indisponibilidadeInstance?.dataInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'dataFim', 'error')} required">
	<label for="dataFim">
		<g:message code="indisponibilidade.dataFim.label" default="Data Fim" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataFim" precision="day"  value="${indisponibilidadeInstance?.dataFim}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="indisponibilidade.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${indisponibilidadeInstance?.ativo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'motivo', 'error')} ">
	<label for="motivo">
		<g:message code="indisponibilidade.motivo.label" default="Motivo" />
		
	</label>
	<g:textField name="motivo" value="${indisponibilidadeInstance?.motivo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'recurso', 'error')} required">
	<label for="recurso">
		<g:message code="indisponibilidade.recurso.label" default="Recurso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recurso" name="recurso.id" from="${br.com.reservas.Recurso.list()}" optionKey="id" required="" value="${indisponibilidadeInstance?.recurso?.id}" class="many-to-one"/>
</div>

