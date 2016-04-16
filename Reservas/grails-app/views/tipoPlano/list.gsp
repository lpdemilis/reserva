
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
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>

		<div id="list-tipoPlano" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
<%--			<table>--%>
<%--				<thead>--%>
<%--					<tr>--%>
<%--					--%>
<%--						<g:sortableColumn property="dataCriacao" title="${message(code: 'tipoPlano.dataCriacao.label', default: 'Data Criacao')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="dataEncerramento" title="${message(code: 'tipoPlano.dataEncerramento.label', default: 'Data Encerramento')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="valor" title="${message(code: 'tipoPlano.valor.label', default: 'Valor')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="ativo" title="${message(code: 'tipoPlano.ativo.label', default: 'Ativo')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="nuMaxRecursos" title="${message(code: 'tipoPlano.nuMaxRecursos.label', default: 'Nu Max Recursos')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="nuMaxApartamentos" title="${message(code: 'tipoPlano.nuMaxApartamentos.label', default: 'Nu Max Apartamentos')}" />--%>
<%--						--%>
<%--						<th><g:message code="plano.acao.label" default="Ação" /></th>--%>
<%--					--%>
<%--					</tr>--%>
<%--				</thead>--%>
<%--				<tbody>--%>
<%--				<g:each in="${tipoPlanoInstanceList}" status="i" var="tipoPlanoInstance">--%>
<%--					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--%>
<%--					--%>
<%--						<td><g:link action="show" id="${tipoPlanoInstance.id}">${fieldValue(bean: tipoPlanoInstance, field: "dataCriacao")}</g:link></td>--%>
<%--					--%>
<%--						<td><g:formatDate date="${tipoPlanoInstance.dataEncerramento}" /></td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: tipoPlanoInstance, field: "valor")}</td>--%>
<%--					--%>
<%--						<td><g:formatBoolean boolean="${tipoPlanoInstance.ativo}" /></td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxRecursos")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxApartamentos")}</td>--%>
<%--						--%>
<%--						<td>--%>
<%--							<g:form controller="plano" action="create">--%>
<%--								<g:hiddenField name="tipoPlanoInstanceId" value="${tipoPlanoInstance.id}"/>--%>
<%--								<g:submitButton class="confirm" value="Adicionar Plano" name="adicionarPlano" />--%>
<%--							</g:form>--%>
<%--						</td>--%>
<%--					--%>
<%--					</tr>--%>
<%--				</g:each>--%>
<%--				</tbody>--%>
<%--			</table>--%>
<%--			<div class="pagination">--%>
<%--				<g:paginate total="${tipoPlanoInstanceTotal}" />--%>
<%--			</div>--%>
		</div>
		
		<div class="tipoPlano">
			<ul>
				<g:each in="${tipoPlanoInstanceList}" status="i" var="tipoPlanoInstance">
					<g:if test="${tipoPlanoInstance.ativo}">
						<li>
							<div class="tipoPlano-box">
								<div class="tipoPlano-box-valor"><g:formatNumber number="${tipoPlanoInstance.valor}" type="currency" currencyCode="BRL" /></div>
								<div class="tipoPlano-box-descricao">${message(code: 'tipoPlano.nuCondominios.label', default: 'Nº máximo de condomínios: ')}<span>01</span></div>
								<div class="tipoPlano-box-descricao">${message(code: 'tipoPlano.nuMaxApartamentos.label', default: 'Nº máximo de apartamentos: ')}<span>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxApartamentos")}</span></div>
								<div class="tipoPlano-box-descricao">${message(code: 'tipoPlano.nuMaxRecursos.label', default: 'Nº máximo de recursos: ')}<span>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxRecursos")}</span></div>
<%--								<div class="tipoPlano-box-descricao">${message(code: 'tipoPlano.dataCriacao.label', default: 'Inicio da vigência: ')}<span><g:formatDate format="dd/MM/yyyy" date="${tipoPlanoInstance.dataCriacao}"/></span></div>--%>
								<div class="tipoPlano-box-adicionar">
									<g:form controller="plano" action="create">
										<g:hiddenField name="tipoPlanoInstanceId" value="${tipoPlanoInstance.id}"/>
										<g:submitButton class="confirm" value="Adicionar Plano" name="adicionarPlano" />
									</g:form>
								</div>
							</div>
						</li>
					</g:if>
				</g:each>
			</ul>	
		</div>		
	</body>
</html>
