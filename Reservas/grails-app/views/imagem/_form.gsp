<%@ page import="br.com.reservas.Imagem" %>


<g:if test="${imagemInstance?.imagem}">
	<div class="fieldcontain">
		<label for="imagem">
			<g:message code="imagem.imagem.label" default="" />
		
		</label>
		<img class="imagem-miniatura" src="${createLink(controller:'imagem', action:'imagem', id:imagemInstance.id)}" />
				
	</div>
</g:if>


<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'imagem', 'error')} ">
	<label for="imagem">
		<g:message code="imagem.imagem.label" default="Imagem" />
		
	</label>
	<input type="file" id="imagem" name="imagem" />
</div>

<%--<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'recurso', 'error')} required">--%>
<%--	<label for="recurso">--%>
<%--		<g:message code="imagem.recurso.label" default="Recurso" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="recurso" name="recurso.id" from="${br.com.reservas.Recurso.list()}" optionKey="id" required="" value="${imagemInstance?.recurso?.id}" class="many-to-one"/>--%>
<%--</div>--%>

<g:hiddenField id="recurso" name="recurso.id" value="${imagemInstance?.recurso?.id}"/>

