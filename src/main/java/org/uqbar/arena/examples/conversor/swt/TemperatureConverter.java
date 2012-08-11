package org.uqbar.arena.examples.conversor.swt;

import org.eclipse.jface.window.ApplicationWindow;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Text;

/**
 * Conversor de temperatura en swt "crudo".
 * 
 * @author jfernandes
 */
public class TemperatureConverter extends ApplicationWindow {
	private Label flabel;
	private Label clabel;
	private Text fahrenheitTextBox;
	private Text celciusTextBox;
	private Composite converterComposite;

	public TemperatureConverter() {
		super(null);
		this.addStatusLine();
	}

	@Override
	public Control createContents(Composite parent) {
		this.getShell().setText("Temperature Converter");
		this.converterComposite = new Composite(parent, SWT.NULL);
		this.converterComposite.setLayout(new GridLayout(4, false));

		this.flabel = new Label(this.converterComposite, SWT.NULL);
		this.flabel.setText("Fahrenheit: ");
		this.fahrenheitTextBox = new Text(this.converterComposite, SWT.SINGLE | SWT.BORDER);

		this.clabel = new Label(this.converterComposite, SWT.NULL);
		this.clabel.setText("Celsius: ");
		this.celciusTextBox = new Text(this.converterComposite, SWT.SINGLE | SWT.BORDER);

		Button button = new Button(this.converterComposite, SWT.PUSH);
		button.setText("covert");
		button.addListener(SWT.Selection, new Listener() {
			@Override
			public void handleEvent(Event event) {
				String selected = TemperatureConverter.this.fahrenheitTextBox.getText();
				if(selected == "") {
					TemperatureConverter.this.celciusTextBox.setText("");
					TemperatureConverter.this.setStatus("Enter the value.");
				}
				else {
					double fahrenheits = Double.parseDouble(selected);
					double celcius = (fahrenheits - 32) / 1.8;
					TemperatureConverter.this.celciusTextBox.setText(Double.toString(celcius));
					TemperatureConverter.this.setStatus("Temperature Convert Successfully from F to C.");
				}
			}
		});
		return this.converterComposite;
	}

	public static void main(String[] args) {
		TemperatureConverter converter = new TemperatureConverter();
		converter.setBlockOnOpen(true);
		converter.open();
	}

}