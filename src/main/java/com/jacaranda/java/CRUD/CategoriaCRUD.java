package com.jacaranda.java.CRUD;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import com.jacaranda.java.Categoria;

public class CategoriaCRUD {


	public static List<Categoria> loadList(){

		List<Categoria> listPeliculas= new ArrayList<>();
		Query query=BBDDConnection.BDSession().createQuery("SELECT c FROM categoria c");
		listPeliculas = query.getResultList();
		return listPeliculas;
		
	}
	public static Categoria getCategory(int id) {
		Categoria categoria = BBDDConnection.BDSession().get(Categoria.class, id);

		return categoria;
	
	}
}
