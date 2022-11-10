package com.jacaranda.java.CRUD;

import java.time.LocalDate;

import org.hibernate.Session;

import com.jacaranda.java.User;
import com.jacaranda.java.UserUtils;


public class UserCRUD {

	public static User getUser (String username) {

		Session session = BBDDConnection.BDSession();
		User usuario = session.get(User.class, username);

		return usuario;
	}
	
	public static void saveUser(String username, String password, String nombre, String apellido, LocalDate fechaNacimiento, String genero, boolean admin) {
		Session session = BBDDConnection.BDSession();
		User usuario = new User(nombre, password, nombre, apellido, fechaNacimiento, genero, admin);
		session.getTransaction().begin();
		session.save(usuario);
		session.getTransaction().commit();
	}
	public static void updateUser(String username, String password, String nombre, String apellido, LocalDate fechaNacimiento, String genero, boolean admin) {
		Session session = BBDDConnection.BDSession();
		User usuario = (User) session.get(User.class, username);
		usuario.setContrasena(password);
		usuario.setNombre(nombre);
		usuario.setApellido(apellido);
		usuario.setFechaNacimiento(fechaNacimiento);
		usuario.setGenero(genero);
		usuario.setAdmin(admin);
		session.getTransaction().begin();
		session.update(usuario);
		session.getTransaction().commit();
	}
	
	public static void deleteUser(String username) {
		Session session = BBDDConnection.BDSession();
		User usuario = (User) session.get(User.class, username);
		session.getTransaction().begin();
		session.delete(usuario);
		session.getTransaction().commit();
	}
}