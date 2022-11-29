package com.jacaranda.java.CRUD;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import com.jacaranda.java.Categoria;
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
	
	public static List<USUARIO_PELICULAS> loadList(String user){

		List<USUARIO_PELICULAS> listPurchases= new ArrayList<>();
		Query query=BBDDConnection.BDSession().createQuery("SELECT up FROM USUARIO_PELICULAS up WHERE NombreUsuario = '"+user+"' ");
		listPurchases = query.getResultList();
		return listPurchases;
		
	}
}
