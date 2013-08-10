package org.uqbar.arena.examples.conversor.swt

import org.eclipse.jface.window.ApplicationWindow

import org.eclipse.swt.SWT
import org.eclipse.swt.layout.GridData
import org.eclipse.swt.layout.GridLayout
import org.eclipse.swt.widgets.Button
import org.eclipse.swt.widgets.Composite
import org.eclipse.swt.widgets.Control
import org.eclipse.swt.widgets.Label
import org.eclipse.swt.widgets.Text

import com.uqbar.commons.StringUtils

/**
 * Conversor de temperatura en swt "crudo".
 * 
 * @author jfernandes
 */
class ConversorTemperaturaSWT extends ApplicationWindow {
	Label fahrenheitLabel
	Text fahrenheitTextBox
	Label celsiusLabel
	Label celsiusValueLabel

	new() {
		super(null)
		addStatusLine
	}

	override def Control createContents(Composite parent) {
		shell.text = "Temperature Converter"

		val panel = new Composite(parent, SWT::NULL)
		panel.layout = new GridLayout(4, true)

		fahrenheitLabel = new Label(panel, SWT::NULL)
		fahrenheitLabel.text = "Fahrenheit: "

		fahrenheitTextBox = new Text(panel, SWT::SINGLE.bitwiseOr(SWT::BORDER))

		celsiusLabel = new Label(panel, SWT::NULL)
		celsiusLabel.text = "Celsius: "

		celsiusValueLabel = new Label(panel, SWT::SINGLE.bitwiseOr(SWT::BORDER))
		celsiusValueLabel.layoutData = new GridData(GridData::FILL_BOTH)

		val button = new Button(panel, SWT::PUSH)
		button.text = "Convert"
		button.addListener(SWT::Selection,
			[ event |
				val selected = fahrenheitTextBox.text
				if (StringUtils::isBlank(selected)) {
					celsiusValueLabel.text = ""
					status = "Enter the value."
				} else {
					val fahrenheits = Double::parseDouble(selected)
					val celsius = (fahrenheits - 32) / 1.8
					celsiusValueLabel.text = Double::toString(celsius)
					status = "Temperature Convert Successfully from F to C."
				}
			])
			
		return panel
	}

	def static void main(String[] args) {
		val converter = new ConversorTemperaturaSWT()
		converter.blockOnOpen = true
		converter.open()
	}
}
