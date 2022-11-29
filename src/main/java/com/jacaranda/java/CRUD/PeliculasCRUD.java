package com.jacaranda.java.CRUD;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;


import com.jacaranda.java.Categoria;
import com.jacaranda.java.Peliculas;


public class PeliculasCRUD {

	public static List<Peliculas> loadList(){

		List<Peliculas> listPeliculas= new ArrayList<>();
		Query query=BBDDConnection.BDSession().createQuery("SELECT p FROM peliculas p");
		listPeliculas = query.getResultList();
		return listPeliculas;
		
	}
	public static Peliculas getMovie (Integer id) {
		
		Session session = BBDDConnection.BDSession();
		Peliculas movie = session.get(Peliculas.class, id);

		return movie;
	}
	
	public static void saveMovie(String titulo, String description, double price, Categoria categoria, int stock) {
		Session session = BBDDConnection.BDSession();
		Peliculas movie = new Peliculas(titulo, description, price, categoria,stock);
	
		try {
			session.getTransaction().begin();
			session.save(movie);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		}
	
	}
	
	public static void updateMovieStock(int id, Integer stock) {
		Session session = BBDDConnection.BDSession();
		Peliculas p = (Peliculas) session.get(Peliculas.class, id);
		System.out.println(p.getStock()-stock);
		p.setStock(p.getStock()-stock);
		System.out.println(p.getStock()-stock);
		try {
			session.getTransaction().begin();
			session.save(p);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		}
	}
	
	public static boolean existMovie(String title) {
		boolean res = false;
		
		Session session = BBDDConnection.BDSession();
		List<Peliculas> listPeliculas= new ArrayList<>();
		Query query=BBDDConnection.BDSession().createQuery("SELECT titulo FROM peliculas where titulo like '"+title+"'");
		listPeliculas = query.getResultList();
		if(listPeliculas.size()==0) {
			res=true;
		}
		return res;
	}
	
}
