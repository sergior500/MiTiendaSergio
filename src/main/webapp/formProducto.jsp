<%@page import="com.jacaranda.java.UserUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(session.getAttribute("usuario") !=  null){%>
	<h1>Añadir Pelicula</h1>
            
            <form action="create.jsp" method="post">
				<h4>Title</h4>
				<input type="text" name="title" maxlength="30" required>
				<h4>Description</h4>
				<input type="text" name="description" required>
                <h4>Price</h4>
                <input type="number" step="any" name="price" required>
                <h4>Category</h4>
                <select>
                	<%
                		
                	%>
                </select>
				<br>
				<br>
				<button type="submit" name="Sing Up">Create Pelicula</button>
			</form>
			 <form action="ServletPeliculas" method="post">
				<button>Back</button>
			</form>
	<%}else{
			UserUtils.errorHtml();
		}%>
	
</body>
</html>