<%@ page import="br.com.reservas.Endereco" %>



<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'error')} ">
	<label for="logradouro">
		<g:message code="endereco.logradouro.label" default="Logradouro" />
		
	</label>
	<g:textField name="logradouro" value="${enderecoInstance?.logradouro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'complemento', 'error')} ">
	<label for="complemento">
		<g:message code="endereco.complemento.label" default="Complemento" />
		
	</label>
	<g:textField name="complemento" value="${enderecoInstance?.complemento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="endereco.numero.label" default="Numero" />
		
	</label>
	<g:field name="numero" type="number" value="${enderecoInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} ">
	<label for="bairro">
		<g:message code="endereco.bairro.label" default="Bairro" />
		
	</label>
	<g:textField name="bairro" value="${enderecoInstance?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cep', 'error')} ">
	<label for="cep">
		<g:message code="endereco.cep.label" default="Cep" />
		
	</label>
	<g:textField name="cep" value="${enderecoInstance?.cep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="endereco.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${br.com.reservas.Estado.list()}" optionKey="id" required="" value="${enderecoInstance?.cidade?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="endereco.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cidade" name="cidade.id" from="${br.com.reservas.Cidade.list()}" optionKey="id" required="" value="${enderecoInstance?.cidade?.id}" class="many-to-one"/>
</div>

