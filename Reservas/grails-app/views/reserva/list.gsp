
<%@ page import="br.com.reservas.Reserva" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserva.label', default: 'Reserva')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reserva" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>	
			</ul>
		</div>
		<div id="list-reserva" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<div class="nav">
				<g:formRemote name="search" url="[action:'search']" update="searchResult">	
					<label for="condominio">
						<g:message code="condominio.label" default="Condomínio" />
						<span class="required-indicator">*</span>
					</label>
					<g:select id="condominio" name="condominio.id" from="${condominioInstanceList}" optionKey="id" required="" value="0" class="many-to-one" onchange="${remoteFunction(controller: 'recurso', action: 'buscaRecursos', params: '\'condominio=\' + this.value', update:'recursoSelect')}" />
					
					<label for="recurso">
						<g:message code="condominio.recurso.label" default="Recurso" />
						<span class="required-indicator">*</span>
					</label>
					<div id="recursoSelect" style="display: inline;">
						<g:render template="/recurso/recurso" model="[recursoInstanceList: recursoInstanceList]" ></g:render>
					</div>
									
			        <g:submitButton name="search" value="Buscar"/>
			        
	    		</g:formRemote>
			</div>
			
			<div id="searchResult">
				<g:render template="list"/>
			</div>
		</div>
	</body>
</html>
