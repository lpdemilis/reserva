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



<%--<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'condominio', 'error')} ">--%>
<%--	<label for="condominio">--%>
<%--		<g:message code="plano.condominio.label" default="Condominio" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:select id="condominio" name="condominio.id" from="${br.com.reservas.Condominio.list()}" optionKey="id" value="${planoInstance?.condominio?.id}" class="many-to-one" noSelection="['null': '']"/>--%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: planoInstance, field: 'usuario', 'error')} required">--%>
<%--	<label for="usuario">--%>
<%--		<g:message code="plano.usuario.label" default="Usuario" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="usuario" name="usuario.id" from="${br.com.reservas.Usuario.list()}" optionKey="id" required="" value="${planoInstance?.usuario?.id}" class="many-to-one"/>--%>
<%--</div>--%>
<g:hiddenField id="usuario" name="usuario.id" value="${usuarioInstance?.id}" />

<h1><g:message code="default.create.label" args="['um Condomínio']" /></h1>
<g:render template="/condominio/form" model="['condominioInstance':planoInstance?.condominio]"/>