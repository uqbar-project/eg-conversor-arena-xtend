package org.uqbar.arena.examples.conversor;

import java.awt.Color;

import org.uqbar.arena.actions.MessageSend;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.MainWindow;

/**
 * Ejemplo de Conversor de medidas con el framework arena.
 * Es una ventana que tiene como modelo una instancia de la clase {@link Conversor}.
 * 
 * Muestra:
 * <ul>
 * 	<li>un textbox donde se ingresa el valor de entrada</li>
 *  <li>un botón para ejecutar la conversión.</li>
 *  <li>un label donde se muestra el resultado de la conversión.</li>
 * </ul>
 *  
 * IMPORTANTE: Correr esta clase con el siguiente argument
 * 		-Djava.system.class.loader=org.uqbar.arena.aop.ArenaClassLoader
 * 
 * @author npasserini
 */
public class ConversorWindow extends MainWindow<Conversor> {

	public ConversorWindow() {
		super(new Conversor());
	}

	@Override
	public void createContents(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout());

		new Label(mainPanel).setText("Ingrese la longitud en millas");
		TextBox millas = new TextBox(mainPanel);
		millas.bindValueToProperty("millas");

		Button convertir = new Button(mainPanel);
		convertir.setCaption("Convertir a kilómetros");
		convertir.onClick(new MessageSend(this.getModelObject(), "convertir"));

		Label kilometros = new Label(mainPanel);
		kilometros.setBackground(Color.ORANGE);
		kilometros.bindValueToProperty("kilometros");
		
		new Label(mainPanel).setText(" kilómetros");
	}

	public static void main(String[] args) {
		new ConversorWindow().startApplication();
	}
}
