<%@ page import="br.com.reservas.Condominio" %>



<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="condominio.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" value="${condominioInstance?.nome}" required=""/>
</div>

<g:render template="/endereco/form" model="['enderecoInstance':condominioInstance?.endereco]"/>

<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'administradores', 'error')} ">
	<label for="administradores">
		<g:message code="condominio.administradores.label" default="Administradores" />
		
	</label>
	<g:select name="administradores" from="${br.com.reservas.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${condominioInstance?.administradores*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'apartamentos', 'error')} ">
	<label for="apartamentos">
		<g:message code="condominio.apartamentos.label" default="Apartamentos" />
		
	</label>
	
	<ul class="one-to-many">
		<g:each in="${condominioInstance?.apartamentos?}" var="a">
		    <li><g:link controller="apartamento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:if test="${condominioInstance?.id}">
				<g:link controller="apartamento" action="create" params="['condominio.id': condominioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'apartamento.label', default: 'Apartamento')])}</g:link>	
			</g:if>
			<g:else>
				<span class="disabled">${message(code: 'default.add.label', args: [message(code: 'apartamento.label', default: 'Apartamento')])}</span>				
			</g:else>			
		</li>
	</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'recursos', 'error')} ">
	<label for="recursos">
		<g:message code="condominio.recursos.label" default="Recursos" />
		
	</label>
	
	<ul class="one-to-many">
		<g:each in="${condominioInstance?.recursos?}" var="r">
		    <li><g:link controller="recurso" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:if test="${condominioInstance?.id}">
				<g:link controller="recurso" action="create" params="['condominio.id': condominioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'recurso.label', default: 'Recurso')])}</g:link>	
			</g:if>
			<g:else>
				<span class="disabled">${message(code: 'default.add.label', args: [message(code: 'recurso.label', default: 'Recurso')])}</span>				
			</g:else>			
		</li>
	</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'mensalidades', 'error')} ">
	<label for="mensalidades">
		<g:message code="condominio.mensalidades.label" default="Mensalidades" />
		
	</label>
	
	<ul class="one-to-many">
		<g:each in="${condominioInstance?.mensalidades?}" var="m">
		    <li><g:link controller="mensalidade" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:if test="${condominioInstance?.id}">
				<g:link controller="mensalidade" action="create" params="['condominio.id': condominioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'mensalidade.label', default: 'Mensalidade')])}</g:link>	
			</g:if>
			<g:else>
				<span class="disabled">${message(code: 'default.add.label', args: [message(code: 'mensalidade.label', default: 'Mensalidade')])}</span>				
			</g:else>
		</li>
	</ul>

</div>


