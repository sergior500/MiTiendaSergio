package com.jacaranda.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.java.UserUtils;
import com.jacaranda.java.CRUD.CategoriaCRUD;
import com.jacaranda.java.CRUD.PeliculasCRUD;

/**
 * Servlet implementation class CreateMovie
 */
@WebServlet("/CreateMovie")
public class CreateMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateMovie() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append(UserUtils.errorHtml("No encuentramos lo que buscas","405"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		Double number = null;
		Integer category = null;
		Integer stock = null;
		try {
			number = Double.valueOf(request.getParameter("price"));
			category = Integer.valueOf(request.getParameter("category"));
			stock = Integer.valueOf(request.getParameter("stock"));
		} catch (Exception e) {
			response.getWriter().append((UserUtils.errorHtml("Los campos no se han podido comprobar los campos","401")));
			throw e;
		};

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/ServletPeliculas"); 
		
		
		if((title != null && !title.isEmpty()) || (description != null && !description.isEmpty()) 
				|| number != null || category != null) {
			if(PeliculasCRUD.existMovie(title)) {
				PeliculasCRUD.saveMovie(title, description, number, CategoriaCRUD.getCategory(category),stock);
				
				
				
				dispatcher.forward(request, response);
			}else {
				response.getWriter().append((UserUtils.errorHtml("La pelicula ya existe","404")));
			};
		}else {
			response.getWriter().append((UserUtils.errorHtml("Los campos introducidos son nulos o vacios","401")));
		};
		
	}

}
