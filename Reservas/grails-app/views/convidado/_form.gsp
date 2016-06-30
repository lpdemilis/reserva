<%@ page import="br.com.reservas.Convidado" %>



<div class="fieldcontain ${hasErrors(bean: convidadoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="convidado.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" value="${convidadoInstance?.nome}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: convidadoInstance, field: 'cpf', 'error')} ">
	<label for="cpf">
		<g:message code="convidado.cpf.label" default="Cpf" />
		
	</label>
	<g:textField name="cpf" value="${convidadoInstance?.cpf}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: convidadoInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="convidado.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${convidadoInstance?.email}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: convidadoInstance, field: 'reserva', 'error')} required">--%>
<%--	<label for="reserva">--%>
<%--		<g:message code="convidado.reserva.label" default="Reserva" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="reserva" name="reserva.id" from="${br.com.reservas.Reserva.list()}" optionKey="id" required="" value="${convidadoInstance?.reserva?.id}" class="many-to-one"/>--%>
<%--</div>--%>

<g:hiddenField id="reserva" name="reserva.id" value="${convidadoInstance?.reserva?.id}"/>

<div class="fieldcontain ${hasErrors(bean: convidadoInstance, field: 'telefone', 'error')} ">
	<label for="telefone">
		<g:message code="convidado.telefone.label" default="Telefone" />
		
	</label>
	<g:textField name="telefone" value="${convidadoInstance?.telefone}"/>
</div>

