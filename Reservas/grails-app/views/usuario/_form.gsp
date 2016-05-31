<%@ page import="br.com.reservas.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="usuario.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${usuarioInstance?.nome}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">--%>
<%--	<label for="username">--%>
<%--		<g:message code="usuario.username.label" default="Username" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:textField name="username" required="" value="${usuarioInstance?.username}"/>--%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="E-mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${usuarioInstance?.email}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="password" type="password" required="" value="${usuarioInstance?.password}"/>
</div>

<sec:ifAnyGranted roles="ROLE_ADMIN">
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
		<label for="accountExpired">
			<g:message code="usuario.accountExpired.label" default="Account Expired" />
			
		</label>
		<g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
		<label for="accountLocked">
			<g:message code="usuario.accountLocked.label" default="Account Locked" />
			
		</label>
		<g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
		<label for="enabled">
			<g:message code="usuario.enabled.label" default="Enabled" />
			
		</label>
		<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
		<label for="passwordExpired">
			<g:message code="usuario.passwordExpired.label" default="Password Expired" />
			
		</label>
		<g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'planos', 'error')} ">
		<label for="planos">
			<g:message code="usuario.planos.label" default="Planos" />
			
		</label>
		<g:select name="planos" from="${br.com.reservas.Plano.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.planos*.id}" class="many-to-many"/>
	</div>
</sec:ifAnyGranted>

<g:hiddenField name="enabled" value="true"/>
