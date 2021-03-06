<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Reservas"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="siteLogo" role="banner"><a href="${createLink(uri: '/')}"><img class="siteImg" src="${resource(dir: 'images', file: 'calendar_icon.png')}" alt="Reservas"/></a><div id="loginHeader"><g:loginControl /></div></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo">
			<div class="conteudo">
				<div class="contato_div">
					<header><h5>Contato</h5></header>
					<p class="info">We are always ready to help you. There are many ways to contact us. You may drop us a line, give us a call or send an email, choose what suits you most. </p>
					<p class="contato">
						Telefone: +55 (48) 9934-9570 <br>
						E-mail: <a href="mailto:lpdemilis@gmail.com">lpdemilis@gmail.com</a>
					</p> 
				</div>
			</div>	
		</div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
