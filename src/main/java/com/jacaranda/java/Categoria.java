package com.jacaranda.java;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "categoria")
public class Categoria {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nombre;
	private String descripcion;
	@OneToMany(mappedBy="categoria")
	private List<Peliculas> peliculas;
	
	public Categoria() {
		super();
	}
	
	public Categoria(int id, String nombre, String descripcion, List<com.jacaranda.java.Peliculas> peliculas) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.peliculas = null;
	}
	
	public Categoria(String nombre, String descripcion, List<com.jacaranda.java.Peliculas> peliculas) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.peliculas = null;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<Peliculas> getPeliculas() {
		return peliculas;
	}

	public void setPeliculas(List<Peliculas> peliculas) {
		this.peliculas = peliculas;
	}

	@Override
	public int hashCode() {
		return Objects.hash(descripcion, id, nombre, peliculas);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Categoria other = (Categoria) obj;
		return Objects.equals(descripcion, other.descripcion) && id == other.id && Objects.equals(nombre, other.nombre)
				&& Objects.equals(peliculas, other.peliculas);
	}
	
	
}
