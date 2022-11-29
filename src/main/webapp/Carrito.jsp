<%@page import="com.jacaranda.java.Peliculas"%>
<%@page import="com.jacaranda.java.CRUD.Carrito"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
<link rel="stylesheet" type="text/css" href="CSS/Form.css">
</head>
<body>
	<div class="encabezado">
		<div class="rojo"></div>
			<div class="rosa">
				<p><b id ="title">Peliculas Romero</b>
				<img src="IMAGES/peliculas.png"  width=2% id="headerImage"></p>
			</div>
	</div>
		<div id="container" align="center">
			<div id="formDiv">
				<h1>Carrito</h1>
				<hr>
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
			          <p><b>Precio:</b><%=Math.round(p.getPrecio()*c1.getPelisMap().get(p)*100.0)/100.0%></p>
				          <input type="number" value="<%=c1.getPelisMap().get(p)%>" name="<%=p.getTitulo()%>">
			        </div>
			      </div>
			      <hr>
	      <% 
	       	}%>
		 	<p><button type="submit">Comprar</button>
	     	<a href="EmptyShoppingCart"> Vaciar Carrito</a></p>
		 </form>
		 <form action="ServletPeliculas" method="post"><button type="submit">Volver a peliculas</button></form>
		<%}
		 %>
			</div>
		</div>
	
</body>
</html>