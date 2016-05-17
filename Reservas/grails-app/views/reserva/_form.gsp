<%@ page import="br.com.reservas.Reserva" %>



<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataSolicitacao', 'error')} required">
	<label for="dataSolicitacao">
		<g:message code="reserva.dataSolicitacao.label" default="Data da solicitação" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataSolicitacao" precision="day"  value="${reservaInstance?.dataSolicitacao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataEvento', 'error')} required">
	<label for="dataEvento">
		<g:message code="reserva.dataEvento.label" default="Data do evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataEvento" precision="day"  value="${reservaInstance?.dataEvento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'aprovada', 'error')} ">
	<label for="aprovada">
		<g:message code="reserva.aprovada.label" default="Aprovada" />
		
	</label>
	<g:checkBox name="aprovada" value="${reservaInstance?.aprovada}" />
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'cancelada', 'error')} ">
	<label for="cancelada">
		<g:message code="reserva.cancelada.label" default="Cancelada" />
		
	</label>
	<g:checkBox name="cancelada" value="${reservaInstance?.cancelada}" />
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="reserva.valor.label" default="Valor (R\$)" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: reservaInstance, field: 'valor')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'apartamento', 'error')} required">
	<label for="apartamento">
		<g:message code="reserva.apartamento.label" default="Apartamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="apartamento" name="apartamento.id" from="${br.com.reservas.Apartamento.list()}" optionKey="id" required="" value="${reservaInstance?.apartamento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="reserva.comentario.label" default="Comentário" />
		
	</label>
	<g:textField name="comentario" value="${reservaInstance?.comentario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'convidados', 'error')} ">
	<label for="convidados">
		<g:message code="reserva.convidados.label" default="Convidados" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${reservaInstance?.convidados?}" var="c">
    <li><g:link controller="convidado" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="convidado" action="create" params="['reserva.id': reservaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'convidado.label', default: 'Convidado')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataAprovacao', 'error')}">
	<label for="dataAprovacao">
		<g:message code="reserva.dataAprovacao.label" default="Data da aprovação" />
	</label>
	<g:datePicker name="dataAprovacao" precision="day"  value="${reservaInstance?.dataAprovacao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataCancelamento', 'error')}">
	<label for="dataCancelamento">
		<g:message code="reserva.dataCancelamento.label" default="Data do cancelamento" />
	</label>
	<g:datePicker name="dataCancelamento" precision="day"  value="${reservaInstance?.dataCancelamento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'recurso', 'error')} required">
	<label for="recurso">
		<g:message code="reserva.recurso.label" default="Recurso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recurso" name="recurso.id" from="${br.com.reservas.Recurso.list()}" optionKey="id" required="" value="${reservaInstance?.recurso?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="reserva.usuario.label" default="Usuário" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${br.com.reservas.Usuario.list()}" optionKey="id" required="" value="${reservaInstance?.usuario?.id}" class="many-to-one"/>
</div>

