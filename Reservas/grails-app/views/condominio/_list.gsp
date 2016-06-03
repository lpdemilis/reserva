	<g:if test="${condominioInstanceTotal}">
		<div id="list-condominio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="['Condomínios Encontrados']" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'condominio.nome.label', default: 'Nome do Condomínio')}" />
					
						<th><g:message code="condominio.endereco.label" default="Endereço" /></th>
						
<%--						<th><g:message code="condominio.recurso.label" default="Recursos" /></th>--%>
						
<%--						<th><g:message code="condominio.administradores.label" default="Administradores" /></th>--%>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${condominioInstanceList}" status="i" var="condominioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${condominioInstance.id}">${fieldValue(bean: condominioInstance, field: "nome")}</g:link></td>
					
						<td>${condominioInstance.endereco.toHTML()}</td>
						
<%--						<td>--%>
<%--							<g:each in="${condominioInstance.recursos.sort { it.nome }}" status="k" var="recursoInstance">--%>
<%--								<div class="tab-value"><g:link controller="recurso" action="show" id="${recursoInstance.id}"><span class="marker">► </span>${recursoInstance}</g:link></div>--%>
<%--							</g:each>--%>
<%--						</td>--%>

<%--						<td>--%>
<%--							<g:each in="${condominioInstance.administradores}" status="k" var="administradorInstance">--%>
<%--								<div class="tab-value"><g:link controller="usuario" action="show" id="${administradorInstance.id}"><span class="marker">► </span>${fieldValue(bean: administradorInstance, field: "nome")}</g:link></div>--%>
<%--							</g:each> --%>
<%--						</td>--%>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${condominioInstanceTotal}" />
			</div>
		</div>
	</g:if>
	<g:else>
		<div class="message" role="status"><g:message code="condominio.nenhum.resultado.label" default="Nenhum resultado foi encontrado" /></div>
	</g:else>
