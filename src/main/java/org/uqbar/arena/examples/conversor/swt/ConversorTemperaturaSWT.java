package org.uqbar.arena.examples.conversor.swt;

import org.eclipse.jface.window.ApplicationWindow;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Text;

import com.uqbar.commons.StringUtils;

/**
 * Conversor de temperatura en swt "crudo".
 * 
 * @author jfernandes
 */
public class ConversorTemperaturaSWT extends ApplicationWindow {
	private Label fahrenheitLabel;
	private Text fahrenheitTextBox;
	private Label celsiusLabel;
	private Label celsiusValueLabel;

	public ConversorTemperaturaSWT() {
		super(null);
		this.addStatusLine();
	}

	@Override
	public Control createContents(Composite parent) {
		this.getShell().setText("Temperature Converter");
		
		Composite panel = new Composite(parent, SWT.NULL);
		panel.setLayout(new GridLayout(4, true));

		this.fahrenheitLabel = new Label(panel, SWT.NULL);
		this.fahrenheitLabel.setText("Fahrenheit: ");
		this.fahrenheitTextBox = new Text(panel, SWT.SINGLE | SWT.BORDER);

		this.celsiusLabel = new Label(panel, SWT.NULL);
		this.celsiusLabel.setText("Celsius: ");
		this.celsiusValueLabel = new Label(panel, SWT.SINGLE | SWT.BORDER);
		this.celsiusValueLabel.setLayoutData(new GridData(GridData.FILL_BOTH));

		Button button = new Button(panel, SWT.PUSH);
		button.setText("covert");
		button.addListener(SWT.Selection, new Listener() {
			@Override
			public void handleEvent(Event event) {
				String selected = ConversorTemperaturaSWT.this.fahrenheitTextBox.getText();
				if(StringUtils.isBlank(selected)) {
					ConversorTemperaturaSWT.this.celsiusValueLabel.setText("");
					ConversorTemperaturaSWT.this.setStatus("Enter the value.");
				}
				else {
					double fahrenheits = Double.parseDouble(selected);
					double celcius = (fahrenheits - 32) / 1.8;
					ConversorTemperaturaSWT.this.celsiusValueLabel.setText(Double.toString(celcius));
					ConversorTemperaturaSWT.this.setStatus("Temperature Convert Successfully from F to C.");
				}
			}
		});
		return panel;
	}

	public static void main(String[] args) {
		ConversorTemperaturaSWT converter = new ConversorTemperaturaSWT();
		converter.setBlockOnOpen(true);
		converter.open();
	}

}