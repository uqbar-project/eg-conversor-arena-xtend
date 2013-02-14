package org.uqbar.arena.examples.conversor.xtend

import org.uqbar.commons.utils.Observable

@Observable
class Conversor2 {
	@Property double millas
	@Property double kilometros 
	
	def convertir() {
		kilometros = millas * 1.60934;
	}
}
