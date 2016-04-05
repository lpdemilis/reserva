
<%@ page import="br.com.reservas.Plano" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plano.label', default: 'Plano')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plano" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-plano" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dataInicio" title="${message(code: 'plano.dataInicio.label', default: 'Data Inicio')}" />
					
						<g:sortableColumn property="dataFim" title="${message(code: 'plano.dataFim.label', default: 'Data Fim')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'plano.valor.label', default: 'Valor')}" />
					
						<g:sortableColumn property="ativo" title="${message(code: 'plano.ativo.label', default: 'Ativo')}" />
					
						<g:sortableColumn property="nuMaxRecursos" title="${message(code: 'plano.nuMaxRecursos.label', default: 'Nu Max Recursos')}" />
					
						<g:sortableColumn property="nuMaxApartamentos" title="${message(code: 'plano.nuMaxApartamentos.label', default: 'Nu Max Apartamentos')}" />
						
						<th><g:message code="plano.acao.label" default="Ação" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planoInstanceList}" status="i" var="planoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${planoInstance.id}">${fieldValue(bean: planoInstance, field: "dataInicio")}</g:link></td>
					
						<td><g:formatDate date="${planoInstance.dataFim}" /></td>
					
						<td>${fieldValue(bean: planoInstance, field: "valor")}</td>
					
						<td><g:formatBoolean boolean="${planoInstance.ativo}" /></td>
					
						<td>${fieldValue(bean: planoInstance, field: "nuMaxRecursos")}</td>
					
						<td>${fieldValue(bean: planoInstance, field: "nuMaxApartamentos")}</td>
						
						<td>
							<g:formRemote name="myForm" url="[controller: 'usuario', action: 'adicionarPlano']" update="meus_planos">
								<g:hiddenField name="planoInstanceId" value="${planoInstance.id}"/>
								<g:actionSubmit class="confirm" value="Adicionar Plano" name="adicionarPlano" />
							</g:formRemote>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planoInstanceTotal}" />
			</div>
		</div>
		
		<div id="meus_planos">
			<g:render template="/plano/list" var="meusPlanosInstanceList"/>
		</div>

	</body>
</html>
