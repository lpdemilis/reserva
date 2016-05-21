<%@ page import="br.com.reservas.Reserva" %>


<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'condominio', 'error')}">
	<label for="condominio">
		<g:message code="reserva.condominio.label" default="Nome do condomínio" />
	</label>
	<g:link controller="condominio" action="show" id="${recursoInstance?.condominio?.id}">${recursoInstance?.condominio?.encodeAsHTML()}</g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'recurso', 'error')}">
	<label for="recurso">
		<g:message code="reserva.recurso.label" default="Recurso" />
	</label>
	
	<g:link controller="recurso" action="show" id="${recursoInstance?.id}">${recursoInstance?.encodeAsHTML()}</g:link>
	<g:hiddenField id="recurso" name="recurso.id" value="${reservaInstance?.recurso?.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="reserva.valor.label" default="Valor" />
	</label>

	<g:if test="${action != 'create'}">
		<g:hiddenField name="valor" value="${fieldValue(bean: reservaInstance, field: 'valor')}"/>
		<g:formatNumber number="${reservaInstance?.valor}" type="currency" currencyCode="BRL" />
	</g:if>
	<g:else>
		<g:hiddenField name="valor" value="${fieldValue(bean: recursoInstance, field: 'valor')}"/>
		<g:formatNumber number="${recursoInstance?.valor}" type="currency" currencyCode="BRL" />
	</g:else>		
</div>

<%--<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataSolicitacao', 'error')} required">--%>
<%--	<label for="dataSolicitacao">--%>
<%--		<g:message code="reserva.dataSolicitacao.label" default="Data da solicitação" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:datePicker name="dataSolicitacao" precision="day"  value="${reservaInstance?.dataSolicitacao}"  />--%>
		<g:hiddenField name="dataSolicitacao" value="${reservaInstance?.dataSolicitacao}"  />
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataEvento', 'error')} required">
	<g:if test="${reservaInstance?.id}">
		<label for="dataEvento">
			<g:message code="reserva.dataEvento.label" default="Data do evento" />
			<span class="required-indicator">*</span>
		</label>
		<g:datePicker name="dataEvento" precision="${precision}"  value="${reservaInstance?.dataEvento}"  />
	</g:if>
	<g:else>
		<label for="dataEvento">
			<g:message code="reserva.dataEvento.label" default="Data do evento" />
		</label>
		<g:if test="${recursoInstance?.unidadeTempoReserva?.id == 3}">
			<g:formatDate date="${reservaInstance?.dataEvento}" format="dd/MM/yyyy"/>
		</g:if>
		<g:else>
			<g:formatDate date="${reservaInstance?.dataEvento}" format="dd/MM/yyyy HH:mm:ss"/>
		</g:else>		 
		<g:hiddenField name="dataEvento" value="${reservaInstance?.dataEvento}"  />
		<g:hiddenField name="dataEvento_day" value="${diaEvento}"  />
		<g:hiddenField name="dataEvento_year" value="${anoEvento}"  />
		<g:hiddenField name="dataEvento_month" value="${mesEvento}"  />
		<g:hiddenField name="dataEvento_hour" value="${horaEvento}"  />
		<g:hiddenField name="dataEvento_minute" value="${minutoEvento}"  />
		<g:hiddenField name="dataEvento_second" value="${segundoEvento}"  />
	</g:else>
</div>

<g:if test="${action != 'create'}">
	<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataAprovacao', 'error')}">
		<label for="dataAprovacao">
			<g:message code="reserva.dataAprovacao.label" default="Data da aprovação" />
		</label>
		<g:datePicker name="dataAprovacao" precision="day"  value="${reservaInstance?.dataAprovacao}"  />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'aprovada', 'error')} ">
		<label for="aprovada">
			<g:message code="reserva.aprovada.label" default="Aprovada" />
			
		</label>
		<g:checkBox name="aprovada" value="${reservaInstance?.aprovada}" />
	</div>
</g:if>
<g:else>
	<g:hiddenField name="aprovada" value="false" />
</g:else>	

<g:if test="${action != 'create'}">
	<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'dataCancelamento', 'error')}">
		<label for="dataCancelamento">
			<g:message code="reserva.dataCancelamento.label" default="Data do cancelamento" />
		</label>
		<g:datePicker name="dataCancelamento" precision="day"  value="${reservaInstance?.dataCancelamento}"  />
	</div>

	<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'cancelada', 'error')} ">
		<label for="cancelada">
			<g:message code="reserva.cancelada.label" default="Cancelada" />
			
		</label>
		<g:checkBox name="cancelada" value="${reservaInstance?.cancelada}" />
	</div>
</g:if>	
<g:else>
	<g:hiddenField name="cancelada" value="false" />
</g:else>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'apartamento', 'error')} required">
	<label for="apartamento">
		<g:message code="reserva.apartamento.label" default="Apartamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="apartamento" name="apartamento.id" from="${apartamentoInstanceList}" optionKey="id" required="" value="${reservaInstance?.apartamento?.id}" class="many-to-one" noSelection="['':'Selecione um apartamento...']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="reserva.comentario.label" default="Comentário" />
		
	</label>
	<g:textArea name="comentario" value="${reservaInstance?.comentario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'convidados', 'error')} ">
	<label for="convidados">
		<g:message code="reserva.convidados.label" default="Convidados" />
		
	</label>
		
	<ul class="one-to-many">
		<li class="add">
			<g:if test="${reservaInstance?.id}">
				<g:link class="adicionar-button" controller="convidado" action="create" params="['reserva.id': reservaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'convidado.label', default: 'Convidados')])}</g:link>
			</g:if>
			<g:else>
				<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'convidado.label', default: 'Convidados')])}</div>				
			</g:else>	
		</li>
	</ul>

</div>

<%--<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'usuario', 'error')} required">--%>
<%--	<label for="usuario">--%>
<%--		<g:message code="reserva.usuario.label" default="Usuário" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="usuario" name="usuario.id" from="${br.com.reservas.Usuario.list()}" optionKey="id" required="" value="${reservaInstance?.usuario?.id}" class="many-to-one"/>--%>
<%--</div>--%>

<g:hiddenField  id="usuario" name="usuario.id" value="${reservaInstance?.usuario?.id}" />
