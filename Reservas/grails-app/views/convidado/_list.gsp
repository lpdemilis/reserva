
		<div id="list-convidado" class="content scaffold-list" role="main">
			<h1><g:message code="default.convidado.list.label" default="Lista de Convidados" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'convidado.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="cpf" title="${message(code: 'convidado.cpf.label', default: 'Cpf')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'convidado.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="telefone" title="${message(code: 'convidado.telefone.label', default: 'Telefone')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${convidadoInstanceList}" status="i" var="convidadoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="convidado" action="show" id="${convidadoInstance.id}">${fieldValue(bean: convidadoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: convidadoInstance, field: "cpf")}</td>
					
						<td>${fieldValue(bean: convidadoInstance, field: "email")}</td>
										
						<td>${fieldValue(bean: convidadoInstance, field: "telefone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${convidadoInstanceTotal}" />
			</div>
		</div>	