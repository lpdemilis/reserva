<%@ page import="br.com.reservas.Apartamento" %>



<div class="fieldcontain ${hasErrors(bean: apartamentoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="apartamento.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${apartamentoInstance.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: apartamentoInstance, field: 'bloco', 'error')} ">
	<label for="bloco">
		<g:message code="apartamento.bloco.label" default="Bloco" />
		
	</label>
	<g:textField name="bloco" value="${apartamentoInstance?.bloco}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apartamentoInstance, field: 'condominio', 'error')} required">
	<label for="condominio">
		<g:message code="apartamento.condominio.label" default="Condominio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="condominio" name="condominio.id" from="${br.com.reservas.Condominio.list()}" optionKey="id" required="" value="${apartamentoInstance?.condominio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apartamentoInstance, field: 'convites', 'error')} ">
	<label for="convites">
		<g:message code="apartamento.convites.label" default="Convites" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${apartamentoInstance?.convites?}" var="c">
    <li><g:link controller="convite" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="convite" action="create" params="['apartamento.id': apartamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'convite.label', default: 'Convite')])}</g:link>
</li>
</ul>

</div>

