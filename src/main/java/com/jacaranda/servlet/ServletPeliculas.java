package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.java.Peliculas;
import com.jacaranda.java.UserUtils;
import com.jacaranda.java.CRUD.Carrito;
import com.jacaranda.java.CRUD.PeliculasCRUD;
import com.jacaranda.java.CRUD.UserCRUD;

/**
 * Servlet implementation class ServletPeliculas
 */
@WebServlet("/ServletPeliculas")
public class ServletPeliculas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPeliculas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append(UserUtils.errorHtml("No encontramos lo que buscas","404"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
	
			String usuario = request.getParameter("username");
		   	String password = request.getParameter("password");
			   	
	   	
	   	response.setContentType("text/html;charset=UTF-8");
     	PrintWriter out = response.getWriter();
		
		    if(usuario == null || password == null){
		    	usuario = (String) session.getAttribute("usuario");
			   	password = (String) session.getAttribute("password");
			   	
//			   	out.println(usuario+","+password);
			   	
			   	if(usuario == null || password == null) {
			   		out.println(UserUtils.errorHtml("Login incorrecto","404"));
			   	}
		    }  
		    	if(UserUtils.sessionValid(password, usuario)){
		    		
		         	session.setAttribute("login", "True");
		         	session.setAttribute("usuario", usuario);
		         	session.setAttribute("password",password);
		         	Carrito c1;
		         	if(session.getAttribute("ShoppingCart") == null) {
		         		c1 = new Carrito();
			         	session.setAttribute("ShoppingCart", c1);
		         	}else {
		         		c1 = (Carrito) session.getAttribute("ShoppingCart");
		         	}
		         	
		    		
		         	
		         	try {
		    			out.println("<!DOCTYPE html>"
		    					+ "<html>"
		    					+ "<head>"
		    					+ "<meta charset=\"UTF-8\">"
		    					+ "<title>Peliculas</title>"
		    					+ "<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/Principal.css\">"
		    					+ "<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/locura.css\">"
		    					+ "</head>"
		    					+ "<body>"
		    					+ "<div class=\"encabezado\">\r\n"
		    					+ "		<div class=\"rojo\"></div>\r\n"
		    					+ "			<div class=\"rosa\">\r\n"
		    					+ "				<p><b id =\"title\">Peliculas Romero</b>"
		    					+ "				<a href=\"Index.jsp\"> <img src=\"IMAGES/logout.png\"  width=1.3%></a>"
		    					+ "				<img src=\"IMAGES/peliculas.png\"  width=2% id=\"headerImage\"></p>\r\n"
		    					+ "			</div>\r\n"
		    					+ "	</div>"
//		    					+ "<header><h1>Peliculas Romero</h1>  "+c1.getPelisMap().size()+"</header>"
		    					+"<div id=\"container\" align=\"center\">"
		    					+ "<form action=\"History\" method=\"post\"><button type=\"submit \">Mostrar Historial</button></form>"
		    					+ "<table id=\"Info\">"
		    					+ "<thead>"
		    					+ "<th>Id</th>"
		    					+ "<th>title</th>"
		    					+ "<th>Description</th>"
		    					+ "<th>Price</th>"
		    					+ "<th>Category_id</th>");
				    			if(UserCRUD.getUser(usuario).isAdmin()) {
			    					out.println("<th class=\"transparent\">"
			    							+ "<a href=\"formProducto.jsp\">"
			    							+ "<img src=\"IMAGES/mas.png\"  width=5%></a></th>");
			    					
			    				}else {
			    					out.println("<th>Stock</th>");
			    				}
		    					out.println("<th class=\"transparent\">\n"
		    							+ "<a href=\"Carrito.jsp\">\n"
		    							+ "<p><img src=\"IMAGES/carrito.png\"  width=5%></a>"
		    							+ c1.getPelisMap().size()+"</p></th>"
		    							+ "</thead>"
		    							+ "<tbody>");
		    			
		    			List<Peliculas> peliculasList = PeliculasCRUD.loadList();
		    			
		    			
		    			
		    			for(Peliculas pelicula : peliculasList){
		    				
		    				out.println("<tr>"
		    						+ "<td>"+pelicula.getId()+"</td>"
	    							+ "<td>"+pelicula.getTitulo()+"</td>"
	    							+ "<td>"+pelicula.getDescripcion()+"</td>"
	    							+ "<td>"+pelicula.getPrecio()+"</td>"
	    							+ "<td>"+pelicula.getCategoria().getNombre()+"</td>"
	    							+ "<td>"+pelicula.getStock()+"</td>");
		    				if(pelicula.getStock()>0) {
		    					out.println( "<td><form action=\"AddToShoppingCart\" method=\"post\"><button type=submit value="
		    								+pelicula.getId()+" name=\"id\"'>Añadir al carrito</button><input type='number' value='1' min='1' max='"
		    								+pelicula.getStock()+"' name='cantidad'></td></form>");
		    				}else {
		    					out.println( "<td><b>Sin Stock</b></td>");
		    				}
	    							
		    				
		    			}
		    			out.println("</tbody>"
		    					
		    					+ "<script src=\"https://code.jquery.com/jquery-3.4.1.js\"\r\n"
		    					+ "        integrity=\"sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=\" crossorigin=\"anonymous\">\r\n"
		    					+ "        </script>\r\n"
		    					+ "    <!-- DATATABLES -->\r\n"
		    					+ "    <script src=\"https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js\">\r\n"
		    					+ "    </script>\r\n"
		    					+ "    <script src=\"JS/principal.js\"></script>");
		         	}catch (Exception e) {
		         		response.sendRedirect("error.html");
					}
		       	} else { 
		       		out.println(UserUtils.errorHtml("Login incorrecto","404"));
		  	 	}
			 }

	
}
