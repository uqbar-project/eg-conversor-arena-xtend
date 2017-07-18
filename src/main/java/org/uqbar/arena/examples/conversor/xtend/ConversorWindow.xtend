package org.uqbar.arena.examples.conversor.xtend

import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.conversor.Conversor

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

/**
 * Ejemplo de conversor millas a kilometros en xtend
 */
class ConversorWindow extends MainWindow<Conversor> {
	new() {
		super(new Conversor)
	}

	override createContents(Panel mainPanel) {
		this.title = "Conversor de millas a kilómetros (XTend)"
		// no es necesario, el layout default es el vertical
		mainPanel.layout = new VerticalLayout
		
		new ErrorsPanel(mainPanel, "Listo para convertir")	

		new Label(mainPanel).text = "Ingrese la longitud en millas"

		new NumericField(mainPanel) => [
			value <=> "millas"
		]
		// otra opción
		//new NumericField(mainPanel).bindValueToProperty("millas")
		
		new Button(mainPanel) => [
			caption = "Convertir a kilómetros"
			onClick [ | this.modelObject.convertir ]
		]

		/** esto...
		new Label(mainPanel)
			.setBackground(Color.ORANGE)
			.bindValueToProperty("kilometros")
			* 
		también se puede escribir como sigue...
		 */
		new Label(mainPanel) => [
			background = Color.ORANGE
			value <=> "kilometros"
		]
		/**
		 * esta segunda opción es visualmente útil
		 * ya que
		 *  =           implica que tengo una asignación fija (no hay binding)
		 * con flechas  implica que hay binding y es bidireccional entre modelo y vista
		 */
		
		new Label(mainPanel).text = " kilómetros"
	}

	def static main(String[] args) {
		new ConversorWindow().startApplication
	}

}
