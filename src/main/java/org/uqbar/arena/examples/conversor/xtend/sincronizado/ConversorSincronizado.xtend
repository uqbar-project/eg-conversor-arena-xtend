package org.uqbar.arena.examples.conversor.xtend.sincronizado

import org.uqbar.commons.utils.Observable

@Observable
class ConversorSincronizado {
	@Property double millas
	@Property double kilometros
	
	def void setMillas(double millas) {
		this._millas = millas
		this._kilometros = millas * 1.60934 
	}
	
	def void setKilometros(double kilometros) {
		this._kilometros = kilometros
		this._millas = kilometros / 1.60934
	}
}