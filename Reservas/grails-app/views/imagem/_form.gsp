<%@ page import="br.com.reservas.Imagem" %>



<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'imagem', 'error')} ">
	<label for="imagem">
		<g:message code="imagem.imagem.label" default="Imagem" />
		
	</label>
	<input type="file" id="imagem" name="imagem" />
</div>

<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'tipoImagem', 'error')} ">
	<label for="tipoImagem">
		<g:message code="imagem.tipoImagem.label" default="Tipo Imagem" />
		
	</label>
	<g:textField name="tipoImagem" value="${imagemInstance?.tipoImagem}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagemInstance, field: 'recurso', 'error')} required">
	<label for="recurso">
		<g:message code="imagem.recurso.label" default="Recurso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recurso" name="recurso.id" from="${br.com.reservas.Recurso.list()}" optionKey="id" required="" value="${imagemInstance?.recurso?.id}" class="many-to-one"/>
</div>

