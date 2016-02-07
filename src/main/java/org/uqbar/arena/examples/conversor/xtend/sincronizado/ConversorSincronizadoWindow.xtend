package org.uqbar.arena.examples.conversor.xtend.sincronizado

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.MainWindow
import org.uqbar.conversor.ConversorSincronizado

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

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
		mainPanel.layout = new VerticalLayout
		
		new ErrorsPanel(mainPanel, "Listo para convertir")

		new Label(mainPanel).text = "Millas:"
		new TextBox(mainPanel).value <=> "millas"
		
		new Label(mainPanel).text = "Kilometros:"
		new TextBox(mainPanel).value <=> "kilometros"
	}

	def static main(String[] args) {
		new ConversorSincronizadoWindow().startApplication
	}
	
}