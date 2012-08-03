package org.uqbar.arena.examples.conversor;

import org.uqbar.commons.utils.TransactionalAndObservable;

@TransactionalAndObservable
public class Conversor {
	private Double millas;
	private Double kilometros;

	// ********************************************************
	// ** Acciones
	// ********************************************************
	
	public void convertir() {
		this.setKilometros(this.getMillas() * 1.60934);
	}
	
	// ********************************************************
	// ** Atributos
	// ********************************************************

	public Double getMillas() {
		return this.millas;
	}

	public void setMillas(Double millas) {
		this.millas = millas;
	}

	public Double getKilometros() {
		return this.kilometros;
	}

	public void setKilometros(Double kilometros) {
		this.kilometros = kilometros;
	}

}
