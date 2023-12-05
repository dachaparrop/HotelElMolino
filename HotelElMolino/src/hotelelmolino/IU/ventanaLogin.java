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
public class ventanaLogin extends javax.swing.JFrame {
    private static Connection conexion;
    private static String bd = "hotel";
    private static String user;
    private static String rol;
    private static String password;
    private static String tabla;
    private static String host = "localhost";
    private static String server = "jdbc:mysql://" + host + "/" + bd;

    /**
     * Creates new form ventanaLogin
     */
    public ventanaLogin() {
        initComponents();
    }
    
    public void verificarRol(javax.swing.JFrame ventana){
        ventana.dispose();
        if (rol.equals("AdministradorJefe")){
            ventanaPrincipalAdministradorJefe VentanaPrincipalJefe = new ventanaPrincipalAdministradorJefe();
            VentanaPrincipalJefe.setVisible(true);
        }
        if (rol.equals("AdministradorInventarios")){
            ventanaPrincipalAdministradorInventarios VentanaPrincipalJefe = new ventanaPrincipalAdministradorInventarios();
            VentanaPrincipalJefe.setVisible(true);
        }
        if (rol.equals("AdministradorReservas")){
            ventanaPrincipalAdministradorReservas VentanaPrincipalJefe = new ventanaPrincipalAdministradorReservas();
            VentanaPrincipalJefe.setVisible(true);
        }
        if (rol.equals("AtencionAlCliente")){
            ventanaPrincipalAtencionAlCliente VentanaPrincipalJefe = new ventanaPrincipalAtencionAlCliente();
            VentanaPrincipalJefe.setVisible(true);
        }
        if (rol.equals("Cuidador")){
            ventanaPrincipalCuidador VentanaPrincipalJefe = new ventanaPrincipalCuidador();
            VentanaPrincipalJefe.setVisible(true);
        }
        if (rol.equals("Celador")){
            ventanaPrincipalCelador VentanaPrincipalJefe = new ventanaPrincipalCelador();
            VentanaPrincipalJefe.setVisible(true);
        }
        if (rol.equals("Aseo")){
            ventanaPrincipalAseo VentanaPrincipalJefe = new ventanaPrincipalAseo();
            VentanaPrincipalJefe.setVisible(true);
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
        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jPasswordField1 = new javax.swing.JPasswordField();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(36, 149, 253));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/ilustracion-vector-logotipo-plan.png"))); // NOI18N
        jLabel1.setText("jLabel1");

        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });

        jButton1.setText("Ingresar");
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

        jLabel2.setFont(new java.awt.Font("Segoe UI", 3, 48)); // NOI18N
        jLabel2.setText("HOTEL EL MOLINO");

        jPasswordField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jPasswordField1ActionPerformed(evt);
            }
        });

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/contra-removebg-preview (1).png"))); // NOI18N
        jLabel3.setText("Contraseña");

        jLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/hotelelmolino/IMAGENES/uss_uario-removebg-preview (1).png"))); // NOI18N
        jLabel4.setText("Usuario");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(0, 253, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addGap(220, 220, 220))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4)
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(jTextField1)
                        .addComponent(jPasswordField1, javax.swing.GroupLayout.PREFERRED_SIZE, 314, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel3)))
                .addGap(288, 288, 288))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(393, 393, 393)
                .addComponent(jButton1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(369, 369, 369)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(90, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addGap(18, 18, 18)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPasswordField1, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jButton1)
                .addGap(172, 172, 172))
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

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton1MouseClicked
        // TODO add your handling code here:
        user = jTextField1.getText();
        password = jPasswordField1.getText();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(server, user, password);
            System.out.println("ConexiÃ3n a base de datos " + server + " ... OK");
            //realizar consulta 
        try {
            this.dispose();
// Preparamos la consulta 
            Statement s = conexion.createStatement();
            ResultSet rs = s.executeQuery("SHOW GRANTS FOR '"+user+"'@'localhost';");
// Recorremos el resultado, mientras haya registros para leer, y escribimos el resultado en pantalla.
            rs.next();
            rs.next();
            String[] infoRol=new String[100];
            infoRol = rs.getString(1).split("`");
            rol=infoRol[1];
            if(rol.equals("Administrador_Inventarios")){
                rol = "AdministradorInventarios";
                ventanaPrincipalAdministradorInventarios VentanaPrincipal = new ventanaPrincipalAdministradorInventarios();
                VentanaPrincipal.setVisible(true); 
            } 
            if(rol.equals("Cuidador")){
                ventanaPrincipalCuidador VentanaPrincipal = new ventanaPrincipalCuidador();
                VentanaPrincipal.setVisible(true); 
            }
            if(rol.equals("Aseo")){
                ventanaPrincipalAseo VentanaPrincipal = new ventanaPrincipalAseo();
                VentanaPrincipal.setVisible(true); 
            }
            if(rol.equals("Celador")){
                ventanaPrincipalCelador VentanaPrincipal = new ventanaPrincipalCelador();
                VentanaPrincipal.setVisible(true); 
            }
            if(rol.equals("Atencion_Al_Cliente")){
                rol = "AtencionAlCliente";
                ventanaPrincipalAtencionAlCliente VentanaPrincipal = new ventanaPrincipalAtencionAlCliente();
                VentanaPrincipal.setVisible(true); 
            }
            if(rol.equals("Administrador_Jefe")){
                rol = "AdministradorJefe";
                ventanaPrincipalAdministradorJefe VentanaPrincipal = new ventanaPrincipalAdministradorJefe();
                VentanaPrincipal.setVisible(true); 
            }
            if(rol.equals("Administrador_Reservas")){
                rol = "AdministradorReservas";
                ventanaPrincipalAdministradorReservas VentanaPrincipal = new ventanaPrincipalAdministradorReservas();
                VentanaPrincipal.setVisible(true); 
            }
            System.out.println(rol);         
        } catch (SQLException ex) {
            System.out.println("Imposible realizar consulta ... FAIL");
        }                   
        } catch (ClassNotFoundException ex) {
            System.out.println("Error cargando el Driver MySQL JDBC ... FAIL");
            JOptionPane.showMessageDialog(null, "No se pudo hacer la conexión, revisa los datos ingresados.");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"Imposible realizar conexion con " + server + " ... FAIL");
        }        
    }//GEN-LAST:event_jButton1MouseClicked

    public String getUser(){
        return user;
    }
    public Connection getConexion(){
        return conexion;
    }
    public String getTabla(){
        return tabla;
    }
    public void setTabla(String tabla){
        ventanaLogin.tabla = tabla;
    }
    public String getRol(){
        return rol;
    }
    
    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jPasswordField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jPasswordField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jPasswordField1ActionPerformed

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
            java.util.logging.Logger.getLogger(ventanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ventanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ventanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ventanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ventanaLogin().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPasswordField jPasswordField1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
