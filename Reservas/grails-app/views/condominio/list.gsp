
<%@ page import="br.com.reservas.Condominio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'condominio.label', default: 'Condominio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-condominio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<g:if test="${verificarCriacaoCondominio}">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</g:if>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<g:if test="${!params.todos}">
						<li><g:link class="list" action="list" params="['todos':true]"><g:message code="default.todos.condominio.label" args="[entityName]" default="Todos os Condomínios"/></g:link></li>
					</g:if>	
				</sec:ifAnyGranted>
				<g:if test="${params.todos}">
					<li><g:link class="list" action="list"><g:message code="default.meus.condominio.label" args="[entityName]" default="Meus Condomínios"/></g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="list-condominio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'condominio.nome.label', default: 'Nome do Condomínio')}" />
					
						<th><g:message code="condominio.endereco.label" default="Endereço" /></th>
						
						<th><g:message code="condominio.recurso.label" default="Recursos" /></th>
						
						<th><g:message code="condominio.administradores.label" default="Administradores" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${condominioInstanceList}" status="i" var="condominioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${condominioInstance.id}">${fieldValue(bean: condominioInstance, field: "nome")}</g:link></td>
					
						<td>${condominioInstance.endereco.toHTML()}</td>
						
						<td>
							<g:each in="${condominioInstance.recursos.sort { it.nome }}" status="k" var="recursoInstance">
								<div class="tab-value"><g:link controller="recurso" action="show" id="${recursoInstance.id}"><span class="marker">► </span>${recursoInstance}</g:link></div>
							</g:each>
						</td>
						
						<td>
							<g:each in="${condominioInstance.administradores}" status="k" var="administradorInstance">
								<div class="tab-value"><g:link controller="usuario" action="show" id="${administradorInstance.id}"><span class="marker">► </span>${fieldValue(bean: administradorInstance, field: "nome")}</g:link></div>
							</g:each> 
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${condominioInstanceTotal}" />
			</div>
		</div>
		
		<div class="nav">
<%--			<g:form action="search" method="get">--%>
			<g:formRemote name="search" url="[action:'search']" update="searchResult">	
				<label for="nome">
					<g:message code="condominio.nome.label" default="Nome" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="q" value="${params.q}" required="true"/>
				
				<label for="estado">
					<g:message code="condominio.estado.label" default="Estado" />
					<span class="required-indicator">*</span>
				</label>
				<g:select id="estado" name="estado.id" from="${br.com.reservas.Estado.list()}" optionKey="id" required="" value="" class="many-to-one" noSelection="['':'Selecione um Estado...']" onchange="${remoteFunction(controller: 'cidade', action: 'buscaCidades', params: '\'estado=\' + this.value', update:'cidadeSelect')}" />
				
				<label for="cidade">
					<g:message code="condominio.cidade.label" default="Cidade" />
					<span class="required-indicator">*</span>
				</label>
				<div id="cidadeSelect" style="display: inline;">
					<g:render template="/cidade/cidade" model="[cidades: cidades]" ></g:render>
				</div>
								
		        <g:submitButton name="search" value="Buscar"/>
		        
    		</g:formRemote>
<%--		    </g:form>--%>
		</div>
		
		<div id="searchResult"></div>
			
	</body>
</html>
