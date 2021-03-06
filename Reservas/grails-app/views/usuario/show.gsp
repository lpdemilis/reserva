
<%@ page import="br.com.reservas.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<%--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="usuario.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${usuarioInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${usuarioInstance?.username}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="username-label" class="property-label"><g:message code="usuario.username.label" default="Username" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usuarioInstance}" field="username"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
<%--				<g:if test="${usuarioInstance?.password}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="password-label" class="property-label"><g:message code="usuario.password.label" default="Password" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${usuarioInstance}" field="password"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${usuarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="usuario.email.label" default="E-mail" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="usuario.accountExpired.label" default="Conta expirou" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${usuarioInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="usuario.accountLocked.label" default="Conta bloqueada" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="usuario.enabled.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="usuario.passwordExpired.label" default="Password Expirou" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ehUsuarioLogado}">
					<g:if test="${usuarioInstance?.planos}">
					<li class="fieldcontain">
						<span id="planos-label" class="property-label"><g:message code="usuario.planos.label" default="Planos" /></span>
						
							<g:each in="${usuarioInstance.planos}" var="p">
								<g:if test="${p?.id}">
									<span class="property-value" aria-labelledby="planos-label"><g:link controller="plano" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
								</g:if>	
							</g:each>
						
					</li>
					</g:if>
				</g:if>	
			
			</ol>
			<g:if test="${ehUsuarioLogado}">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${usuarioInstance?.id}" />
						<g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>	
		</div>
	</body>
</html>
