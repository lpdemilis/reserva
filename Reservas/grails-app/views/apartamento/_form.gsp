<%@ page import="br.com.reservas.Apartamento" %>

<g:if test="${apartamentoInstance?.condominio}">
	<div class="fieldcontain">
		<label for="condominio">
			<g:message code="apartamento.condominio.label" default="Nome do condomínio" />			
		</label>
		
		<g:link controller="condominio" action="show" id="${apartamentoInstance?.condominio?.id}">${apartamentoInstance?.condominio?.encodeAsHTML()}</g:link>
					
	</div>
</g:if>


<div class="fieldcontain ${hasErrors(bean: apartamentoInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="apartamento.numero.label" default="Número do apartamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="text" value="${apartamentoInstance.numero}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: apartamentoInstance, field: 'bloco', 'error')} ">
	<label for="bloco">
		<g:message code="apartamento.bloco.label" default="Bloco" />
		
	</label>
	<g:textField name="bloco" value="${apartamentoInstance?.bloco}"/>
</div>

<g:hiddenField id="condominio" name="condominio.id" required="" value="${apartamentoInstance?.condominio?.id}" />

<div class="fieldcontain ${hasErrors(bean: apartamentoInstance, field: 'convites', 'error')} ">
	<label for="convites">
		<g:message code="apartamento.convites.label" default="Convites" />
		
	</label>
	
	<ul class="one-to-many">
		<g:each in="${apartamentoInstance?.convites?}" var="c">
		    <li>
		    	<div class="fieldcontain-list-item">
		    		<span>
		    			<g:link controller="convite" action="show" id="${c.id}"><span class="marker">► </span>${c?.encodeAsHTML()}</g:link>
		    		</span>	
		    	</div>	
		    </li>
		</g:each>
		
		<li class="add">
			<g:if test="${apartamentoInstance?.id}">
				<g:link class="adicionar-button" controller="convite" action="create" params="['apartamento.id': apartamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'convite.label', default: 'Convite')])}</g:link>	
			</g:if>
			<g:else>
				<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'convite.label', default: 'Convite')])}</div>				
			</g:else>			
		</li>
			
	</ul>

</div>

