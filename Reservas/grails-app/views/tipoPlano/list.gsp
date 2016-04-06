
<%@ page import="br.com.reservas.TipoPlano" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoPlano.label', default: 'TipoPlano')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoPlano" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoPlano" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dataCriacao" title="${message(code: 'tipoPlano.dataCriacao.label', default: 'Data Criacao')}" />
					
						<g:sortableColumn property="dataEncerramento" title="${message(code: 'tipoPlano.dataEncerramento.label', default: 'Data Encerramento')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'tipoPlano.valor.label', default: 'Valor')}" />
					
						<g:sortableColumn property="ativo" title="${message(code: 'tipoPlano.ativo.label', default: 'Ativo')}" />
					
						<g:sortableColumn property="nuMaxRecursos" title="${message(code: 'tipoPlano.nuMaxRecursos.label', default: 'Nu Max Recursos')}" />
					
						<g:sortableColumn property="nuMaxApartamentos" title="${message(code: 'tipoPlano.nuMaxApartamentos.label', default: 'Nu Max Apartamentos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoPlanoInstanceList}" status="i" var="tipoPlanoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoPlanoInstance.id}">${fieldValue(bean: tipoPlanoInstance, field: "dataCriacao")}</g:link></td>
					
						<td><g:formatDate date="${tipoPlanoInstance.dataEncerramento}" /></td>
					
						<td>${fieldValue(bean: tipoPlanoInstance, field: "valor")}</td>
					
						<td><g:formatBoolean boolean="${tipoPlanoInstance.ativo}" /></td>
					
						<td>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxRecursos")}</td>
					
						<td>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxApartamentos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoPlanoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>