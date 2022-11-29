package com.jacaranda.java.CRUD;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class BBDDConnection {

		private static StandardServiceRegistry sr = new StandardServiceRegistryBuilder().configure().build();
		private static SessionFactory sf = null;
		private static Session session;
		
	public static Session BDSession() {
		
		if(sf == null) {

				sf = new MetadataSources(sr).buildMetadata().buildSessionFactory();
			
			
		}
		if(session == null || !session.isOpen()) {
			session = sf.openSession();
		}
		return session;
	}
}
