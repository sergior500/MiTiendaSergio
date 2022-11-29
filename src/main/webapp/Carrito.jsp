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
	
		<div class="grid-container">
		 <% Carrito c1 = (Carrito) session.getAttribute("ShoppingCart");
		 	if(c1.getPelisMap().keySet().isEmpty()){%>
		 		<h2>The ShoppingCart is empty</h2>
		 		<form action="ServletPeliculas" method="post"><button type="submit">Ir a peliculas</button></form>
		 <%}else{%>
			<form action="Purchase" method="post">
		 	<%for(Peliculas p:c1.getPelisMap().keySet()){
		 		%>
		
			<div class="card juego">
	        <div class="container">
	          <h4><b><%=p.getTitulo()%></b></h4> 
	          <p><%=p.getDescripcion()%></p> 
		          <input type="number" value="<%=c1.getPelisMap().get(p)%>" name="<%=p.getTitulo()%>">
	        </div>
	      </div>
	      <% 
	       	}%>
		 	<p><button type="submit">Comprar</button>
	     	<a href="EmptyShoppingCart"> Vaciar Carrito</a></p>
		 </form>
		 <form action="ServletPeliculas" method="post"><button type="submit">Volver a peliculas</button></form>
		<%}
		 %>

		</div>
	
</body>
</html>