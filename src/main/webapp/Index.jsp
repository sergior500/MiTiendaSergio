<!DOCTYPE html>
<%session.invalidate();%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/CSS/mvp.css">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div id="div-container" align='center'>
		<div id="login">
			<h1>Log In</h1>
			

			<form action="ServletPeliculas" method="post">
			<!-- Anotación para CSS: añadir un tamaño comun a los inputs -->
					<p>Username: </p>
					<input type="text" name="username">
					<p>Password: </p>
					<input type="password" name="password">
					<br>
					<br>
					<button type="submit" name="logIn">Log in</button>
				</form>
				<h2>No tienes cuenta? Create una</h2>
					<a href="SignUp.html"><button>Sing Up</button></a>
			
		</div>
	</div>

</body>
</html>