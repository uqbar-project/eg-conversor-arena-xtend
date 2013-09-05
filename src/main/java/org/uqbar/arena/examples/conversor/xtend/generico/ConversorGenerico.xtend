package org.uqbar.arena.examples.conversor.xtend.generico

import org.uqbar.commons.utils.Observable
import static extension org.uqbar.commons.model.ObservableUtils.*

@Observable
class ConversorGenerico {
	@Property double input
	@Property double output
	@Property Conversion conversion
	
	def void convertir() {
		output = conversion.convertir(this.input)
	}
	
	def setConversion(Conversion conversion) {
		this._conversion = conversion
		firePropertyChanged("puedeConvertir", puedeConvertir)
	}
	
	def isPuedeConvertir() {
		conversion != null 
	}
	
	def getConversionesPosibles() {
		#[	new MillasAKmConversion, 
			new KmAMillasConversion, 
			new OnzaAGramosConversion, 
			new GramosAOnzaConversion
		]
	}
	
}