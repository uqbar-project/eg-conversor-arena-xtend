package org.uqbar.arena.examples.conversor.swing

import java.awt.EventQueue
import java.awt.event.ActionEvent

import javax.swing.GroupLayout
import javax.swing.GroupLayout$Alignment
import javax.swing.JButton
import javax.swing.JLabel
import javax.swing.JTextField
import javax.swing.LayoutStyle$ComponentPlacement
import javax.swing.WindowConstants
import javax.swing.SwingConstants

class ConversorTemperaturaSwing extends javax.swing.JFrame {
	JLabel celsiusLabel
	JButton convertButton
	JLabel fahrenheitLabel
	JTextField celsiusTextField
	Conversor conversor = new Conversor

	new() {
		title = "Celsius Converter"
		defaultCloseOperation = WindowConstants::EXIT_ON_CLOSE

		celsiusTextField = new JTextField
		fahrenheitLabel = new JLabel

		celsiusLabel = new JLabel 
		celsiusLabel.text = "Celsius"

		convertButton = new JButton
		convertButton.text = "Convert"
		convertButton.addActionListener([ evt | convertButtonActionPerformed(evt) ])

		fahrenheitLabel.text = "Fahrenheit"
		configureLayout
		pack
	}

	def configureLayout() {
		val layout = new GroupLayout(contentPane)
		contentPane.layout = layout
		layout.horizontalGroup = layout.createParallelGroup(Alignment::LEADING).addGroup(
			layout
				.createSequentialGroup
				.addContainerGap
				.addGroup(
					layout
						.createParallelGroup(Alignment::LEADING)
						.addGroup(
							layout
								.createSequentialGroup
								.addComponent(celsiusTextField, GroupLayout::PREFERRED_SIZE,
									GroupLayout::DEFAULT_SIZE, GroupLayout::PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement::RELATED)
								.addComponent(this.celsiusLabel))
						.addGroup(
							layout
								.createSequentialGroup
								.addComponent(this.convertButton)
								.addPreferredGap(ComponentPlacement::RELATED)
								.addComponent(this.fahrenheitLabel)))
				.addContainerGap(27, Short::MAX_VALUE))

		layout.linkSize(SwingConstants::HORIZONTAL, #[ convertButton, celsiusTextField ])

		layout.setVerticalGroup(layout.createParallelGroup(Alignment::LEADING).addGroup(
			layout
				.createSequentialGroup
				.addContainerGap
				.addGroup(
					layout
						.createParallelGroup(GroupLayout$Alignment::BASELINE)
						.addComponent(this.celsiusTextField, GroupLayout::PREFERRED_SIZE,
							GroupLayout::DEFAULT_SIZE, GroupLayout::PREFERRED_SIZE)
						.addComponent(this.celsiusLabel))
				.addPreferredGap(ComponentPlacement::RELATED)
				.addGroup(
					layout
						.createParallelGroup(Alignment::BASELINE)
						.addComponent(convertButton)
						.addComponent(fahrenheitLabel))
				.addContainerGap(21, Short::MAX_VALUE)))
	}

	def convertButtonActionPerformed(ActionEvent evt) {
		val tempCelsius = Double::parseDouble(celsiusTextField.text)
		val tempFahr = conversor.convertir(tempCelsius)
		fahrenheitLabel.text = tempFahr + " Fahrenheit"
	}

	/**
	 * @param args the command line arguments
	 */
	def static void main(String[] args) {
		EventQueue::invokeLater([| new ConversorTemperaturaSwing().visible = true ])
	}

}