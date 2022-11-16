package com.jacaranda.java;

import org.apache.commons.codec.digest.DigestUtils;

import com.jacaranda.java.CRUD.UserCRUD;

public class UserUtils {

	public static String encript (String password){
		
		String pass = DigestUtils.md5Hex(password);
		return pass;
	}
	
	public static boolean sessionValid (String password, String username) {
		String passwordMD5 = encript(password);
		boolean test = false;
		
			if(UserCRUD.getUser(username) != null && UserCRUD.getUser(username).getNombreUsuario().equals(username)  && UserCRUD.getUser(username).getContrasena().equals(passwordMD5)) {
				test = true;
			}

		
		return test;
	}
	public static String errorHtml(String cadena, String codigo) {
		//POR HACER ("cambiar metodo para que reciba el error que quieras mostrar")
		String error= "<!DOCTYPE html>\n"
   				+ "<html>\n"
   				+ "<head>\n"
   				+ "<meta charset=\"ISO-8859-1\">\n"
   				+ "<title>Error</title>\n"
   				+ " <link rel=\"stylesheet\" href=\"CSS/Error.css\">\n"
   				+ "</head>\n"
   				+ "<body>\n"
   				+ "	<div id=\"div1\" align=\"center\">\n"
   				+ "<h1>"+cadena+"</h1>"
   				+ "<h2> Con codigo de error " + codigo + "</h2>"
   				+ "	<a href=\"Index.jsp\"><img src=\"IMAGES/error.jsp\"></a>\n"
   				+ "	</div>\n"
   				+ "</body>\n"
   				+ "</html>";
		return  error;
	}
}
