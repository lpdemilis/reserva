<%@ page import="br.com.reservas.Convite" %>



<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="convite.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${br.com.reservas.Usuario.list()}" optionKey="id" value="${conviteInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'dataConvite', 'error')} required">
	<label for="dataConvite">
		<g:message code="convite.dataConvite.label" default="Data Convite" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataConvite" precision="day"  value="${conviteInstance?.dataConvite}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'dataAceite', 'error')} ">
	<label for="dataAceite">
		<g:message code="convite.dataAceite.label" default="Data Aceite" />
		
	</label>
	<g:datePicker name="dataAceite" precision="day"  value="${conviteInstance?.dataAceite}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="convite.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${conviteInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'apartamento', 'error')} required">
	<label for="apartamento">
		<g:message code="convite.apartamento.label" default="Apartamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="apartamento" name="apartamento.id" from="${br.com.reservas.Apartamento.list()}" optionKey="id" required="" value="${conviteInstance?.apartamento?.id}" class="many-to-one"/>
</div>

