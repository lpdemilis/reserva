<g:if test="${recursoInstanceList}">
	<g:select id="recurso" name="recurso.id" from="${recursoInstanceList}" optionKey="id" required="" value="0" class="many-to-one" />
</g:if>
<g:else>
	<g:select id="recurso" name="recurso.id" from="" optionKey="id" required="" value="" class="many-to-one" noSelection="['':'Selecione um condomínio antes...']" disabled="true"/>
</g:else>