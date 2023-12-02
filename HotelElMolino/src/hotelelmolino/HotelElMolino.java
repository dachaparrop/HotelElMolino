/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package hotelelmolino;
import java.sql.*;


/**
 *
 * @author David
 */
public class HotelElMolino {

    private static Connection conexion;
    private static String bd = "hotel";
    private static String user = "root";
    private static String password = "Admin";
    private static String host = "localhost";
    private static String server = "jdbc:mysql://" + host + "/" + bd;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//conectar 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(server, user, password);
            System.out.println("ConexiÃ3n a base de datos " + server + " ... OK");
        } catch (ClassNotFoundException ex) {
            System.out.println("Error cargando el Driver MySQL JDBC ... FAIL");
        } catch (SQLException ex) {
            System.out.println("Imposible realizar conexion con " + server + " ... FAIL");
        }
//realizar consulta 
        try {
// Preparamos la consulta 
            Statement s = conexion.createStatement();
            ResultSet rs = s.executeQuery("select * from obra");
// Recorremos el resultado, mientras haya registros para leer, y escribimos el resultado en pantalla.
            while (rs.next()) {
                System.out.println(
                        "ob_id: " + rs.getInt(1)
                        + "\tob_nombre: " + rs.getString(2)
                        + "\t\tob_tipo: " + rs.getString(3)
                        + "\t\tob_costo: " + rs.getFloat(4)
                        + "\t\tob_ex_id: " + rs.getInt(5)
                );
            }
        } catch (SQLException ex) {
            System.out.println("Imposible realizar consulta ... FAIL");
        }
//realizar insert 
        try {
            // Preparamos la creacion del registro en la tabla obra
            PreparedStatement insertar = conexion.prepareStatement("INSERT INTO obra (ob_id, ob_nombre, ob_tipo, ob_costo, ob_ex_id) VALUES(?,?,?,?,?)");
            insertar.setInt(1, 406);
            insertar.setString(2, "Le Tata ");
            insertar.setString(3, "escultura");
            insertar.setFloat(4, 350);
            insertar.setInt(5, 1003);
            
            int retorno = insertar.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Imposible realizar insercion ... FAIL");
        }
//realizar update 
        try {
            // Preparamos la actualización del registro con id = 406 
            PreparedStatement actualizar = conexion.prepareStatement("UPDATE obra SET ob_nombre=?, ob_tipo=? WHERE ob_id = 406");
            actualizar.setString(1, "Noche Estrellada");
            actualizar.setString(2, "pintura");
            int retorno = actualizar.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Imposible realizar actualizacion ... FAIL");
        }

//realizar eliminate 
        try {
            // Preparamos la eliminacion del registro con id = 406
            PreparedStatement eliminar = conexion.prepareStatement("DELETE FROM obra WHERE ob_id=?");
            eliminar.setInt(1, 406);            
            int retorno = eliminar.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Imposible realizar eliminacion ... FAIL");
        }  
        
//realizar llamado a procedimiento almacenado sp_obraexpoDesc 
        try {
            // Preparamos la actualización del registro con id = 114
            PreparedStatement funcion = conexion.prepareStatement("Call sp_obraexpoDesc(?)");
            funcion.setString(1, "Da Vinci");            
            int retorno = funcion.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Imposible realizar la ejecucion ... FAIL");
        }  

//desconectar 
        try {
            conexion.close();
            System.out.println("Cerrar conexion con " + server + " ... OK");
        } catch (SQLException ex) {
            System.out.println("Imposible cerrar conexion ... FAIL");
        }       
        
    }
}
