package org.uqbar.arena.examples.conversor.xtend.sincronizado

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.MainWindow

/**
 * Variante del conversor bidireccional.
 * Es decir que permite convertir millas -> km pero también de km -> a millas.
 * Para esto, no utiliza ningun boton, sino que convierte instantaneamente a medida que se
 * va ingresando el valor en uno de los dos textfields.
 */
class ConversorSincronizadoWindow extends MainWindow<ConversorSincronizado> {
	
	new() {
		super(new ConversorSincronizado)
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Conversor sincronizado (XTend)")
		mainPanel.setLayout(new VerticalLayout)
		
		new ErrorsPanel(mainPanel, "Listo para convertir")

		new Label(mainPanel).setText("Millas:")
		new TextBox(mainPanel).bindValueToProperty("millas")
		
		new Label(mainPanel).setText("Kilometros:")
		new TextBox(mainPanel).bindValueToProperty("kilometros")
	}

	def static main(String[] args) {
		new ConversorSincronizadoWindow().startApplication
	}
	
}