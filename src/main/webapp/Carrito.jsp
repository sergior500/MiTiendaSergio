<%@page import="com.jacaranda.java.Peliculas"%>
<%@page import="com.jacaranda.java.CRUD.Carrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
</head>
<body>
	<form action="">
		<div class="grid-container">
		 <% Carrito c1 = (Carrito) session.getAttribute("ShoppingCart");
		 	
		 	for(Peliculas p:c1.getPelisMap().keySet()){
		 		%>
		
			<div class="card juego">
	        <div class="container">
	          <h4><b><%=p.getTitulo()%></b></h4> 
	          <p><%=p.getDescripcion()%></p> 
	          <input type="number" value="<%=c1.getPelisMap().get(p)%>">
	          <p></p>
	        </div>
	      </div>
	      <% 
	       	}
		 %>
		</div>
	</form>
</body>
</html>