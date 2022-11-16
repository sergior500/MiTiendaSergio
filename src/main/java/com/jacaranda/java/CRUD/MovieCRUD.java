package com.jacaranda.java.CRUD;

	import org.hibernate.Session;

	import com.jacaranda.java.Categoria;
	import com.jacaranda.java.Peliculas;

	
	
	public class MovieCRUD {
		public static Peliculas getMovie (Integer id) {
			
			Session session = BBDDConnection.BDSession();
			Peliculas movie = session.get(Peliculas.class, id);

			return movie;
		}
		
	public static void saveMovie(String titulo, String description, double price, Categoria categoria) {
		Session session = BBDDConnection.BDSession();
		Peliculas movie = new Peliculas(titulo, description, price, categoria);

		try {
			session.getTransaction().begin();
			session.save(movie);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		}
		
	}

}
