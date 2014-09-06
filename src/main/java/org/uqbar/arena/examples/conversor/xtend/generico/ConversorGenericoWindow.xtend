package org.uqbar.arena.examples.conversor.xtend.generico

import java.awt.Color
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.MainWindow

/**
 * Conversor generico que permite diversas operaciones de 
 * conversion.
 */
class ConversorGenericoWindow extends MainWindow<ConversorGenerico> {
	
	new() {
		super(new ConversorGenerico)
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Conversor generico (XTend)")
		mainPanel.setLayout(new VerticalLayout)
		
		new ErrorsPanel(mainPanel, "Listo para convertir")

		new Label(mainPanel).setText("De:")

		new TextBox(mainPanel).bindValueToProperty("input")
		
		new List(mainPanel) => [
			allowNull(false)
			bindItemsToProperty("conversionesPosibles").adapter = nombreAdapter
			
			bindValueToProperty("conversion")
		]

		new Button(mainPanel) => [ 
			caption = "Convertir"
			onClick [ | modelObject.convertir ]
			bindEnabled(new NotNullObservable("conversion"))
		]
		
		new Label(mainPanel).setText("A: ")	
		new Label(mainPanel)
			.setBackground(Color.ORANGE)
			.bindValueToProperty("output")
	}
	
	def nombreAdapter() {
		new PropertyAdapter(typeof(Conversion), "nombre")
	}

	def static main(String[] args) {
		new ConversorGenericoWindow().startApplication
	}
	
}