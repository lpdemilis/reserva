<%@ page import="br.com.reservas.Indisponibilidade" %>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'recurso.condominio', 'error')} required">
	<label for="condominio">
		<g:message code="indisponibilidade.condominio.label" default="Condomínio" />		
	</label>
	
	<g:link controller="condominio" action="show" id="${indisponibilidadeInstance?.recurso?.condominio?.id}">${indisponibilidadeInstance?.recurso?.condominio?.encodeAsHTML()}</g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'recurso', 'error')} required">
	<label for="recurso">
		<g:message code="indisponibilidade.recurso.label" default="Recurso" />
	</label>
	
	<g:link controller="recurso" action="show" id="${indisponibilidadeInstance?.recurso?.id}">${indisponibilidadeInstance?.recurso?.encodeAsHTML()}</g:link>
</div>

<g:hiddenField id="recurso" name="recurso.id" value="${indisponibilidadeInstance?.recurso?.id}" />

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'dataInicio', 'error')} required">
	<label for="dataInicio">
		<g:message code="indisponibilidade.dataInicio.label" default="Data de início" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataInicio" precision="day"  value="${indisponibilidadeInstance?.dataInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'dataFim', 'error')} required">
	<label for="dataFim">
		<g:message code="indisponibilidade.dataFim.label" default="Data de fim" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataFim" precision="day"  value="${indisponibilidadeInstance?.dataFim}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="indisponibilidade.ativo.label" default="Ativo" />
		
	</label>
<%--	<g:if test="${indisponibilidadeInstance}">--%>
<%--		<g:checkBox name="ativo" value="${indisponibilidadeInstance?.ativo}" />--%>
<%--	</g:if>--%>
<%--	<g:else>--%>
		<g:checkBox name="ativo" value="1" />
<%--	</g:else>--%>
	
</div>

<div class="fieldcontain ${hasErrors(bean: indisponibilidadeInstance, field: 'motivo', 'error')} ">
	<label for="motivo">
		<g:message code="indisponibilidade.motivo.label" default="Motivo" />
		
	</label>
	<g:textField name="motivo" value="${indisponibilidadeInstance?.motivo}"/>
</div>