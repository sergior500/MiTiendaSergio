package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.java.Peliculas;
import com.jacaranda.java.UserUtils;
import com.jacaranda.java.CRUD.PeliculasCRUD;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usuario = request.getParameter("username");
	   	String password = request.getParameter("password");
	            	
	   	HttpSession session = request.getSession();
	   	
	   	response.setContentType("text/html;charset=UTF-8");
     	PrintWriter out = response.getWriter();
	   	
	    if(usuario !=null && password !=null){
	    	if(UserUtils.sessionValid(password, usuario)){
	    		
	         	session.setAttribute("login", "True");
	         	session.setAttribute("usuario", usuario);
	         	session.setAttribute("password",password);
	    		
	         	
	         	try {
	    			out.println("<!DOCTYPE html>"
	    					+ "<html>"
	    					+ "<head>"
	    					+ "<meta charset=\"UTF-8\">"
	    					+ "<title>Peliculas</title>"
	    					+ "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/mvp.css\">"
	    					+ "</head>"
	    					+ "<body>"
	    					+"<div>"
	    					+ "<table>"
	    					+ "<tr>"
	    					+ "<th>Id</th>"
	    					+ "<th>title</th>"
	    					+ "<th>Description</th>"
	    					+ "<th>Price</th>"
	    					+ "<th>Category_id</th>"
	    					+ "</tr>");
	    			
	    			List<Peliculas> peliculasList = PeliculasCRUD.loadList();
	    			
	    			for(Peliculas pelicula : peliculasList){
	    				
	    				out.println("<tr>"
	    						+ "<td>"+pelicula.getId()+"</td>"
    							+ "<td>"+pelicula.getTitulo()+"</td>"
    							+ "<td>"+pelicula.getDescripcion()+"</td>"
    							+ "<td>"+pelicula.getPrecio()+"</td>"
    							+ "<td>"+pelicula.getCategoria().getNombre()+"</td>");
	    				
	    			}
	         	}catch (Exception e) {
					System.out.println("sisisisisisi");
				}
	       	} else { 
	       		out.println("<!DOCTYPE html>\n"
	       				+ "<html>\n"
	       				+ "<head>\n"
	       				+ "<meta charset=\"ISO-8859-1\">\n"
	       				+ "<title>Error</title>\n"
	       				+ " <link rel=\"stylesheet\" href=\"CSS/Error.css\">\n"
	       				+ "</head>\n"
	       				+ "<body>\n"
	       				+ "	<div id=\"div1\" align=\"center\">\n"
	       				+ "		<a href=\"Index.html\"><img src=\"CSS/IMAGES/error.png\"></a>\n"
	       				+ "	</div>\n"
	       				+ "</body>\n"
	       				+ "</html>");
	  	 	}
		 }

	}

}
