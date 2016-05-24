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
					//alert('Coordinates: ' + jsEvent);
					//alert('Current view: ' + view);
			        // change the day's background color just for fun
					//$(this).css('background-color', 'red');
					
					//alert($('#calendar').fullCalendar('getView').type);
											
					$( "#diaEvento" ).val(date.format("DD"));
					$( "#mesEvento" ).val(date.format("MM"));
					$( "#anoEvento" ).val(date.format("YYYY"));
					$( "#horaEvento" ).val(date.format("HH"));
					$( "#minutoEvento" ).val(date.format("mm"));
					$( "#segundoEvento" ).val(date.format("ss"));						
			    	$( "#reserva_create_form" ).submit();

			    	if ("${recursoInstance.unidadeTempoReserva.id}" == "1") { //minuto
			    		$( "#dataInicioEvento" ).val(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataInicioEvento_span" ).text(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataInicioEvento_day" ).val(date.format("DD"));
						$( "#dataInicioEvento_year" ).val(date.format("YYYY"));
						$( "#dataInicioEvento_month" ).val(date.format("MM"));
						$( "#dataInicioEvento_hour" ).val(date.format("HH"));
						$( "#dataInicioEvento_minute" ).val(date.format("mm"));
						$( "#dataInicioEvento_second" ).val(date.format("ss"));
						date.add('${recursoInstance.tempoReserva}','minutes').calendar();
			    		$( "#dataFimEvento" ).val(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataFimEvento_span" ).text(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataFimEvento_day" ).val(date.format("DD"));
						$( "#dataFimEvento_year" ).val(date.format("YYYY"));
						$( "#dataFimEvento_month" ).val(date.format("MM"));
						$( "#dataFimEvento_hour" ).val(date.format("HH"));
						$( "#dataFimEvento_minute" ).val(date.format("mm"));
						$( "#dataFimEvento_second" ).val(date.format("ss"));
			    	}

			    	if ("${recursoInstance.unidadeTempoReserva.id}" == "2") { //hora
			    		$( "#dataInicioEvento" ).val(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataInicioEvento_span" ).text(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataInicioEvento_day" ).val(date.format("DD"));
						$( "#dataInicioEvento_year" ).val(date.format("YYYY"));
						$( "#dataInicioEvento_month" ).val(date.format("MM"));
						$( "#dataInicioEvento_hour" ).val(date.format("HH"));
						$( "#dataInicioEvento_minute" ).val(date.format("mm"));
						$( "#dataInicioEvento_second" ).val(date.format("ss"));
						date.add('${recursoInstance.tempoReserva}','hours').calendar();
			    		$( "#dataFimEvento" ).val(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataFimEvento_span" ).text(date.format("DD/MM/YYYY HH:mm:ss"));
			    		$( "#dataFimEvento_day" ).val(date.format("DD"));
						$( "#dataFimEvento_year" ).val(date.format("YYYY"));
						$( "#dataFimEvento_month" ).val(date.format("MM"));
						$( "#dataFimEvento_hour" ).val(date.format("HH"));
						$( "#dataFimEvento_minute" ).val(date.format("mm"));
						$( "#dataFimEvento_second" ).val(date.format("ss"));
			    	}

			    	if ("${recursoInstance.unidadeTempoReserva.id}" == "3") { //dia
			    		$( "#dataInicioEvento" ).val(date.format("DD/MM/YYYY"));
			    		$( "#dataInicioEvento_span" ).text(date.format("DD/MM/YYYY"));
			    		$( "#dataInicioEvento_day" ).val(date.format("DD"));
						$( "#dataInicioEvento_year" ).val(date.format("YYYY"));
						$( "#dataInicioEvento_month" ).val(date.format("MM"));
						$( "#dataInicioEvento_hour" ).val(date.format("HH"));
						$( "#dataInicioEvento_minute" ).val(date.format("mm"));
						$( "#dataInicioEvento_second" ).val(date.format("ss"));
			    		date.add('${recursoInstance.tempoReserva}','days').calendar();
			    		$( "#dataFimEvento" ).val(date.format("DD/MM/YYYY"));
			    		$( "#dataFimEvento_span" ).text(date.format("DD/MM/YYYY"));
			    		$( "#dataFimEvento_day" ).val(date.format("DD"));
						$( "#dataFimEvento_year" ).val(date.format("YYYY"));
						$( "#dataFimEvento_month" ).val(date.format("MM"));
						$( "#dataFimEvento_hour" ).val(date.format("HH"));
						$( "#dataFimEvento_minute" ).val(date.format("mm"));
						$( "#dataFimEvento_second" ).val(date.format("ss"));
			    	}														
			    }

				,eventClick: function(calEvent, jsEvent, view) {
					//alert('Event: ' + calEvent.id);
		            //alert('Event: ' + calEvent.title);
		            //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
		            //alert('View: ' + view.name);
			            // change the border color just for fun
		            //$(this).css('border-color', 'red');
		            window.location = "../../reserva/show/" + calEvent.id;
		        }
			});
		  
		});
	</script>
	
	<g:if test="${actionName == "show"}">
		<g:form id="reserva_create_form" name="reserva_create_form" method="post" url="../../reserva/create">
			<g:hiddenField name="recurso.id" value="${recursoInstance?.id}"/>
			<g:hiddenField name="diaEvento" value=""/>
			<g:hiddenField name="mesEvento" value=""/>
			<g:hiddenField name="anoEvento" value=""/>
			<g:hiddenField name="horaEvento" value=""/>
			<g:hiddenField name="minutoEvento" value=""/>
			<g:hiddenField name="segundoEvento" value=""/>
		</g:form>	
	</g:if>
	
	<div id='calendar'></div>