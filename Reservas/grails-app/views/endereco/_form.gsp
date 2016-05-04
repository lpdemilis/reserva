<%@ page import="br.com.reservas.Endereco" %>



<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'error')} required">
	<label for="logradouro">
		<g:message code="endereco.logradouro.label" default="Logradouro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="logradouro" value="${enderecoInstance?.logradouro}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'complemento', 'error')} ">
	<label for="complemento">
		<g:message code="endereco.complemento.label" default="Complemento" />
		
	</label>
	<g:textField name="complemento" value="${enderecoInstance?.complemento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="endereco.numero.label" default="Número" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${enderecoInstance?.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} required">
	<label for="bairro">
		<g:message code="endereco.bairro.label" default="Bairro" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bairro" value="${enderecoInstance?.bairro}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} ">
	<label for="cep">
		<g:message code="endereco.cep.label" default="CEP" />
		
	</label>
	<g:textField name="cep" value="${enderecoInstance?.cep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="endereco.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${br.com.reservas.Estado.list()}" optionKey="id" required="" value="${enderecoInstance?.cidade?.estado?.id}" class="many-to-one" noSelection="['':'Selecione um Estado...']" onchange="${remoteFunction(controller: 'cidade', action: 'buscaCidades', params: '\'estado=\' + this.value', update:'cidadeSelect')}" />
		
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="endereco.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
<%--	<g:select id="cidade" name="cidade.id" from="${cidadeInstanceList}" optionKey="id" required="" value="${enderecoInstance?.cidade?.id}" class="many-to-one" noSelection="['':'Selecione uma Cidade...']" />--%>
	<div id="cidadeSelect" style="display: inline;">
		<g:render template="/cidade/cidade" model="[cidades: cidades, cidade:enderecoInstance?.cidade?.id]" ></g:render>
	</div>
</div>

