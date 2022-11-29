package com.jacaranda.java;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@IdClass(USUARIO_PELICULAS_ID.class)
public class USUARIO_PELICULAS {

    @Id
    @ManyToOne
    @JoinColumn(
            name="id_pelicula", insertable = false, updatable=false
            )
    private Peliculas idPelicula;
    @Id
    @ManyToOne
    @JoinColumn(
            name="NombreUsuario", insertable = false, updatable=false
            )
    private User nombreUsuario;
    @Id
    private LocalDateTime fecha;
    private Double precio;
    private int cantidad;
    
    public USUARIO_PELICULAS() {

	}
    
	public USUARIO_PELICULAS(Peliculas idPelicula, User user, LocalDateTime fecha, Double precio, int cantidad) {
		super();
		this.idPelicula = idPelicula;
		this.nombreUsuario = user;
		this.fecha = fecha;
		this.precio = precio;
		this.cantidad = cantidad;
	}

	public Peliculas getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(Peliculas idPelicula) {
		this.idPelicula = idPelicula;
	}

	public User getUser() {
		return nombreUsuario;
	}

	public void setUser(User user) {
		this.nombreUsuario = user;
	}

	public LocalDateTime getFecha() {
		return fecha;
	}

	public void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cantidad, fecha, idPelicula, precio, nombreUsuario);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		USUARIO_PELICULAS other = (USUARIO_PELICULAS) obj;
		return cantidad == other.cantidad && Objects.equals(fecha, other.fecha)
				&& Objects.equals(idPelicula, other.idPelicula) && Objects.equals(precio, other.precio)
				&& Objects.equals(nombreUsuario, other.nombreUsuario);
	}
    
    
}
