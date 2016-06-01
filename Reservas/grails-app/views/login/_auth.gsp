<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>
		
		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<g:if test='${flash.message}'>
				<div class='login_message'>${flash.message}</div>
			</g:if>
			
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username' value="usuario@email.com.br"/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password' value="123456"/>
			</p>
			
			<p>
				<label for='registre'></label>
				<g:link controller="usuario" action="create">Registre-se</g:link>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>