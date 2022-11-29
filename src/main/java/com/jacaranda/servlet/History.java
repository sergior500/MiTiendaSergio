package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.java.Peliculas;
import com.jacaranda.java.USUARIO_PELICULAS;
import com.jacaranda.java.UserUtils;
import com.jacaranda.java.CRUD.Carrito;
import com.jacaranda.java.CRUD.PeliculasCRUD;
import com.jacaranda.java.CRUD.USUARIO_PELICULAS_CRUD;
import com.jacaranda.java.CRUD.UserCRUD;

/**
 * Servlet implementation class History
 */
@WebServlet("/History")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public History() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
     	PrintWriter out = response.getWriter();
     	
		    	String usuario = (String) session.getAttribute("usuario");
		    	String password = (String) session.getAttribute("password");
			   	
			   	if(usuario == null || password == null) {
			   		out.println(UserUtils.errorHtml("Login incorrecto","404"));
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
		    					+"<div id=\"container\" align=\"center\">"
		    					+ "<table id=\"Info\">"
		    					+ "<thead>"
		    					+ "<th>Pelicula</th>"
		    					+ "<th>Cantidad</th>"
		    					+ "<th>Precio</th>"
		    					+ "<th>Fecha</th>"
		    					+ "</thead>"
		    					+ "<tbody>");
		    			
		    			
		    			List<USUARIO_PELICULAS> historialList = USUARIO_PELICULAS_CRUD.loadList(UserCRUD.getUser(usuario).getNombreUsuario());
		    			
		    			
		    			
		    			for(USUARIO_PELICULAS compra : historialList){
		    				
		    				out.println("<tr>"
		    						+ "<td>"+compra.getIdPelicula().getTitulo()+"</td>"
	    							+ "<td>"+compra.getCantidad()+"</td>"
	    							+ "<td>"+compra.getPrecio()+"</td>"
	    							+ "<td>"+DateTimeFormatter.ISO_LOCAL_DATE.format(compra.getFecha())+" "+DateTimeFormatter.ISO_LOCAL_TIME.format(compra.getFecha())+"</td>");
		    				}
		    			out.println("</tbody>"
	    							+ "<form action=\"ServletPeliculas\" method=\"post\">\r\n"
	    							+ "				<button>Back</button>\r\n"
	    							+ "			</form>"
			    					+ "<script src=\"https://code.jquery.com/jquery-3.4.1.js\"\r\n"
			    					+ "        integrity=\"sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=\" crossorigin=\"anonymous\">\r\n"
			    					+ "        </script>\r\n"
			    					+ "    <!-- DATATABLES -->\r\n"
			    					+ "    <script src=\"https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js\">\r\n"
			    					+ "    </script>\r\n");
		    	
		    			
		    	}else {
		    		out.println(UserUtils.errorHtml("No encontramos lo que buscas","404"));
		    	}


	}
}
