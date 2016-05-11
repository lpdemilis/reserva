<%@ page import="br.com.reservas.Convite" %>



<g:if test="${condominioInstance?.id}">
	<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'condominio', 'error')} ">
		<label for="condominio">
			<g:message code="convite.condominio.label" default="Nome do condomínio" />
			
		</label>
		<g:link controller="condominio" action="show" id="${condominioInstance?.id}">${condominioInstance?.encodeAsHTML()}</g:link>
	</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="convite.email.label" default="E-mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${conviteInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'apartamento', 'error')} required">
	<label for="apartamento">
		<g:message code="convite.apartamento.label" default="Apartamento" />
	</label>
	<g:link controller="apartamento" action="show" id="${conviteInstance?.apartamento?.id}">${conviteInstance?.apartamento}</g:link>
	<g:hiddenField id="apartamento" name="apartamento.id" value="${conviteInstance?.apartamento?.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'dataConvite', 'error')}">
	<label for="dataConvite">
		<g:message code="convite.dataConvite.label" default="Data do convite" />		
	</label>
	<g:if test="${conviteInstance?.dataConvite}">
		<g:formatDate format="dd/MM/yyyy" date="${conviteInstance?.dataConvite}" />
		<g:hiddenField name="dataConvite" value="${conviteInstance?.dataConvite}"  />
	</g:if>
	<g:else>
		<g:formatDate format="dd/MM/yyyy"  />
		<g:hiddenField name="dataConvite" value=""  />
	</g:else>
</div>

<g:if test="${conviteInstance?.dataAceite }">
	<div class="fieldcontain ${hasErrors(bean: conviteInstance, field: 'dataAceite', 'error')} ">
		<label for="dataAceite">
			<g:message code="convite.dataAceite.label" default="Data do aceite" />
			
		</label>
		<g:datePicker name="dataAceite" precision="day"  value="${conviteInstance?.dataAceite}" default="none" noSelection="['': '']" />
	</div>
</g:if>