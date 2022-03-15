package com.itq.servicio;

import com.itq.configuracion.Conexion;
import com.itq.dao.ClienteMetodos;
import com.itq.model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paul.alvarez
 */
public class LoginServicio {
    
    private Connection conn;
    
    public LoginServicio() {
        if (conn == null) {
            conn = Conexion.getConnetion();
        }
    }

    private void closeConecction() {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMetodos.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerra la conexión ... !!!");
        }
    }
    
    public Cliente autenticacion(String email, String password){
        PreparedStatement ps = null;
        ResultSet rs = null;
        Cliente clientes = null;
        String sql = "SELECT * FROM cliente WHERE email = ? and password = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                String cedula = rs.getString("cedula");
                String nombres = rs.getString("nombres");
                String direccion = rs.getString("direccion");
                String correo = rs.getString("email");
                String pass = rs.getString("password");
                int per = rs.getInt("perfil_tipo");                

                clientes = new Cliente(cedula, nombres, direccion, correo, pass, per);

            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMetodos.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al intentar iniciar sesión ... !!!");
        } finally {
            closeConecction();
        }     
        return clientes;
    }
    
    
    public boolean registrar(String cedula, String nombres, String direccion, String email, String password, int perfilTipo){
        PreparedStatement ps = null;
        
        try {
            String sql = "insert into cliente (cedula, nombres, direccion, email, password, perfil_tipo)values(?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, cedula);
            ps.setString(2, nombres);
            ps.setString(3, direccion);
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setInt(6, perfilTipo);
            
            if(ps.executeUpdate() == 1){
                return true;
            }
        } catch (SQLException e) {
            System.err.println("ERROR: " + e);
        } finally {
            try {
                if(conn != null) conn.close();
                if(ps != null) ps.close();
            } catch (SQLException e) {
                System.err.println("FINALLY ERROR: " + e);
            }
        } 
        return false;
    }
    
    public boolean actualizarClave(String cedula, String password){
        boolean bandera = true;
        String sql = " UPDATE cliente SET password = ? WHERE cedula = ?";
        PreparedStatement psCliente = null;
        try {
            psCliente = conn.prepareStatement(sql);
            psCliente.setString(1, password);
            psCliente.setString(2, cedula);

            psCliente.executeUpdate();
            psCliente.close();

        } catch (SQLException ex) {
            Logger.getLogger(ClienteMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }
}
