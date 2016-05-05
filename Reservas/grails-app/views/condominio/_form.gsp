<%@ page import="br.com.reservas.Condominio" %>



<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="condominio.nome.label" default="Nome do Condomínio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" value="${condominioInstance?.nome}" required=""/>
</div>

<g:render template="/endereco/form" model="['enderecoInstance':condominioInstance?.endereco]"/>

<g:if test="${condominioInstance?.id}">
	<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'administradores', 'error')} ">
		<label for="administradores">
			<g:message code="condominio.administradores.label" default="Administradores" />
			
		</label>
		<g:select name="administradores" from="${br.com.reservas.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${condominioInstance?.administradores*.id}" class="many-to-many"/>
	</div>
</g:if>
<g:else>
	<g:hiddenField name="administradores" value="${usuarioInstance?.id}" />
</g:else>

<%--<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'plano', 'error')} required">--%>
<%--	<label for="plano">--%>
<%--		<g:message code="condominio.plano.label" default="Plano" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="plano" name="plano.id" from="${meusPlanosInstanceList}" optionKey="id" required="" value="${condominioInstance?.plano?.id}" class="many-to-one" noSelection="['':'Selecione um Plano...']"/>--%>
<%--		--%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: condominioInstance, field: 'apartamentos', 'error')} ">
	<label for="apartamentos">
		<g:message code="condominio.apartamentos.label" default="Apartamentos" />
		
	</label>
	
	<ul class="one-to-many">
		<g:each in="${condominioInstance?.apartamentos?.sort { it.id }}" var="a">
		    <li>
		    	<div class="fieldcontain-list-item">
		    		<span>
		    			<g:link controller="apartamento" action="show" id="${a.id}"><span class="marker">► </span>${a?.toHTML()}</g:link>
		    		</span>
		    	</div>		
		    </li>
		</g:each>
		<li class="add">
			<g:if test="${condominioInstance?.id}">
				<g:link class="adicionar-button" controller="apartamento" action="create" params="['condominio.id': condominioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'apartamento.label', default: 'Apartamento')])}</g:link>	
			</g:if>
			<g:else>
				<div class="disabled">${message(code: 'default.add.label', args: [message(code: 'apartamento.label', default: 'Apartamento')])}</div>				
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
		    <li>
		    	<div class="fieldcontain-list-item">
		    		<span>
		    			<g:link controller="recurso" action="show" id="${r.id}"><span class="marker">► </span>${r?.encodeAsHTML()}</g:link>
		    		</span>	
		    	</div>	
		    </li>
		</g:each>
		<li class="add">
			<g:if test="${condominioInstance?.id}">
				<g:link class="adicionar-button" controller="recurso" action="create" params="['condominio.id': condominioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'recurso.label', default: 'Recurso')])}</g:link>	
			</g:if>
			<g:else>
				<div class="disabled">${message(code: 'default.add.label', args: [message(code: 'recurso.label', default: 'Recurso')])}</div>				
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
		    <li>
		    	<div class="fieldcontain-list-item">
		    		<span>
		    			<g:link controller="mensalidade" action="show" id="${m.id}"><span class="marker">► </span>${m?.encodeAsHTML()}</g:link>
		    		</span>
		    	</div>		
		    			
		    </li>
		    			
		</g:each>
		<li class="add">
			<g:if test="${condominioInstance?.id}">
				<g:link class="adicionar-button" controller="mensalidade" action="create" params="['condominio.id': condominioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'mensalidade.label', default: 'Mensalidade')])}</g:link>	
			</g:if>
			<g:else>
				<div class="disabled">${message(code: 'default.add.label', args: [message(code: 'mensalidade.label', default: 'Mensalidade')])}</div>				
			</g:else>
		</li>
	</ul>

</div>


