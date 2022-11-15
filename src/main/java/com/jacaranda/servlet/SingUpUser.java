package com.jacaranda.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jacaranda.java.User;
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		LocalDateTime fechaNacimiento = null;
		try {
			fechaNacimiento = LocalDateTime.of(LocalDate.parse(request.getParameter("fechaNacimiento")), LocalTime.now());
		}catch (Exception e) {
			response.getWriter().append((UserUtils.errorHtml()));
		}
		String genero = request.getParameter("genero");
		if(username == null && password == null && nombre == null && apellido == null && genero == null) {
			response.getWriter().append((UserUtils.errorHtml()));
		}
		if(UserCRUD.getUser(username)==null && password.length()>=6){
			UserCRUD.saveUser(username.trim(),UserUtils.encript(password.trim()),nombre.trim(),apellido.trim(),fechaNacimiento,genero.trim(),false);
			response.sendRedirect("Index.html");
		}else{
			UserUtils.errorHtml();
		}
		
		
	}

}
