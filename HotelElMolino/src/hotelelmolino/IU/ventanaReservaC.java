/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package hotelelmolino.IU;

import java.sql.*;
import java.time.LocalTime;
import javax.swing.JOptionPane;

/**
 *
 * @author angie
 */
public class ventanaReservaC extends javax.swing.JFrame {

    ventanaLogin ventanalogin = new ventanaLogin();
    private boolean mascota = false;

    /**
     * Creates new form ventanaReservaC
     */
    public ventanaReservaC() {
        initComponents();
        if (ventanalogin.getRol().equals("AtencionAlCliente")) {
            jLabel9.setText("FECHA SALIDA");
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
        jButton1 = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jButton6 = new javax.swing.JButton();
        idCliente = new javax.swing.JTextField();
        cantDias = new javax.swing.JTextField();
        fechaIn = new javax.swing.JTextField();
        idTrab = new javax.swing.JTextField();
        IdAdmin = new javax.swing.JTextField();
        metPago = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        reserva = new javax.swing.JLabel();
        numCab = new javax.swing.JTextField();
        cantHues = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jButton2 = new javax.swing.JButton();
        jCheckBox1 = new javax.swing.JCheckBox();
        jButton3 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(36, 149, 253));

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

        jLabel5.setText("CANTIDAD DIAS*");

        jLabel6.setText("FECHA INGRESO**");

        jLabel7.setText("METODO DE PAGO");

        jLabel8.setText("ID TRABAJADOR");

        jButton6.setBackground(null);
        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/regresra.png"))); // NOI18N
        jButton6.setBorder(null);
        jButton6.setBorderPainted(false);
        jButton6.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton6MouseClicked(evt);
            }
        });

        idCliente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                idClienteActionPerformed(evt);
            }
        });

        cantDias.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cantDiasActionPerformed(evt);
            }
        });

        idTrab.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                idTrabActionPerformed(evt);
            }
        });

        IdAdmin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                IdAdminActionPerformed(evt);
            }
        });

        metPago.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                metPagoActionPerformed(evt);
            }
        });

        jLabel9.setText("ID ADMIN");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 3, 48)); // NOI18N
        jLabel3.setText("HOTEL EL MOLINO");

        reserva.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/hotel.png"))); // NOI18N

        numCab.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                numCabActionPerformed(evt);
            }
        });

        cantHues.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cantHuesActionPerformed(evt);
            }
        });

        jLabel10.setText("NÚMERO CABAÑA");

        jLabel11.setText("CANTIDAD HUESPEDES**");

        jLabel12.setText("SERVICIO MASCOTA*");

        jButton2.setText("CALCULAR*");
        jButton2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton2MouseClicked(evt);
            }
        });
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jCheckBox1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jCheckBox1MouseClicked(evt);
            }
        });
        jCheckBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCheckBox1ActionPerformed(evt);
            }
        });

        jButton3.setText("DISPONIBILIDAD**");
        jButton3.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton3MouseClicked(evt);
            }
        });
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

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
                        .addComponent(jButton6)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jLabel12)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jCheckBox1)
                .addGap(270, 270, 270))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(47, 47, 47)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jButton2)
                        .addGap(80, 80, 80))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addGap(16, 16, 16)
                                    .addComponent(jButton1))
                                .addComponent(reserva)))
                        .addGap(71, 71, 71)))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(fechaIn, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7)
                    .addComponent(jLabel6)
                    .addComponent(metPago, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(idTrab, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8)
                    .addComponent(idCliente, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 35, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel11)
                    .addComponent(cantHues, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(numCab, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10)
                    .addComponent(jLabel9)
                    .addComponent(IdAdmin, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5)
                    .addComponent(cantDias, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(92, 92, 92))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(jButton6)
                .addGap(26, 26, 26)
                .addComponent(jLabel3)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(113, 113, 113)
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(reserva)
                        .addGap(18, 18, 18)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(39, 39, 39)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addGap(6, 6, 6)
                                .addComponent(idCliente, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addComponent(jLabel6)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(fechaIn, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(34, 34, 34)
                                    .addComponent(jLabel7)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(metPago, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(40, 40, 40)
                                    .addComponent(jLabel8)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(idTrab, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addComponent(jLabel5)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(cantDias, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(27, 27, 27)
                                    .addComponent(jLabel11)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(cantHues, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(34, 34, 34)
                                    .addComponent(jLabel10)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(numCab, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGap(40, 40, 40)
                                    .addComponent(jLabel9)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(IdAdmin, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE))))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel12)
                            .addComponent(jCheckBox1))))
                .addContainerGap(95, Short.MAX_VALUE))
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

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton1MouseClicked
        // TODO add your handling code here:
        mascota = jCheckBox1.isSelected();
        int idDefault;
        LocalTime horaActual = LocalTime.now();
        if (horaActual.getHour() > 18 || horaActual.getHour() < 6) {
            idDefault = 666888555;
        } else {
            idDefault = 777999444;
        }
        System.out.println(idDefault);
        System.out.println(horaActual.getHour());
        System.out.println(horaActual.getHour() > 18);
        System.out.println(horaActual.getHour() < 6);
        if (ventanalogin.getRol().equals("AtencionAlCliente")) {
            try {
                PreparedStatement funcion = ventanalogin.getConexion().prepareStatement("call pa_facturacion(?,?,?,?,?,?,?,?,?);");
                funcion.setInt(1, Integer.parseInt(idCliente.getText()));
                funcion.setInt(2, Integer.parseInt(cantDias.getText()));
                funcion.setDate(3, Date.valueOf(fechaIn.getText()));
                funcion.setString(4, metPago.getText());
                funcion.setInt(5, Integer.parseInt(cantHues.getText()));
                funcion.setInt(6, idDefault);
                funcion.setInt(7, Integer.parseInt(idTrab.getText()));
                funcion.setInt(8, Integer.parseInt(numCab.getText()));
                funcion.setBoolean(9, mascota);
                int retorno = funcion.executeUpdate();
                JOptionPane.showMessageDialog(null, "Ejecución exitosa");
                idCliente.setText(null);
                cantDias.setText(null);
                fechaIn.setText(null);
                metPago.setText(null);
                idTrab.setText(null);
                IdAdmin.setText(null);
                cantHues.setText(null);
                numCab.setText(null);
            } catch (SQLException ex) {
                System.out.println("Imposible realizar la ejecucion ... FAIL");
                System.out.println("Error de SQL: " + ex.getMessage());
                System.out.println("SQLState: " + ex.getSQLState());
                System.out.println("Código de error: " + ex.getErrorCode());
                ex.printStackTrace();
            }
        } else {
            try {
                // Preparamos la actualización del registro con id = 114
                PreparedStatement funcion = ventanalogin.getConexion().prepareStatement("call pa_facturacion(?,?,?,?,?,?,?,?,?);");
                funcion.setInt(1, Integer.parseInt(idCliente.getText()));
                funcion.setInt(2, Integer.parseInt(cantDias.getText()));
                funcion.setDate(3, Date.valueOf(fechaIn.getText()));
                funcion.setString(4, metPago.getText());
                funcion.setInt(5, Integer.parseInt(cantHues.getText()));
                funcion.setInt(6, Integer.parseInt(IdAdmin.getText()));
                funcion.setInt(7, Integer.parseInt(idTrab.getText()));
                funcion.setInt(8, Integer.parseInt(numCab.getText()));
                funcion.setBoolean(9, mascota);
                int retorno = funcion.executeUpdate();
                JOptionPane.showMessageDialog(null, "Ejecución exitosa");
                idCliente.setText(null);
                cantDias.setText(null);
                fechaIn.setText(null);
                metPago.setText(null);
                idTrab.setText(null);
                IdAdmin.setText(null);
                cantHues.setText(null);
                numCab.setText(null);
            } catch (SQLException ex) {
                System.out.println("Imposible realizar la ejecucion ... FAIL");
                ex.printStackTrace();
            }
        }
    }//GEN-LAST:event_jButton1MouseClicked

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton6MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton6MouseClicked
        // TODO add your handling code here:
        String rol = ventanalogin.getRol();
        this.dispose();
        if (rol.equals("AtencionAlCliente")) {
            ventanaPrincipalAtencionAlCliente VentanaPrincipalJefe = new ventanaPrincipalAtencionAlCliente();
            VentanaPrincipalJefe.setVisible(true);
        }
        if (rol.equals("AdministradorReservas")) {
            ventanaPrincipalAdministradorReservas VentanaPrincipalJefe = new ventanaPrincipalAdministradorReservas();
            VentanaPrincipalJefe.setVisible(true);
        }
    }//GEN-LAST:event_jButton6MouseClicked

    private void idClienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_idClienteActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_idClienteActionPerformed

    private void cantDiasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cantDiasActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cantDiasActionPerformed

    private void idTrabActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_idTrabActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_idTrabActionPerformed

    private void IdAdminActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_IdAdminActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_IdAdminActionPerformed

    private void metPagoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_metPagoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_metPagoActionPerformed

    private void numCabActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_numCabActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_numCabActionPerformed

    private void cantHuesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cantHuesActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cantHuesActionPerformed

    private void jButton2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton2MouseClicked
        // TODO add your handling code here:
        if (jCheckBox1.isSelected()) {
            mascota = true;
        } else {
            mascota = false;
        }
        try {
            int resultado = 0;
            PreparedStatement preparedStatement = ventanalogin.getConexion().prepareStatement("select fun_facturacion(?,?) as resultado");
            preparedStatement.setInt(1, Integer.parseInt(cantDias.getText()));
            preparedStatement.setBoolean(2, mascota);
            // Ejecutar la consulta
            ResultSet resultSet = preparedStatement.executeQuery();
            // Obtener el resultado de la función
            if (resultSet.next()) {
                resultado = resultSet.getInt("resultado");
            }
            JOptionPane.showMessageDialog(null, "Resultado de la función: " + resultado);
        } catch (SQLException ex) {
            System.out.println("Imposible realizar la ejecucion ... FAIL");
        }
    }//GEN-LAST:event_jButton2MouseClicked

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jCheckBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCheckBox1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jCheckBox1ActionPerformed

    private void jCheckBox1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jCheckBox1MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_jCheckBox1MouseClicked

    private void jButton3MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton3MouseClicked
        // TODO add your handling code here:
        try {
            int resultado = 0;
            CallableStatement preparedStatement = ventanalogin.getConexion().prepareCall("call pa_disponibilidad(?,?,@cantDispo);");
            preparedStatement.setInt(1, Integer.parseInt(cantHues.getText()));
            preparedStatement.setDate(2, Date.valueOf(fechaIn.getText()));

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                resultado++;
            }
            JOptionPane.showMessageDialog(null, "Resultado de la función: " + resultado);
        } catch (SQLException ex) {
            System.out.println("Imposible realizar la ejecución ... FAIL");
            System.out.println("Error de SQL: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("Código de error: " + ex.getErrorCode());
            ex.printStackTrace();
        }
    }//GEN-LAST:event_jButton3MouseClicked

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton3ActionPerformed

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
            java.util.logging.Logger.getLogger(ventanaReservaC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ventanaReservaC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ventanaReservaC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ventanaReservaC.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ventanaReservaC().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField IdAdmin;
    private javax.swing.JTextField cantDias;
    private javax.swing.JTextField cantHues;
    private javax.swing.JTextField fechaIn;
    private javax.swing.JTextField idCliente;
    private javax.swing.JTextField idTrab;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton6;
    private javax.swing.JCheckBox jCheckBox1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField metPago;
    private javax.swing.JTextField numCab;
    private javax.swing.JLabel reserva;
    // End of variables declaration//GEN-END:variables
}
