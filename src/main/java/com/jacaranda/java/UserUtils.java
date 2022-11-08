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
}
