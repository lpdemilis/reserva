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