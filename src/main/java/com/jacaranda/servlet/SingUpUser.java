package com.jacaranda.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.java.UserUtils;
import com.jacaranda.java.CRUD.UserCRUD;

/**
 * Servlet implementation class SingUpUser
 */
@WebServlet("/SingUpUser")
public class SingUpUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingUpUser() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		LocalDate fechaNacimiento = null;
		try {
			fechaNacimiento = LocalDate.parse(request.getParameter("fechaNacimiento"));
		}catch (Exception e) {
			response.getWriter().append((UserUtils.errorHtml("Error inesperdo","406")));
			throw e;
		}
		String genero = request.getParameter("genero");
		
		if((username != null || !username.isEmpty()) && (password != null || !password.isEmpty()) && (nombre != null || !nombre.isEmpty()) 
				&& (apellido != null || !apellido.isEmpty()) && (genero != null || !genero.isEmpty())) {
			if(UserCRUD.getUser(username)==null && password.length()>=6){
				UserCRUD.saveUser(username.trim(),UserUtils.encript(password.trim()),nombre.trim(),apellido.trim(),fechaNacimiento,genero.trim(),false);
				response.sendRedirect("Index.jsp");
			}else{
				response.getWriter().append((UserUtils.errorHtml("El usuario ya esta registrado","202")));
			}
			
		}else {
			response.getWriter().append((UserUtils.errorHtml("Los campos introducidos son nulos o vacios","401")));
		}
		
		
		
	}

}
