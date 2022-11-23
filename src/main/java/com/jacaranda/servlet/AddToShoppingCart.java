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
import com.jacaranda.java.CRUD.Carrito;
import com.jacaranda.java.CRUD.PeliculasCRUD;

/**
 * Servlet implementation class AddToShoppingCart
 */
@WebServlet("/AddToShoppingCart")
public class AddToShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToShoppingCart() {
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
		Integer id = Integer.valueOf(request.getParameter("id"));
		Integer cantidad = Integer.valueOf(request.getParameter("cantidad"));
		Peliculas p1 = PeliculasCRUD.getMovie(id);
		Carrito c1 = (Carrito) session.getAttribute("ShoppingCart");
		response.setContentType("text/html;charset=UTF-8");
     	PrintWriter out = response.getWriter();
     	if(c1.getPelisMap().containsKey(p1)) {
     		c1.updateItem(p1, c1.getPelisMap().get(p1)+cantidad);
     	}else {
     		c1.updateItem(p1, cantidad);
		}
		
		session.setAttribute("ShoppingCart", c1);
		System.out.println(c1.getPelisMap().get(p1));
		response.sendRedirect("Carrito.jsp");
	}

}
