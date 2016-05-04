<g:if test="${cidadeInstanceList}">
	<g:select id="cidade" name="cidade.id" from="${cidadeInstanceList}" optionKey="id" required="" value="${cidadeInstance?.id}" class="many-to-one" noSelection="['':'Selecione uma cidade...']" />
</g:if>
<g:else>
	<g:select id="cidade" name="cidade.id" from="" optionKey="id" required="" value="" class="many-to-one" noSelection="['':'Selecione um estado antes...']" disabled="true"/>
</g:else>