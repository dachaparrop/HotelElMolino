/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package hotelelmolino.IU;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author angie
 */
public class ventanaClienteC extends javax.swing.JFrame {

    ventanaLogin ventanalogin = new ventanaLogin();

    /**
     * Creates new form ventanaClienteC
     */
    public ventanaClienteC() {
        initComponents();
        if (ventanalogin.getTabla().equals("cliente")) {
            jLabel2.setVisible(true);
            sugerenciaI.setVisible(false);
            reserva.setVisible(false);
            jLabel1.setVisible(false);
        }
        if (ventanalogin.getTabla().equals("sugerencia")) {
            jLabel2.setVisible(false);
            sugerenciaI.setVisible(true);
            reserva.setVisible(false);
            jLabel1.setVisible(false);
            jLabel4.setText("ID RESERVA");
            jLabel5.setText("FECHA");
            jLabel6.setText("COMENTARIO");
            jLabel7.setVisible(false);
            jLabel8.setVisible(false);
            jLabel9.setVisible(false);
            fourthText.setVisible(false);
            fifthText.setVisible(false);
            sixthText.setVisible(false);
        }
        if (ventanalogin.getTabla().equals("mascota")) {
            jLabel2.setVisible(false);
            sugerenciaI.setVisible(false);
            reserva.setVisible(false);
            jLabel1.setVisible(true);
            jLabel4.setText("ID DUEÑO");
            jLabel6.setText("RAZA");
            jLabel7.setText("ESPECIE");
            jLabel8.setText("GENERO");
            jLabel9.setVisible(false);
            sixthText.setVisible(false);
        }

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jButton6 = new javax.swing.JButton();
        firstText = new javax.swing.JTextField();
        secondText = new javax.swing.JTextField();
        thirdText = new javax.swing.JTextField();
        fifthText = new javax.swing.JTextField();
        sixthText = new javax.swing.JTextField();
        fourthText = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        sugerenciaI = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        reserva = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(36, 149, 253));

        jButton6.setBackground(null);
        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/regresra.png"))); // NOI18N
        jButton6.setBorder(null);
        jButton6.setBorderPainted(false);
        jButton6.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton6MouseClicked(evt);
            }
        });

        firstText.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                firstTextActionPerformed(evt);
            }
        });

        secondText.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                secondTextActionPerformed(evt);
            }
        });

        fifthText.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                fifthTextActionPerformed(evt);
            }
        });

        sixthText.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sixthTextActionPerformed(evt);
            }
        });

        fourthText.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                fourthTextActionPerformed(evt);
            }
        });

        jLabel3.setFont(new java.awt.Font("Segoe UI", 3, 48)); // NOI18N
        jLabel3.setText("HOTEL EL MOLINO");

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/macota.png"))); // NOI18N

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/cliente.png"))); // NOI18N

        sugerenciaI.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/sugerencia.png"))); // NOI18N

        jButton1.setText("CREAR");
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jLabel4.setText("ID CLIENTE");

        jLabel5.setText("NOMBRE");

        jLabel6.setText("APELLIDOS");

        jLabel7.setText("NACIONALIDAD");

        jLabel8.setText("VEHICULO");

        jLabel9.setText("TELEFONO");

        reserva.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/hotel.png"))); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(227, 227, 227)
                        .addComponent(jLabel3))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addComponent(jButton6))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(118, 118, 118)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2)
                            .addComponent(sugerenciaI))
                        .addGap(65, 65, 65)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(thirdText, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel7))
                                .addGap(73, 73, 73)
                                .addComponent(jButton1))
                            .addComponent(jLabel6)
                            .addComponent(fourthText, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(fifthText, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(sixthText, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel8)
                            .addComponent(jLabel9)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(secondText, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(firstText, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel4))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 52, Short.MAX_VALUE)
                                .addComponent(reserva)))))
                .addGap(155, 155, 155))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(jButton6)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(26, 26, 26)
                        .addComponent(jLabel3)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(37, 37, 37)
                                .addComponent(reserva)
                                .addGap(52, 52, 52)
                                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(32, 32, 32))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(sugerenciaI)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel1)))))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(108, 108, 108)
                        .addComponent(jLabel4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(firstText, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(secondText, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(thirdText, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(fourthText, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(fifthText, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel9)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(sixthText, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(62, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton6MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton6MouseClicked
        ventanalogin.verificarRol(this);
    }//GEN-LAST:event_jButton6MouseClicked

    private void fifthTextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_fifthTextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_fifthTextActionPerformed

    private void sixthTextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sixthTextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_sixthTextActionPerformed

    private void fourthTextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_fourthTextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_fourthTextActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton1MouseClicked
        // TODO add your handling code here:
        if (ventanalogin.getTabla().equals("mascota")) {
            try {
                // Preparamos la actualización del registro con id = 114
                PreparedStatement funcion = ventanalogin.getConexion().prepareStatement("Call pa_nuevaMascota(?,?,?,?,?)");
                funcion.setInt(1, Integer.parseInt(firstText.getText()));
                funcion.setString(2, secondText.getText());
                funcion.setString(3, thirdText.getText());
                funcion.setString(4, fourthText.getText());
                funcion.setString(5, fifthText.getText());
                int retorno = funcion.executeUpdate();
                JOptionPane.showMessageDialog(null, "Ejecución exitosa");
                firstText.setText(null);
                secondText.setText(null);
                thirdText.setText(null);
                fourthText.setText(null);
                fifthText.setText(null);
            } catch (SQLException ex) {
                System.out.println("Imposible realizar la ejecucion ... FAIL");
            }
        }
        if (ventanalogin.getTabla().equals("cliente")) {
            boolean vehiculo = false;
            if (fifthText.getText() != null) {
                vehiculo = true;
            }
            try {
                // Preparamos la actualización del registro con id = 114
                PreparedStatement funcion = ventanalogin.getConexion().prepareStatement("Call pa_nuevoCliente(?,?,?,?,?,?,?)");
                funcion.setInt(1, Integer.parseInt(firstText.getText()));
                funcion.setString(2, secondText.getText());
                funcion.setString(3, thirdText.getText());
                funcion.setBoolean(4, vehiculo);
                funcion.setString(5, fourthText.getText());
                funcion.setString(6, fifthText.getText());
                funcion.setInt(7, Integer.parseInt(sixthText.getText()));
                int retorno = funcion.executeUpdate();
                JOptionPane.showMessageDialog(null, "Ejecución exitosa");
                firstText.setText(null);
                secondText.setText(null);
                thirdText.setText(null);
                fourthText.setText(null);
                fifthText.setText(null);
                sixthText.setText(null);
            } catch (SQLException ex) {
                System.out.println("Imposible realizar la ejecucion ... FAIL");
            }
        }
        if (ventanalogin.getTabla().equals("sugerencia")) {
            try {
                // Preparamos la creacion del registro en la tabla obra
                PreparedStatement insertar = ventanalogin.getConexion().prepareStatement("call pa_nuevaSugerencia(?,?,?)");
                insertar.setInt(1, Integer.parseInt(firstText.getText()));
                insertar.setDate(2, Date.valueOf(secondText.getText()));
                insertar.setString(3, thirdText.getText());
                int retorno = insertar.executeUpdate();
                JOptionPane.showMessageDialog(null, "Ejecución exitosa");
                firstText.setText(null);
                secondText.setText(null);
                thirdText.setText(null);
            } catch (SQLException ex) {
                System.out.println("Imposible realizar insercion ... FAIL");
            }
        }
    }//GEN-LAST:event_jButton1MouseClicked

    private void firstTextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_firstTextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_firstTextActionPerformed

    private void secondTextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_secondTextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_secondTextActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ventanaClienteC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ventanaClienteC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ventanaClienteC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ventanaClienteC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ventanaClienteC().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField fifthText;
    private javax.swing.JTextField firstText;
    private javax.swing.JTextField fourthText;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton6;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel reserva;
    private javax.swing.JTextField secondText;
    private javax.swing.JTextField sixthText;
    private javax.swing.JLabel sugerenciaI;
    private javax.swing.JTextField thirdText;
    // End of variables declaration//GEN-END:variables
}
