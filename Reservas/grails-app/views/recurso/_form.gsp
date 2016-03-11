<%@ page import="br.com.reservas.Recurso" %>



<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="recurso.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${recursoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'exigeConfirmacao', 'error')} ">
	<label for="exigeConfirmacao">
		<g:message code="recurso.exigeConfirmacao.label" default="Exige Confirmacao" />
		
	</label>
	<g:checkBox name="exigeConfirmacao" value="${recursoInstance?.exigeConfirmacao}" />
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'numeroMaxReservas', 'error')} required">
	<label for="numeroMaxReservas">
		<g:message code="recurso.numeroMaxReservas.label" default="Numero Max Reservas" />
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

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'condominio', 'error')} required">
	<label for="condominio">
		<g:message code="recurso.condominio.label" default="Condominio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="condominio" name="condominio.id" from="${br.com.reservas.Condominio.list()}" optionKey="id" required="" value="${recursoInstance?.condominio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="recurso.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${recursoInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'indisponibilidades', 'error')} ">
	<label for="indisponibilidades">
		<g:message code="recurso.indisponibilidades.label" default="Indisponibilidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${recursoInstance?.indisponibilidades?}" var="i">
    <li><g:link controller="indisponibilidade" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="indisponibilidade" action="create" params="['recurso.id': recursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'reserva', 'error')} ">
	<label for="reserva">
		<g:message code="recurso.reserva.label" default="Reserva" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${recursoInstance?.reserva?}" var="r">
    <li><g:link controller="reserva" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reserva" action="create" params="['recurso.id': recursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reserva.label', default: 'Reserva')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="recurso.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: recursoInstance, field: 'valor')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'capacidade', 'error')}">
	<label for="capacidade">
		<g:message code="recurso.capacidade.label" default="Capacidade" />
	</label>
	<g:field name="capacidade" type="number" value="${recursoInstance.capacidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'tempoReserva', 'error')}">
	<label for="tempoReserva">
		<g:message code="recurso.tempoReserva.label" default="Tempo Reserva" />
	</label>
	<g:field name="tempoReserva" type="number" value="${recursoInstance.tempoReserva}"/>
</div>