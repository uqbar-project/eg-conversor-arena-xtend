package org.uqbar.arena.examples.conversor.swing

import java.awt.EventQueue
import java.awt.event.ActionEvent
import java.text.DecimalFormat
import javax.swing.GroupLayout
import javax.swing.GroupLayout.Alignment
import javax.swing.JButton
import javax.swing.JFrame
import javax.swing.JLabel
import javax.swing.JTextField
import javax.swing.LayoutStyle.ComponentPlacement
import javax.swing.SwingConstants
import javax.swing.WindowConstants

/**
 * 
 */
class ConversorSwing extends JFrame {
	JLabel millasLabel
	JButton convertButton
	JLabel kmsLabel
	JTextField millasTextField
	Conversor conversor = new Conversor

	new() {
		title = "Conversor Millas->Kms (Swing)"
		defaultCloseOperation = WindowConstants.EXIT_ON_CLOSE

		millasLabel = new JLabel 
		millasLabel.text = "Millas"
		millasTextField = new JTextField

		convertButton = new JButton
		convertButton.text = "Convertir"
		convertButton.addActionListener([ e | 
			convertButtonClicked(e)
		])

		kmsLabel = new JLabel
		kmsLabel.text = "0.00 kms"
		
		configureLayout
		pack
	}

	def convertButtonClicked(ActionEvent event) {
		val millas = Double.parseDouble(millasTextField.text)
		val kms = conversor.convertir(millas)
		val kmsString = new DecimalFormat("#.##").format(kms)
		
		kmsLabel.text = kmsString + " kms"
	}

	def static void main(String[] args) {
		EventQueue.invokeLater([| new ConversorSwing().visible = true ])
	}
	
		def configureLayout() {
		val layout = new GroupLayout(contentPane)
		contentPane.layout = layout
		layout.horizontalGroup = layout.createParallelGroup(Alignment.LEADING).addGroup(
			layout
				.createSequentialGroup
				.addContainerGap
				.addGroup(
					layout
						.createParallelGroup(Alignment.LEADING)
						.addGroup(
							layout
								.createSequentialGroup
								.addComponent(millasTextField, GroupLayout.PREFERRED_SIZE,
									GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(this.millasLabel))
						.addGroup(
							layout
								.createSequentialGroup
								.addComponent(this.convertButton)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(this.kmsLabel)))
				.addContainerGap(27, Short.MAX_VALUE))

		layout.linkSize(SwingConstants.HORIZONTAL, #[ convertButton, millasTextField ])

		layout.setVerticalGroup(layout.createParallelGroup(Alignment.LEADING).addGroup(
			layout
				.createSequentialGroup
				.addContainerGap
				.addGroup(
					layout
						.createParallelGroup(GroupLayout.Alignment.BASELINE)
						.addComponent(this.millasTextField, GroupLayout.PREFERRED_SIZE,
							GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(this.millasLabel))
				.addPreferredGap(ComponentPlacement.RELATED)
				.addGroup(
					layout
						.createParallelGroup(Alignment.BASELINE)
						.addComponent(convertButton)
						.addComponent(kmsLabel))
				.addContainerGap(21, Short.MAX_VALUE)))
	}
	

}