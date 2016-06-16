<%@ page import="br.com.reservas.TipoPlano" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
		<div id="main-content">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div id="usuario-div">
				<h2>Para você</h2>
				<p>Reserve online seus eventos de forma fácil e rápida. Escolha datas disponíveis. Veja fotos e descrições dos recursos. Tudo isso <strong>grátis</strong> para os usuários.</p>
				
				<p>
					<g:link controller="condominio" action="list">
						<div class="acesso1">
							<h1>Entre agora e começe a preparar seu evento</h1>
						</div>
					</g:link>						
				</p>
				
			</div>
			
			<div id="condominio-div">
				<h2>Para seu condomínio</h2>
				<p>Gerencie de forma fácil e organizada as reservas dos recursos do seu condomínio. Permita que os recursos sejam reservados de forma online. Defina regras para as reservas. Gerencie os horários de disponibilidade. Disponibilize fotos e descriçoes dos recursos. Obtenha relatórios das reservas. Tudo isso através de planos mensais, de acordo com a sua necessidade.  </p>
				
				<p>
					<g:link controller="condominio" action="list">
						<div class="acesso2">
							<h1>Entre gerencie os recursos do seu condomínio</h1>
						</div>
					</g:link>						
				</p>
				
				<br>
				
				<g:render template="/tipoPlano/list" model="['tipoPlanoInstanceList':TipoPlano.list()]"/>

			</div>
		</div>
		
		
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to Grails</h1>
			<p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
