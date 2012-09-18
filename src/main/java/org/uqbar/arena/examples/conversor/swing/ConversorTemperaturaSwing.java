/*
 * Copyright (c) 1995, 2008, Oracle and/or its affiliates. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *   - Neither the name of Oracle or the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * CelsiusConverterGUI.java
 *
 */

package org.uqbar.arena.examples.conversor.swing;

import java.awt.Component;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.LayoutStyle;
import javax.swing.SwingConstants;
import javax.swing.WindowConstants;


/**
 * 
 * @author internet
 */
public class ConversorTemperaturaSwing extends javax.swing.JFrame {
	private JLabel celsiusLabel;
	private JButton convertButton;
	private JLabel fahrenheitLabel;
	private JTextField celsiusTextField;
	private Conversor conversor = new Conversor();

	public ConversorTemperaturaSwing() {
		this.initComponents();
	}

	private void initComponents() {
		this.setTitle("Celsius Converter");
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

		this.celsiusTextField = new JTextField();
		this.fahrenheitLabel = new JLabel();

		this.celsiusLabel = new JLabel();
		this.celsiusLabel.setText("Celsius");

		this.convertButton = new JButton();
		this.convertButton.setText("Convert");
		this.convertButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent evt) {
				ConversorTemperaturaSwing.this.convertButtonActionPerformed(evt);
			}
		});

		this.fahrenheitLabel.setText("Fahrenheit");
		this.configureLayout();
		this.pack();
	}

	protected void configureLayout() {
		GroupLayout layout = new GroupLayout(this.getContentPane());
		this.getContentPane().setLayout(layout);
		layout.setHorizontalGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING).addGroup(
			layout
				.createSequentialGroup()
				.addContainerGap()
				.addGroup(
					layout
						.createParallelGroup(GroupLayout.Alignment.LEADING)
						.addGroup(
							layout
								.createSequentialGroup()
								.addComponent(this.celsiusTextField, GroupLayout.PREFERRED_SIZE,
									javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
								.addComponent(this.celsiusLabel))
						.addGroup(
							layout
								.createSequentialGroup()
								.addComponent(this.convertButton)
								.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
								.addComponent(this.fahrenheitLabel)))
				.addContainerGap(27, Short.MAX_VALUE)));

		layout.linkSize(SwingConstants.HORIZONTAL, new Component[] { this.convertButton, this.celsiusTextField });

		layout.setVerticalGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING).addGroup(
			layout
				.createSequentialGroup()
				.addContainerGap()
				.addGroup(
					layout
						.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
						.addComponent(this.celsiusTextField, javax.swing.GroupLayout.PREFERRED_SIZE,
							javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
						.addComponent(this.celsiusLabel))
				.addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
				.addGroup(
					layout
						.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
						.addComponent(this.convertButton)
						.addComponent(this.fahrenheitLabel))
				.addContainerGap(21, Short.MAX_VALUE)));
	}

	private void convertButtonActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_convertButtonActionPerformed
		double tempCelsius = Double.parseDouble(this.celsiusTextField.getText());
		double tempFahr = this.conversor.convertir(tempCelsius);
		this.fahrenheitLabel.setText(tempFahr + " Fahrenheit");
	}

	/**
	 * @param args the command line arguments
	 */
	public static void main(String args[]) {
		EventQueue.invokeLater(new Runnable() {
			@Override
			public void run() {
				new ConversorTemperaturaSwing().setVisible(true);
			}
		});
	}

}