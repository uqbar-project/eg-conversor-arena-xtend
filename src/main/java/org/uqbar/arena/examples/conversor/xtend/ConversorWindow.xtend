package org.uqbar.arena.examples.conversor.xtend

import java.awt.Color
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.conversor.Conversor

/**
 * Ejemplo de conversor millas -> kilometros en xtend
 */
class ConversorWindow extends MainWindow<Conversor> {
	new() {
		super(new Conversor)
	}

	override createContents(Panel mainPanel) {
		this.title = "Conversor de millas a kilómetros (XTend)"
		mainPanel.layout = new VerticalLayout
		
		new ErrorsPanel(mainPanel, "Listo para convertir")	

		new Label(mainPanel).text = "Ingrese la longitud en millas"

		new TextBox(mainPanel).bindValueToProperty("millas")

		new Button(mainPanel) => [
			caption = "Convertir a kilómetros"
			onClick [ | this.modelObject.convertir ]
		]

		new Label(mainPanel)
			.setBackground(Color::ORANGE)
			.bindValueToProperty("kilometros")

		new Label(mainPanel).text = " kilómetros"
	}

	def static main(String[] args) {
		new ConversorWindow().startApplication
	}

}
