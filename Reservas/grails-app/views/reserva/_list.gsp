			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
									
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="recurso.condominio" title="${message(code: 'reserva.recurso.condominio.label', default: 'Condomínio')}" />
						
						<g:sortableColumn property="recurso" title="${message(code: 'reserva.recurso.label', default: 'Recurso')}" />
											
						<g:sortableColumn property="dataInicioEvento" title="${message(code: 'reserva.dataInicioEvento.label', default: 'Início do evento')}" />
						
						<g:sortableColumn property="dataFimEvento" title="${message(code: 'reserva.dataFimEvento.label', default: 'Fim do evento')}" />
					
						<th><g:message code="reserva.status.label" default="Status" /></th>
					
						<th><g:message code="reserva.apartamento.label" default="Apartamento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservaInstanceList}" status="i" var="reservaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="condominio" action="show" id="${reservaInstance.recurso.condominio.id}">${fieldValue(bean: reservaInstance, field: "recurso.condominio")}</g:link></td>
						
						<td><g:link controller="recurso" action="show" id="${reservaInstance.recurso.id}">${fieldValue(bean: reservaInstance, field: "recurso")}</g:link></td>
																	
						<td><g:link controller="reserva" action="show" id="${reservaInstance.id}"><g:formatDate date="${reservaInstance.dataInicioEvento}" format="dd/MM/yyyy HH:mm:ss" /></g:link></td>
						
						<td><g:link controller="reserva" action="show" id="${reservaInstance.id}"><g:formatDate date="${reservaInstance.dataFimEvento}" format="dd/MM/yyyy HH:mm:ss" /></g:link></td>
					
						<td>
							<g:if test="${reservaInstance.aprovada}">
								<g:message code="reserva.aprovada.label" default="Aprovada" />
							</g:if>
							<g:else>
								<g:if test="${reservaInstance.cancelada}">
									<g:message code="reserva.cancelada.label" default="Cancelada" />
								</g:if>
								<g:else>
									<g:message code="reserva.pendente.label" default="Pendente" />
								</g:else>
							</g:else>							
						</td>
																
						<td><g:link controller="apartamento" action="show" id="${reservaInstance.apartamento.id}">${fieldValue(bean: reservaInstance, field: "apartamento")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservaInstanceTotal}" />
			</div>