package org.uqbar.arena.examples.conversor.swt

import java.text.DecimalFormat
import org.apache.commons.lang.StringUtils
import org.eclipse.jface.window.ApplicationWindow
import org.eclipse.swt.layout.GridData
import org.eclipse.swt.layout.GridLayout
import org.eclipse.swt.widgets.Button
import org.eclipse.swt.widgets.Composite
import org.eclipse.swt.widgets.Control
import org.eclipse.swt.widgets.Label
import org.eclipse.swt.widgets.Text

import static org.eclipse.swt.SWT.*

/**
 * Conversor de temperatura en swt "crudo".
 * Primer ejemplo.
 * 
 * @author jfernandes
 */
class ConversorSWT extends ApplicationWindow {
	Text millasTextBox
	Label kmsValueLabel

	new() {
		super(null)
		addStatusLine
	}

	override Control createContents(Composite parent) {
		shell.text = "Conversor (SWT)"

		val panel = new Composite(parent, NONE)
		panel.layout = new GridLayout(4, true)

		new Label(panel, NONE) => [
			text = "Millas: "
			HSpan = 1 
		]

		millasTextBox = new Text(panel, BORDER)
		millasTextBox.HSpan = 3

		new Label(panel, NONE) => [
			text = "Kms: "
			HSpan = 1
		]

		kmsValueLabel = new Label(panel, BORDER)
		kmsValueLabel.HSpan = 3

		val button = new Button(panel, PUSH)
		button.text = "Convertir"
		button.HSpan = 4
		button.addListener(Selection, [ event |
			val selected = millasTextBox.text
			if (StringUtils.isBlank(selected)) {
				kmsValueLabel.text = ""
				status = "Ingrese millas a convertir."
			} 
			else {
				try {
					val millas = Double.parseDouble(selected)
					val kms = millas * 1.60934
						
					kmsValueLabel.text = new DecimalFormat("#.##").format(kms)
					status = "Convertido !"
				}
				catch (NumberFormatException e) {
					kmsValueLabel.text = ""
					status = '''Error: «e.message»'''
				}
			}
		])
		
		return panel
	}

	def static void main(String[] args) {
		new ConversorSWT => [
			blockOnOpen = true
			open
		]
	}
	
	
	// helper methods
	
	def setHSpan(Control widget, int colToSpan) {
		widget.layoutData = new GridData => [ 
			horizontalAlignment = FILL
			horizontalSpan = colToSpan
		]
	}
}
