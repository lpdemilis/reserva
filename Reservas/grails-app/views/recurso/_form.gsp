<%@ page import="br.com.reservas.Recurso" %>



<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="recurso.nome.label" default="Nome do Recurso" />
		
	</label>
	<g:textField name="nome" value="${recursoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'exigeConfirmacao', 'error')} ">
	<label for="exigeConfirmacao">
		<g:message code="recurso.exigeConfirmacao.label" default="Exige confirmação" />
		
	</label>
	<g:checkBox name="exigeConfirmacao" value="${recursoInstance?.exigeConfirmacao}" />
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'numeroMaxReservas', 'error')} required">
	<label for="numeroMaxReservas">
		<g:message code="recurso.numeroMaxReservas.label" default="Nº máximo de reservas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroMaxReservas" type="number" value="${recursoInstance.numeroMaxReservas}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="recurso.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${recursoInstance?.ativo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'tempoReserva', 'error')} required">
	<label for="tempoReserva">
		<g:message code="recurso.tempoReserva.label" default="Tempo da reserva" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tempoReserva" type="number" value="${recursoInstance.tempoReserva}" required=""/>
	<g:select id="unidadeTempoReserva" name="unidadeTempoReserva.id" from="${br.com.reservas.UnidadeTempoReserva.list()}" optionKey="id" required="" value="${recursoInstance?.unidadeTempoReserva?.id}" class="many-to-one" noSelection="['':'Unidade de tempo...']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'valor', 'error')} ">
	<label for="valor">
		<g:message code="recurso.valor.label" default="Valor (R\$)" />
		
	</label>
	<g:field type="number" step="any" name="valor" value="${fieldValue(bean: recursoInstance, field: 'valor')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'capacidade', 'error')} ">
	<label for="capacidade">
		<g:message code="recurso.capacidade.label" default="Capacidade (pessoas)" />
		
	</label>
	<g:field name="capacidade" type="number" value="${recursoInstance.capacidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'condominio', 'error')} required">
	<label for="condominio">
		<g:message code="recurso.condominio.label" default="Nome do condomínio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="condominio.nome" value="${recursoInstance?.condominio?.nome}" disabled=""/>
	<g:hiddenField id="condominio" name="condominio.id" required="" value="${recursoInstance?.condominio?.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="recurso.descricao.label" default="Descrição" />
		
	</label>
	<g:textArea name="descricao" value="${recursoInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'imagens', 'error')} ">
	<label for="imagens">
		<g:message code="recurso.imagens.label" default="Imagens" />
		
	</label>
	
	<ul class="one-to-many">
		<g:each in="${recursoInstance?.imagens?}" var="i">
		    <li><g:link controller="imagem" action="show" id="${i.id}"><img class="imagem-miniatura" src="${createLink(controller:'imagem', action:'imagem', id:i.id)}" /></g:link></li>
		</g:each>
		<li class="add">
			<g:if test="${recursoInstance?.id}">
				<g:link class="adicionar-button" controller="imagem" action="create" params="['recurso.id': recursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'imagem.label', default: 'Imagem')])}</g:link>
			</g:if>
			<g:else>
				<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'imagem.label', default: 'Imagem')])}</div>				
			</g:else>	
		</li>
	</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'indisponibilidades', 'error')} ">
	<label for="indisponibilidades">
		<g:message code="recurso.indisponibilidades.label" default="Indisponibilidades" />
		
	</label>
	
	<ul class="one-to-many">
<%--		<g:each in="${recursoInstance?.indisponibilidades?}" var="i">--%>
<%--		    <li><g:link controller="indisponibilidade" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>--%>
<%--		</g:each>--%>
		<li class="add">
			<g:if test="${recursoInstance?.id}">
				<g:link class="adicionar-button" controller="indisponibilidade" action="create" params="['recurso.id': recursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade')])}</g:link>
			</g:if>
			<g:else>
				<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade')])}</div>				
			</g:else>	
		</li>
	</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'reserva', 'error')} ">
	<label for="reserva">
		<g:message code="recurso.reserva.label" default="Reservas" />
		
	</label>
	
	<ul class="one-to-many">
<%--		<g:each in="${recursoInstance?.reserva?}" var="r">--%>
<%--	    	<li><g:link controller="reserva" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>--%>
<%--		</g:each>--%>
		<li class="add">
			<g:if test="${recursoInstance?.id}">
				<g:link class="adicionar-button" controller="reserva" action="create" params="['recurso.id': recursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reserva.label', default: 'Reserva')])}</g:link>	
			</g:if>
			<g:else>
				<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'reserva.label', default: 'Reserva')])}</div>				
			</g:else>	
		</li>
	</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'tipoReserva', 'error')} ">
	<label for="tipoReserva">
		<g:message code="recurso.tipoReserva.label" default="Tipo da reserva" />
		
	</label>
	<g:select name="tipoReserva" from="${br.com.reservas.TipoReserva.list()}" multiple="multiple" optionKey="id" size="5" value="${recursoInstance?.tipoReserva*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'cor', 'error')} required">
	<label for="cor">
		<g:message code="recurso.cor.label" default="Cor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cor" name="cor.id" from="${br.com.reservas.Cor.list()}" optionKey="id" required="" value="${recursoInstance?.cor?.id}" class="many-to-one" noSelection="['':'Selecione uma cor...']" />
</div>

