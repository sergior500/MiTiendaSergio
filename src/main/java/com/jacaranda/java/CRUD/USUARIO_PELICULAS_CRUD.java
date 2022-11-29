package com.jacaranda.java.CRUD;

import java.time.LocalDateTime;

import org.hibernate.Session;

import com.jacaranda.java.Peliculas;
import com.jacaranda.java.USUARIO_PELICULAS;
import com.jacaranda.java.User;



public class USUARIO_PELICULAS_CRUD {
	
	public static void saveCarrito(Peliculas idPelicula, User user, LocalDateTime fecha, Double precio, int cantidad) {
		Session session = BBDDConnection.BDSession();
		USUARIO_PELICULAS up = new USUARIO_PELICULAS(idPelicula, user, fecha, precio, cantidad);
		try {
			session.getTransaction().begin();
			session.save(up);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		}
		
	}
}
