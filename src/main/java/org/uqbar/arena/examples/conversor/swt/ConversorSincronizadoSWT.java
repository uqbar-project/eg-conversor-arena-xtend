package org.uqbar.arena.examples.conversor.swt;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.VerifyEvent;
import org.eclipse.swt.events.VerifyListener;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

/**
 * Conversor entre celsius y fahrenheit:
 *  - en ambas direcciones
 *  - sin botón, es decir, automáticamente al escribir
 * 
 * @author jfernandes (basado en algún ejemplo de internet, emprolijando un poco)
 */
public class ConversorSincronizadoSWT implements VerifyListener, ModifyListener {
	// Constants used for conversions
	private static final double FIVE_NINTHS = 5.0 / 9.0;
	private static final double NINE_FIFTHS = 9.0 / 5.0;

	// Widgets used in the window
	private Text fahrenheit;
	private Text celsius;
	private Label feedbackLabel;

	/**
	 * Runs the application
	 */
	public void run() {
		Display display = new Display();
		Shell shell = new Shell(display);
		shell.setText("Temperatures");
		this.createContents(shell);
		shell.pack();
		shell.open();
		while(!shell.isDisposed()) {
			if(!display.readAndDispatch()) {
				display.sleep();
			}
		}
		display.dispose();
	}

	/**
	 * Create the main window's contents
	 * @param shell the main window
	 */
	private void createContents(Shell shell) {
		shell.setLayout(new GridLayout(3, true));

		// fahrenheit
		new Label(shell, SWT.LEFT).setText("Fahrenheit:");
		this.fahrenheit = new Text(shell, SWT.BORDER);
		GridData data = new GridData(GridData.FILL_HORIZONTAL);
		data.horizontalSpan = 2;
		this.fahrenheit.setLayoutData(data);

		this.fahrenheit.addVerifyListener(this);
		this.fahrenheit.addModifyListener(this);

		// celsius
		new Label(shell, SWT.LEFT).setText("Celsius:");
		this.celsius = new Text(shell, SWT.BORDER);
		data = new GridData(GridData.FILL_HORIZONTAL);
		data.horizontalSpan = 2;
		this.celsius.setLayoutData(data);
		this.celsius.addVerifyListener(this);
		this.celsius.addModifyListener(this);
		
		// feedback
		this.feedbackLabel = new Label(shell, SWT.LEFT | SWT.BORDER);
		data = new GridData(GridData.FILL_HORIZONTAL);
		data.horizontalSpan = 3;
		this.feedbackLabel.setLayoutData(data);
	}

	/**
	 * Called when the user types into a text box, but before the text box gets what the user typed
	 */
	@Override
	public void verifyText(VerifyEvent event) {
		event.doit = false;

		// Get the character typed
		char typedCharacter = event.character;
		String text = ((Text) event.widget).getText();

		// Allow '-' if first character
		if(typedCharacter == '-' && text.length() == 0) {
			event.doit = true;
		}

		// Allow 0-9
		if(Character.isDigit(typedCharacter)) {
			event.doit = true;
		}

		// Allow backspace
		if(typedCharacter == '\b') {
			event.doit = true;
		}
	}

	/**
	 * Called when the user modifies the text in a text box
	 */
	@Override
	public synchronized void modifyText(ModifyEvent event) {
		// Remove all the listeners (avoid infinite loops)
		this.celsius.removeVerifyListener(this);
		this.celsius.removeModifyListener(this);
		this.fahrenheit.removeVerifyListener(this);
		this.fahrenheit.removeModifyListener(this);

		Text modifiedText = (Text) event.widget;

		try {
			// 
			int newValue = Integer.parseInt(modifiedText.getText());

			if(modifiedText == this.fahrenheit) {
				// fahrenheit -> celsius
				this.celsius.setText(String.valueOf((int) (FIVE_NINTHS * (newValue - 32))));
			}
			else {
				// celsius -> fahrenheit 
				this.fahrenheit.setText(String.valueOf((int) (NINE_FIFTHS * newValue + 32)));
			}
		}
		catch(NumberFormatException e) {
			this.feedbackLabel.setText("Error en la conversión: " + e.getMessage());
		}

		// Add the listeners back
		this.celsius.addVerifyListener(this);
		this.celsius.addModifyListener(this);
		this.fahrenheit.addVerifyListener(this);
		this.fahrenheit.addModifyListener(this);
	}

	/**
	 * The application entry point
	 * 
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {
		new ConversorSincronizadoSWT().run();
	}
}