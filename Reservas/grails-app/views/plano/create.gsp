<%@ page import="br.com.reservas.Plano" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plano.label', default: 'Plano')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-plano" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link class="list" action="list"><g:message code="default.todos.planos.label" args="[entityName]" default="Todos os Planos"/></g:link></li>
				</sec:ifAnyGranted>	
				<li><g:link class="list" action="list"><g:message code="default.meus.planos.label" args="[entityName]" default="Meus Planos" /></g:link></li>
			</ul>
		</div>
		<div id="create-plano" class="content scaffold-create" role="main">
			<h1><g:message code="plano.ADICIONAR.label" default="Adicionar um novo Plano"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${planoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${planoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
												
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			
			<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
			<form action="https://pagseguro.uol.com.br/v2/pre-approvals/request.html" method="post">
			<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
			<input type="hidden" name="code" value="A2BA489E63636FA9940BAFAB383C888A" />
			<input type="hidden" name="iot" value="button" />
			<input type="image" src="https://stc.pagseguro.uol.com.br/public/img/botoes/assinaturas/209x48-contratar-cinza-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
			</form>
			<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
		</div>
	</body>
</html>
