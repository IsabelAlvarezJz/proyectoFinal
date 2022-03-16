package com.itq.configuracion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author paul.alvarez
 */
public class Conexion {
    
    public Connection conn = null;
    private final String USER = "oscar";
    private final String CLAVE = "oscar123";
    private final String URL = "jdbc:mysql://localhost:3306/bdd_tienda?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
    private final String CLASS_DRIVER = "com.mysql.cj.jdbc.Driver";

    protected Connection getConnetion() throws SQLException {
        try {
            Class.forName(CLASS_DRIVER).newInstance();
        } catch (Exception ex) {
            throw new SQLException("Error al abrir la conexión ");
        }
        
        if (conn == null || conn.isClosed()) {
            conn = DriverManager.getConnection(URL, USER, CLAVE);
            System.out.println("Conexion exitosa");
        }
        
        return conn;
    }
    
    protected void cerrar() {

        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignored) {
            }
        }
    }
    
}
