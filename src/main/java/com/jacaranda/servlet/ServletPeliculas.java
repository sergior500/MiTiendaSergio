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
		response.getWriter().append(UserUtils.errorHtml());
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
		
		    if(usuario ==null && password ==null){
		    	usuario = (String) session.getAttribute("usuario");
			   	password = (String) session.getAttribute("password");
			   	
			   	out.println(usuario+","+password);
			   	
			   	if(usuario == null && password == null) {
			   		out.println(UserUtils.errorHtml());
			   	}
		    }  
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
		    					+ "<th>Category_id</th>");
				    			if(UserCRUD.getUser(usuario).isAdmin()) {
			    					out.println("<th class=\"transparent\">"
			    							+ "<a href=\"formProducto.jsp\">"
			    							+ "<img src=\"IMAGES/mas.png\"  width=5%></a></th>");
			    					
			    				}
		    					out.println("<th class=\"transparent\">\n"
		    							+ "<a href=\"Index.jsp\">\n"
		    							+ "<img src=\"IMAGES/logout.png\"  width=5%></a></th>"
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
		         		out.println(UserUtils.errorHtml());
					}
		       	} else { 
		       		out.println(UserUtils.errorHtml());
		  	 	}
			 }

	
}
