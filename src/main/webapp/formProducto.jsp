<%@page import="java.util.List"%>
<%@page import="com.jacaranda.java.Categoria"%>
<%@page import="com.jacaranda.java.CRUD.CategoriaCRUD"%>
<%@page import="com.jacaranda.java.UserUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/mvp.css">
</head>
<body>
	<%if(session.getAttribute("usuario") !=  null){%>
	<div align="center">
	<h1>Añadir Pelicula</h1>
            
            <form action="CreateMovie" method="post">
				<h4>Title</h4>
				<input type="text" name="title" maxlength="30" required>
				<h4>Description</h4>
				<input type="text" name="description" required>
                <h4>Price</h4>
                <input type="number" step="any" name="price" required>
                <h4>Category</h4>
                <select name="category">
                	<% 
                		List<Categoria> categorias = CategoriaCRUD.loadList();
                		for(Categoria categoria:categorias){%>
                			<option value="<%=categoria.getId()%>"><%=categoria.getNombre()%></option>
                		<%}
                	%>
                </select>
                <h4>Stock</h4>
                <input type="number" min="0" name="stock" required>
				<br>
				<br>
				<button type="submit" name="Sing Up">Create Pelicula</button>
			</form>
			 <form action="ServletPeliculas" method="post">
				<button>Back</button>
			</form>
	<%}else{%>
			<%=UserUtils.errorHtml("No se encuentra lo que buscas", "404")%>
		<%}%>
	</div>
</body>
</html>