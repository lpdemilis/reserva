
<%@ page import="br.com.reservas.Recurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recurso.label', default: 'Recurso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		
		<link href='http://fullcalendar.io/js/fullcalendar-2.7.1/fullcalendar.css' rel='stylesheet' />
		<link href='http://fullcalendar.io/js/fullcalendar-2.7.1/fullcalendar.print.css' rel='stylesheet' media='print' />
		<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
		<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script src='http://fullcalendar.io/js/fullcalendar-2.7.1/fullcalendar.js'></script>
		<script src='http://fullcalendar.io/js/fullcalendar-2.7.1/lang/pt-br.js'></script>
<%--		<script src="${resource(dir: 'fullcalendar-2.7.1/lang', file: 'pt-br.js')}" type="text/javascript"></script>--%>
		
		<script type="text/javascript">
			$(function() { // document ready
			  
			  	$('#calendar').fullCalendar({
					header: {
								left: 'prev,next today',
								center: 'title',
								right: 'prev,next today'
								//right: 'month,agendaWeek,agendaDay'
				    },
	//			    defaultDate: '2014-11-12',
				    editable: false,
				    eventLimit: true, // allow "more" link when too many events
				    defaultView: '${tipoCalendario}',
				    lang: 'pt-br',
				    events: [
							  ${recursoInstance.listaIndisponibilidades()}
							  ${recursoInstance.listaReservas()}
				    ]

				    ,dayClick: function(date, jsEvent, view) {
					    //Fri May 13 00:00:00 BRT 2016					    
					    //var data = new Date(date.format("YYYY-MM-DD HH:mm:ss Y y"));					    
						//alert('Clicked on: ' + date.format());
						//alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
						//alert('Current view: ' + view.name);
				        // change the day's background color just for fun
						//$(this).css('background-color', 'red');
						//$( "#dataEvento" ).val(date.format("ddd MMM DD HH:mm:ss BRT YYYY"));
						$( "#diaEvento" ).val(date.format("DD"));
						$( "#mesEvento" ).val(date.format("MM"));
						$( "#anoEvento" ).val(date.format("YYYY"));
						$( "#horaEvento" ).val(date.format("HH"));
						$( "#minutoEvento" ).val(date.format("mm"));
						$( "#segundoEvento" ).val(date.format("ss"));						
				    	$( "#reserva_form" ).submit();
				    }
				});
			  
			});
		</script>
				
	</head>
	<body>
		<g:form id="reserva_form" name="reserva_form" method="post" url="../../reserva/create">
			<g:hiddenField name="recurso.id" value="${recursoInstance?.id}"/>
			<g:hiddenField name="diaEvento" value=""/>
			<g:hiddenField name="mesEvento" value=""/>
			<g:hiddenField name="anoEvento" value=""/>
			<g:hiddenField name="horaEvento" value=""/>
			<g:hiddenField name="minutoEvento" value=""/>
			<g:hiddenField name="segundoEvento" value=""/>
		</g:form>
		<a href="#show-recurso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>
				<g:if test="${ehAdministrador}">	
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="show-recurso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recurso">
				
				<g:if test="${recursoInstance?.condominio}">
				<li class="fieldcontain">
					<span id="condominio-label" class="property-label"><g:message code="recurso.condominio.label" default="Nome do condomínio" /></span>
					
						<span class="property-value" aria-labelledby="condominio-label"><g:link controller="condominio" action="show" id="${recursoInstance?.condominio?.id}">${recursoInstance?.condominio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="recurso.nome.label" default="Nome do recurso" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><b><g:fieldValue bean="${recursoInstance}" field="nome"/></b></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.exigeConfirmacao}">
				<li class="fieldcontain">
					<span id="exigeConfirmacao-label" class="property-label"><g:message code="recurso.exigeConfirmacao.label" default="Exige confirmação" /></span>
					
						<span class="property-value" aria-labelledby="exigeConfirmacao-label"><g:formatBoolean boolean="${recursoInstance?.exigeConfirmacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.numeroMaxReservas}">
				<li class="fieldcontain">
					<span id="numeroMaxReservas-label" class="property-label"><g:message code="recurso.numeroMaxReservas.label" default="Nº máximo de reservas" /></span>
					
						<span class="property-value" aria-labelledby="numeroMaxReservas-label"><g:fieldValue bean="${recursoInstance}" field="numeroMaxReservas"/><g:message code="recurso.reservas.simultaneas.label" default=" reserva(s) simultânea(s)" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="recurso.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${recursoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.tempoReserva}">
				<li class="fieldcontain">
					<span id="tempoReserva-label" class="property-label"><g:message code="recurso.tempoReserva.label" default="Tempo da reserva" /></span>
					
						<span class="property-value" aria-labelledby="tempoReserva-label"><g:fieldValue bean="${recursoInstance}" field="tempoReserva"/> ${recursoInstance?.unidadeTempoReserva}</span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="recurso.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:formatNumber number="${recursoInstance?.valor}" type="currency" currencyCode="BRL" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.capacidade}">
				<li class="fieldcontain">
					<span id="capacidade-label" class="property-label"><g:message code="recurso.capacidade.label" default="Capacidade" /></span>
					
						<span class="property-value" aria-labelledby="capacidade-label"><g:fieldValue bean="${recursoInstance}" field="capacidade"/> pessoas</span>
					
				</li>
				</g:if>
										
				<g:if test="${recursoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="recurso.descricao.label" default="Descrição" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${recursoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.imagens}">
				<li class="fieldcontain">
					<span id="imagens-label" class="property-label"><g:message code="recurso.imagens.label" default="Imagens" /></span>
					
						<g:each in="${recursoInstance.imagens}" var="i">
							<span class="property-value" aria-labelledby="imagens-label"><g:link controller="imagem" action="show" id="${i.id}"><img class="imagem-miniatura" src="${createLink(controller:'imagem', action:'imagem', id:i.id)}" /></g:link></span>							
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ehAdministrador}">
					<li class="fieldcontain">
						<span id="indisponibilidades-label" class="property-label"><g:message code="recurso.indisponibilidades.label" default="Indisponibilidades" /></span>
						
						<div class="property-value" aria-labelledby="indisponibilidades-label">
							<div class="add">
								<g:if test="${recursoInstance?.id}">
									<g:link class="adicionar-button" controller="indisponibilidade" action="create" params="['recurso.id': recursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade')])}</g:link>
								</g:if>
								<g:else>
									<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'indisponibilidade.label', default: 'Indisponibilidade')])}</div>				
								</g:else>	
							</div>
						</div>
					</li>
				</g:if>
				
				<li class="fieldcontain">
					<span id="reservas-label" class="property-label"><g:message code="recurso.reserva.label" default="Reservas" /></span>
					
					<div class="property-value" aria-labelledby="reservas-label">
						<div class="add">
							<g:if test="${recursoInstance?.id}">
								<g:link class="adicionar-button" controller="reserva" action="create" params="['recurso.id': recursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reserva.label', default: 'Reserva')])}</g:link>	
							</g:if>
							<g:else>
								<div class="adicionar-button disabled">${message(code: 'default.add.label', args: [message(code: 'reserva.label', default: 'Reserva')])}</div>				
							</g:else>	
						</div>
					</div>

				</li>
			
				<g:if test="${recursoInstance?.tipoReserva}">
				<li class="fieldcontain">
					<span id="tipoReserva-label" class="property-label"><g:message code="recurso.tipoReserva.label" default="Tipo da reserva" /></span>
					
						<g:each in="${recursoInstance.tipoReserva.sort { it.nome }}" var="t">
							<div class="fieldcontain-list">
								<span class="property-value" aria-labelledby="tipoReserva-label">
<%--									<g:link controller="tipoReserva" action="show" id="${t.id}">--%>
										<span class="marker">► </span>${t?.encodeAsHTML()}
<%--									</g:link>--%>
								</span>
							</div>	
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${recursoInstance?.cor}">
				<li class="fieldcontain">
					<span id="cor-label" class="property-label"><g:message code="recurso.cor.label" default="Cor" /></span>
					
						<span class="property-value" aria-labelledby="cor-label">
							<div class="cor${recursoInstance?.cor.id}">&nbsp;</div>
						</span>
					
				</li>
				</g:if>
			
			</ol>
			
			<div id='calendar'></div>
			<g:if test="${ehAdministrador}">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${recursoInstance?.id}" />
						<g:link class="edit" action="edit" id="${recursoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>	
		</div>
	</body>
</html>
