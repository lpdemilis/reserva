	<h1><g:message code="default.show.label" args="['Condomínio']" /></h1>
	<g:if test="${condominioInstance?.nome}">
		<li class="fieldcontain">
			<span id="nome-label" class="property-label"><g:message code="condominio.nome.label" default="Nome" /></span>
						
				<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${condominioInstance}" field="nome"/></span>
						
		</li>
	</g:if>
			
	<g:if test="${condominioInstance?.endereco}">
		<li class="fieldcontain">
			<span id="endereco-label" class="property-label"><g:message code="condominio.endereco.label" default="Endereco" /></span>
						
				<span class="property-value" aria-labelledby="endereco-label"><g:link controller="endereco" action="show" id="${condominioInstance?.endereco?.id}">${condominioInstance?.endereco?.toHTML()}</g:link></span>
						
		</li>
	</g:if>
			
	<g:if test="${condominioInstance?.administradores}">
		<li class="fieldcontain">
			<span id="administradores-label" class="property-label"><g:message code="condominio.administradores.label" default="Administradores" /></span>
						
				<g:each in="${condominioInstance.administradores}" var="a">
				<span class="property-value" aria-labelledby="administradores-label"><g:link controller="usuario" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
				</g:each>
						
		</li>
	</g:if>
			
	<g:if test="${condominioInstance?.apartamentos}">
		<li class="fieldcontain">
			<span id="apartamentos-label" class="property-label"><g:message code="condominio.apartamentos.label" default="Apartamentos" /></span>
						
				<g:each in="${condominioInstance.apartamentos}" var="a">
				<span class="property-value" aria-labelledby="apartamentos-label"><g:link controller="apartamento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
				</g:each>
						
		</li>
	</g:if>
			
	<g:if test="${condominioInstance?.recursos}">
		<li class="fieldcontain">
			<span id="recursos-label" class="property-label"><g:message code="condominio.recursos.label" default="Recursos" /></span>
						
				<g:each in="${condominioInstance.recursos}" var="r">
				<span class="property-value" aria-labelledby="recursos-label"><g:link controller="recurso" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
				</g:each>
						
		</li>
	</g:if>