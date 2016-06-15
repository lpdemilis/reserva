<g:if test="${condominioInstance.verificarAdministrador()}">
	<h1><g:message code="default.convites.pendentes.label" default="Convites pendentes" args="[entityName]" /></h1>
	<table>
		<thead>
			<th><g:message code="convite.usuario.label" default="Usuário" /></th>
			<th><g:message code="convite.email.label" default="E-mail" /></th>
			<th><g:message code="convite.data.solicitacao.label" default="Data da Solicitação" /></th>
			<th><g:message code="convite.acao.label" default="Ação" /></th>
		</thead>
		<tbody>
			<g:each in="${convitesPendentesList}" var="c">
				<tr>
					<td>
						<g:link controller="usuario" action="show" id="${c.usuario.id}">
							<g:fieldValue bean="${c}" field="usuario"/>
						</g:link>
					</td>
					<td>
						<g:fieldValue bean="${c}" field="email"/>
					</td>
					<td>	
						<g:formatDate date="${c.dataConvite}" format="dd/MM/yyyy HH:mm:ss"/>
					</td>
					<td class="inline-buttons">	
						<g:formRemote name="permissao_form" url="[controller:'convite', action:'atualizarConvite']" update="permissao">
							<g:hiddenField name="id" value="${c.id}"/>
							<g:hiddenField name="condominioInstanceId" value="${condominioInstance.id}"/>
							<g:hiddenField name="aprovado" value="1"/>							
							<g:actionSubmit class="adicionar-button" value="Sim" name="aceitarConvite"/>							
						</g:formRemote>
						
						<g:formRemote name="permissao_form" url="[controller:'convite', action:'atualizarConvite']" update="permissao">
							<g:hiddenField name="id" value="${c.id}"/>
							<g:hiddenField name="condominioInstanceId" value="${condominioInstance.id}"/>
							<g:hiddenField name="aprovado" value="0"/>							
							<g:actionSubmit class="adicionar-button" value="Não" name="negarConvite"/>
						</g:formRemote>
					</td>					
				</tr>			
			</g:each>
		</tbody>	
	</table>
</g:if>
<g:else>	
	<g:if test="${condominioInstance.verificarConvite()}">
		<div class="message" role="status"><g:message code="condominio.aprovacao.label" default="Sua solicitação já foi feita e aguarda aprovação." /></div>
	</g:if>
	<g:else>
		<div class="message" role="status"><g:message code="condominio.nao.usuario.label" default="Você não possui permissão para este condomínio." /></div>
								
		<g:formRemote name="permissao_form" url="[controller:'convite', action:'criarConvite']" update="permissao">
			<g:hiddenField name="condominioInstanceId" value="${condominioInstance.id}"/>
			<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'apartamento', 'error')} required">
				<label for="apartamento">
					<g:message code="condominio.apartamento.label" default="Apartamento" />
					<span class="required-indicator">*</span>
				</label>
				<g:select id="apartamento" name="apartamento.id" from="${condominioInstance?.apartamentos.sort { it.numero }}" optionKey="id" required="" value="" class="many-to-one" noSelection="['':'Selecione um Apartamento...']" />
			</div>
									
			<li class="fieldcontain">
				<span id="permissao-label" class="property-label"></span>
								
				<div class="fieldcontain-list">
					<span class="property-value" aria-labelledby="permissao-label">
						<g:actionSubmit class="adicionar-button" value="Solicitar permissão"/>
					</span>
				</div>	
										
			</li>
									
		</g:formRemote>
	</g:else>
</g:else>	