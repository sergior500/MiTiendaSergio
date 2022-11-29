package com.jacaranda.java;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class USUARIO_PELICULAS_ID implements Serializable{
	private int idPelicula;
    private String nombreUsuario;
    private LocalDateTime fecha;
    
    
    public USUARIO_PELICULAS_ID() {

	}
	public USUARIO_PELICULAS_ID(int idPelicula, String nombreUsuario, LocalDateTime fecha) {
		super();
		this.idPelicula = idPelicula;
		this.nombreUsuario = nombreUsuario;
		this.fecha = fecha;
	}
	
	public LocalDateTime getFecha() {
		return fecha;
	}
	
	private void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}
	
	public int getIdPelicula() {
		return idPelicula;
	}
	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	@Override
	public int hashCode() {
		return Objects.hash(fecha, idPelicula, nombreUsuario);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		USUARIO_PELICULAS_ID other = (USUARIO_PELICULAS_ID) obj;
		return Objects.equals(fecha, other.fecha) && idPelicula == other.idPelicula
				&& Objects.equals(nombreUsuario, other.nombreUsuario);
	}
	

    
    
}
