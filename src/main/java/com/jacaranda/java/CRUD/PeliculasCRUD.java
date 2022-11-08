package com.jacaranda.java.CRUD;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import com.jacaranda.java.Peliculas;


public class PeliculasCRUD {

	public static List<Peliculas> loadList(){

		List<Peliculas> listPeliculas= new ArrayList<>();
		Query query=BBDDConnection.BDSession().createQuery("SELECT p FROM peliculas p");
		listPeliculas = query.getResultList();
		return listPeliculas;
		
	}
}
