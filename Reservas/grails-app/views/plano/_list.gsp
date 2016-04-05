			<div id="list-meusplanos" class="content scaffold-list" role="main">
				<h1><g:message code="default.list.label" args="['Meus Planos']" /></h1>
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
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${meusPlanosInstanceList}" status="i" var="planoInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${planoInstance.id}">${fieldValue(bean: planoInstance, field: "dataInicio")}</g:link></td>
						
							<td><g:formatDate date="${planoInstance.dataFim}" /></td>
						
							<td>${fieldValue(bean: planoInstance, field: "valor")}</td>
						
							<td><g:formatBoolean boolean="${planoInstance.ativo}" /></td>
						
							<td>${fieldValue(bean: planoInstance, field: "nuMaxRecursos")}</td>
						
							<td>${fieldValue(bean: planoInstance, field: "nuMaxApartamentos")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${meusPlanosInstanceTotal}" />
				</div>
			</div>