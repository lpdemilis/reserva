<%@ page import="br.com.reservas.Plano" %>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'tipoPlano', 'error')} required">
	<label for="tipoPlano">
		<g:message code="plano.tipoPlano.label" default="Tipo de Plano" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${planoInstance?.id }">
		<g:select id="tipoPlano" name="tipoPlano.id" from="${br.com.reservas.TipoPlano.list()}" optionKey="id" required="" value="${planoInstance?.tipoPlano?.id}" class="many-to-one" noSelection="['':'Selecione um tipo de plano...']"/>
	</g:if>
	<g:else>
		<g:select id="tipoPlano" name="tipoPlano.id" from="${br.com.reservas.TipoPlano.list()}" optionKey="id" required="" value="${params.tipoPlanoInstanceId}" class="many-to-one" noSelection="['':'Selecione um tipo de plano...']"/>
	</g:else>	
</div>

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'dataInicio', 'error')} required">
	<label for="dataInicio">
		<g:message code="plano.dataInicio.label" default="Data de Início" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataInicio" precision="day"  value="${planoInstance?.dataInicio}"  />
</div>

<g:if test="${planoInstance?.dataFim}">
	<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'dataFim', 'error')} ">
		<label for="dataFim">
			<g:message code="plano.dataFim.label" default="Data Fim" />
			
		</label>
		<g:datePicker name="dataFim" precision="day"  value="${planoInstance?.dataFim}" default="none" noSelection="['': '']" />
	</div>
</g:if>	

<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="plano.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${planoInstance?.ativo}" checked="true"/>
</div>

<g:hiddenField id="usuario" name="usuario.id" value="${usuarioInstance?.id}" />

<h1><g:message code="default.create.label" args="['um Condomínio']" /></h1>
<g:render template="/condominio/form" model="['condominioInstance':planoInstance?.condominio]"/>