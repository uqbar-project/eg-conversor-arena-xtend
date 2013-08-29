package org.uqbar.arena.examples.conversor.xtend.generico

import org.uqbar.commons.utils.Observable

@Observable
class ConversorGenerico {
	@Property double input
	@Property double output
	@Property Conversion conversion
	
	def void convertir() {
		output = conversion.convertir(this.input)
	}
	
	def getConversionesPosibles() {
		#[	new MillasAKmConversion, 
			new KmAMillasConversion, 
			new OnzaAGramosConversion, 
			new GramosAOnzaConversion
		]
	}	
	
}