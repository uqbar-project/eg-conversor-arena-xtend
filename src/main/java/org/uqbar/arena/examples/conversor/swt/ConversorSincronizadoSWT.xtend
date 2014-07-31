package org.uqbar.arena.examples.conversor.swt

import org.eclipse.swt.SWT
import org.eclipse.swt.events.ModifyEvent
import org.eclipse.swt.events.ModifyListener
import org.eclipse.swt.events.VerifyEvent
import org.eclipse.swt.events.VerifyListener
import org.eclipse.swt.layout.GridData
import org.eclipse.swt.layout.GridLayout
import org.eclipse.swt.widgets.Display
import org.eclipse.swt.widgets.Label
import org.eclipse.swt.widgets.Shell
import org.eclipse.swt.widgets.Text
import java.util.concurrent.locks.ReentrantLock

/**
 * Conversor entre celsius y fahrenheit:
 *  - en ambas direcciones
 *  - sin botón, es decir, automáticamente al escribir
 * 
 * @author jfernandes (basado en algún ejemplo de internet, emprolijando un poco)
 */
public class ConversorSincronizadoSWT implements VerifyListener, ModifyListener {
	// Constants used for conversions
	val FIVE_NINTHS = 5.0 / 9.0
	val NINE_FIFTHS = 9.0 / 5.0

	// Widgets used in the window
	Text fahrenheit
	Text celsius
	Label feedbackLabel
	val eventsLock = new ReentrantLock

	/**
	 * Runs the application
	 */
	def run() {
		val display = new Display
		val shell = new Shell(display)
		shell.text = "Temperatures"
		createContents(shell)
		shell.pack
		shell.open
		
		while(!shell.disposed) {
			if(!display.readAndDispatch) {
				display.sleep
			}
		}
		display.dispose
	}

	/**
	 * Create the main window's contents
	 * @param shell the main window
	 */
	def createContents(Shell shell) {
		shell.layout = new GridLayout(3, true)

		// fahrenheit
		new Label(shell, SWT::LEFT).text = "Fahrenheit:"
		fahrenheit = new Text(shell, SWT::BORDER)
		var data = new GridData(GridData::FILL_HORIZONTAL)
		data.horizontalSpan = 2
		fahrenheit.layoutData = data

		fahrenheit.addVerifyListener(this)
		fahrenheit.addModifyListener(this)

		// celsius
		new Label(shell, SWT::LEFT).text = "Celsius:"
		celsius = new Text(shell, SWT::BORDER)
		data = new GridData(GridData::FILL_HORIZONTAL)
		data.horizontalSpan = 2
		this.celsius.layoutData = data
		this.celsius.addVerifyListener(this)
		this.celsius.addModifyListener(this)
		
		// feedback
		feedbackLabel = new Label(shell, SWT::LEFT.bitwiseOr(SWT::BORDER))
		data = new GridData(GridData::FILL_HORIZONTAL)
		data.horizontalSpan = 3
		this.feedbackLabel.layoutData = data
	}

	/**
	 * Called when the user types into a text box, but before the text box gets what the user typed
	 */
	override def verifyText(VerifyEvent event) {
		event.doit = false

		// Get the character typed
		val typedCharacter = event.character
		val text = (event.widget as Text).text

		// Allow '-' if first character
		if(typedCharacter == '-' && text.length == 0) {
			event.doit = true
		}

		// Allow 0-9
		if(Character::isDigit(typedCharacter)) {
			event.doit = true
		}

		// Allow backspace
		if(typedCharacter == '\b') {
			event.doit = true
		}
	}

	/**
	 * Called when the user modifies the text in a text box
	 */
	override def void modifyText(ModifyEvent event) {
		eventsLock.lock
		
		// Remove all the listeners (avoid infinite loops)
		celsius.removeVerifyListener(this)
		celsius.removeModifyListener(this)
		fahrenheit.removeVerifyListener(this)
		fahrenheit.removeModifyListener(this)

		val modifiedText = event.widget as Text

		try {
			val newValue = Integer::parseInt(modifiedText.text)

			if(modifiedText == fahrenheit) {
				// fahrenheit -> celsius
				celsius.text = String::valueOf(FIVE_NINTHS * (newValue - 32) as int)
			}
			else {
				// celsius -> fahrenheit 
				fahrenheit.text = String::valueOf(NINE_FIFTHS * newValue + 32 as int)
			}
		}
		catch(NumberFormatException e) {
			feedbackLabel.text = "Error en la conversión: ".concat(e.message)
		}

		// Add the listeners back
		celsius.addVerifyListener(this)
		celsius.addModifyListener(this)
		fahrenheit.addVerifyListener(this)
		fahrenheit.addModifyListener(this)
		
		eventsLock.unlock
	}

	/**
	 * The application entry point
	 * 
	 * @param args the command line arguments
	 */
	static def main(String[] args) {
		new ConversorSincronizadoSWT().run
	}
}