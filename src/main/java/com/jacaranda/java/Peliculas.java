package com.jacaranda.java;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "peliculas")
public class Peliculas {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String titulo;
	private String descripcion;
	private double precio;
	@ManyToOne
	@JoinColumn(name = "id_categoria")
	private Categoria categoria;
	private int stock;
	
	public Peliculas() {
		// TODO Auto-generated constructor stub
	}

	public Peliculas(int id, String titulo, String descripcion, double precio, Categoria categoria, int stock) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.precio = precio;
		this.categoria = categoria;
		this.stock = stock;
	}
	
	public Peliculas(String titulo, String descripcion, double precio, Categoria categoria,int stock) {
		super();
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.precio = precio;
		this.categoria = categoria;
		this.stock = stock;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getStock() {
		return stock;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	@Override
	public int hashCode() {
		return Objects.hash(categoria, descripcion, id, precio, titulo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Peliculas other = (Peliculas) obj;
		return Objects.equals(categoria, other.categoria) && Objects.equals(descripcion, other.descripcion)
				&& id == other.id && Double.doubleToLongBits(precio) == Double.doubleToLongBits(other.precio)
				&& Objects.equals(titulo, other.titulo);
	}
	
	
	
}
