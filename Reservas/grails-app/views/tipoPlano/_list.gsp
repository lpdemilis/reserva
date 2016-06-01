
		<div class="tipoPlano">
			<ul>
				<g:each in="${tipoPlanoInstanceList}" status="i" var="tipoPlanoInstance">
					<g:if test="${tipoPlanoInstance.ativo}">
						<li>
							<div class="tipoPlano-box">
								<div class="tipoPlano-box-valor"><g:formatNumber number="${tipoPlanoInstance.valor}" type="currency" currencyCode="BRL" /></div>
								<div class="tipoPlano-box-valor-mes">${message(code: 'tipoPlano.valor.mes.label', default: 'por mês')}</div>
								<div class="tipoPlano-box-descricao"><span class="marker">►</span>${message(code: 'tipoPlano.nuCondominios.label', default: 'Nº máximo de condomínios: ')}<span>01</span></div>
								<div class="tipoPlano-box-descricao"><span class="marker">►</span>${message(code: 'tipoPlano.nuMaxApartamentos.label', default: 'Nº máximo de apartamentos: ')}<span>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxApartamentos")}</span></div>
								<div class="tipoPlano-box-descricao"><span class="marker">►</span>${message(code: 'tipoPlano.nuMaxRecursos.label', default: 'Nº máximo de recursos: ')}<span>${fieldValue(bean: tipoPlanoInstance, field: "nuMaxRecursos")}</span></div>

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