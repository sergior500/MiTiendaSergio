package com.jacaranda.java.CRUD;

import org.hibernate.Session;

import com.jacaranda.java.User;


public class UserCRUD {

	public static User getUser (String username) {
		Session session = BBDDConnection.BDConect();
		User usuario = session.get(User.class, username);
				
		return usuario;
	}

}