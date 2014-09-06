package org.uqbar.arena.examples.conversor.swt

import java.text.DecimalFormat
import java.util.concurrent.locks.ReentrantLock
import org.eclipse.swt.events.ModifyEvent
import org.eclipse.swt.events.ModifyListener
import org.eclipse.swt.layout.GridData
import org.eclipse.swt.layout.GridLayout
import org.eclipse.swt.widgets.Display
import org.eclipse.swt.widgets.Label
import org.eclipse.swt.widgets.Shell
import org.eclipse.swt.widgets.Text

import static org.eclipse.swt.SWT.*

/**
 * Conversor en SWT 
 *  - en ambas direcciones
 *  - sin botón, es decir, automáticamente al escribir
 * 
 * @author jfernandes
 */
public class ConversorSincronizadoSWT implements ModifyListener {
	val MILLAS_KM = 1.60934
	val KM_MILLAS = 1 / 1.60934 

	// Widgets used in the window
	Text millas
	Text kms
	Label feedbackLabel
	val eventsLock = new ReentrantLock

	/**
	 * Create the main window's contents
	 * @param shell the main window
	 */
	def createContents(Shell shell) {
		shell.layout = new GridLayout(3, true)

		// millas
		new Label(shell, LEFT).text = "Millas:"
		millas = new Text(shell, BORDER) 
		millas.layoutData = new GridData(GridData.FILL_HORIZONTAL) => [ horizontalSpan = 2 ]
		
		millas.addModifyListener(this)

		// kms
		new Label(shell, LEFT).text = "Kms:"
		kms = new Text(shell, BORDER)
		kms.layoutData = new GridData(GridData.FILL_HORIZONTAL) => [ horizontalSpan = 2 ]
		kms.addModifyListener(this)
		
		// feedback
		feedbackLabel = new Label(shell, LEFT.bitwiseOr(BORDER))
		feedbackLabel.layoutData = new GridData(GridData.FILL_HORIZONTAL) => [ horizontalSpan = 3 ]
	}

	/**
	 * Called when the user modifies the text in a text box
	 */
	override def void modifyText(ModifyEvent event) {
		eventsLock.lock
		feedbackLabel.text = ""
		
		// Remove all the listeners (avoid infinite loops)
		kms.removeModifyListener(this)
		millas.removeModifyListener(this)

		val modifiedText = event.widget as Text

		try {
			val newValue = Double.parseDouble(modifiedText.text)

			if(modifiedText == millas) {
				// millas -> kms
				kms.text = new DecimalFormat("#.##").format(newValue * MILLAS_KM)
			}
			else {
				// kms -> millas 
				millas.text = new DecimalFormat("#.##").format(newValue * KM_MILLAS)
			}
		}
		catch(NumberFormatException e) {
			feedbackLabel.text = "Error en la conversión: ".concat(e.message)
		}

		// Add the listeners back
		kms.addModifyListener(this)
		millas.addModifyListener(this)
		
		eventsLock.unlock
	}
	
	// MAIN & RUN

	def static main(String[] args) {
		new ConversorSincronizadoSWT().run
	}
	
		/**
	 * Runs the application
	 */
	def run() {
		val display = new Display
		val shell = new Shell(display)
		shell.text = "Conversor Sincronizado (SWT)"
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
}