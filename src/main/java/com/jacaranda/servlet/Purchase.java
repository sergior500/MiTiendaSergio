package com.jacaranda.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.java.Peliculas;
import com.jacaranda.java.USUARIO_PELICULAS;
import com.jacaranda.java.User;
import com.jacaranda.java.UserUtils;
import com.jacaranda.java.CRUD.Carrito;
import com.jacaranda.java.CRUD.PeliculasCRUD;
import com.jacaranda.java.CRUD.USUARIO_PELICULAS_CRUD;
import com.jacaranda.java.CRUD.UserCRUD;

/**
 * Servlet implementation class Purchase
 */
@WebServlet("/Purchase")
public class Purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Purchase() {
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
		HttpSession session = request.getSession();
		Carrito c1 = (Carrito)session.getAttribute("ShoppingCart");
		String usuario = (String) session.getAttribute("usuario");
	   	String password = (String) session.getAttribute("password");
	   	
	   	response.setContentType("text/html;charset=UTF-8");
     	PrintWriter out = response.getWriter();
	   	
	   	if(usuario == null || password == null) {
	   		out.println(UserUtils.errorHtml("Login incorrecto","404"));
	   	}
	   	
		User user = UserCRUD.getUser(usuario);
		Double precio = 0.0;
		
		
		for(Peliculas p:c1.getPelisMap().keySet()) {
			Integer cantidad = Integer.valueOf(request.getParameter(p.getTitulo()));
			c1.updateItem(p, cantidad);
			precio = p.getPrecio()*c1.getPelisMap().get(p);
			USUARIO_PELICULAS_CRUD.saveCarrito(p, user, c1.getFecha() , Math.round(precio*100.0)/100.0, c1.getPelisMap().get(p));
			if(p.getStock()>=c1.getPelisMap().get(p)) {
				PeliculasCRUD.updateMovieStock(p.getId(),c1.getPelisMap().get(p));
			}else {
				out.println(UserUtils.errorHtml("Stock insuficiente","440"));
			}
			
		}
		
		c1.removeAllItems();
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/ServletPeliculas");
		dispatcher.forward(request, response);
		
	}

}
