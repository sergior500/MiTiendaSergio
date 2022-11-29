package com.jacaranda.java.CRUD;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import com.jacaranda.java.Peliculas;

public class Carrito {

	private Map<Peliculas, Integer> pelisMap;
	private LocalDateTime fecha;
	
	public Carrito() {
		super();
		this.pelisMap = new HashMap<Peliculas, Integer>();
		this.fecha = LocalDateTime.now();
	}
	
	public void addItem(Peliculas peli) {
		if(peli != null) {
			if(this.pelisMap.containsKey(peli)) {
				this.pelisMap.put(peli, pelisMap.get(peli) + 1);
			}else {
				this.pelisMap.put(peli, 1);
			}
		}
	}
	
	public void removeAllItems() {
		this.pelisMap.clear();
	}
	
	public void removeItem(Peliculas peli) {
		if(peli != null) {
			if(this.pelisMap.containsKey(peli)) {
				this.pelisMap.remove(peli);
			}
		}
	}
	
	public void updateItem(Peliculas peli, Integer cantidad) {
		if(peli != null && cantidad != null) {
			this.pelisMap.put(peli, cantidad);
			
		}
	}
	
	public Map<Peliculas, Integer> getPelisMap() {
		return pelisMap;
	}

	public void setPelisMap(Map<Peliculas, Integer> pelisMap) {
		this.pelisMap = pelisMap;
	}

	public LocalDateTime getFecha() {
		return fecha;
	}

	public void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}

	@Override
	public int hashCode() {
		return Objects.hash(fecha, pelisMap);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Carrito other = (Carrito) obj;
		return Objects.equals(fecha, other.fecha) && Objects.equals(pelisMap, other.pelisMap);
	}
	
	
}
