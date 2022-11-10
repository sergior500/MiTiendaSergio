<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=session.getAttribute("usuario")%>
	<h1>Añadir Pelicula</h1>
            
            <form action="create.jsp" method="post">
				<h4>Descripcion</h4>
				<input type="text" name="description" maxlength="30" required>
				<h4>Fecha </h4>
				<input type="date" name="date" required>
                   <h4>Hora</h4>
                   <input type="text" name="hour" maxlength="5" required>
                   <h4>Activo</h4>
                   <p>
                       Yes<input type="radio" name="YN" value="yes">
                       No<input type="radio" name="YN" value="no" checked>
                   </p>
				<br>
				<br>
				<button type="submit" name="Sing Up">Create Pelicula</button>
			</form>
			 <form action="ServletPeliculas" method="post">
				<button>Back</button>
			</form>
</body>
</html>