package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.ICliente;
import com.itq.model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClienteMetodos implements ICliente {

    private Connection conn;

    public ClienteMetodos() {
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

    @Override
    public List<Cliente> bucarCliente() {
        List<Cliente> listaClientes = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        Statement stCliente = null;
        Cliente objCliente = null;

        try {
            stCliente = conn.createStatement();
            ResultSet rsCliente = stCliente.executeQuery(sql);

            while (rsCliente.next()) {
                String ced = rsCliente.getString("cedula"); //NOMBRE CAMPO DE LA TABLA
                String nombresC = rsCliente.getString("nombres");
                String direccionC = rsCliente.getString("direccion");
                String email = rsCliente.getString("email");
                String pass = rsCliente.getString("password");
                int nomP = rsCliente.getInt("perfil_tipo");

                objCliente = new Cliente(ced, nombresC, direccionC, email, pass, nomP);
                listaClientes.add(objCliente);
            }
            stCliente.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return listaClientes;
    }

    @Override
    public Cliente buscarPorId(String cedula) {
        String sql = " SELECT * FROM cliente WHERE cedula = ? ";
        Cliente clientes = null;
        PreparedStatement psCliente = null;

        try {
            psCliente = conn.prepareStatement(sql);
            psCliente.setString(1, cedula);
            ResultSet rsCliente = psCliente.executeQuery();
            //diferencia entre executeQuery y executeUpdate
            while (rsCliente.next()) {
                String nomC = rsCliente.getString("nombres");
                String dirC = rsCliente.getString("direccion");
                String email = rsCliente.getString("email");
                String pass = rsCliente.getString("password");
                int per = rsCliente.getInt("perfil_tipo");                

                clientes = new Cliente(cedula, nomC, dirC, email, pass, per);

            }
            rsCliente.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return clientes;
    }

    @Override
    public boolean insertarCliente(Cliente client) {
        boolean bandera = true;

        String sql = " INSERT INTO cliente(cedula, nombres, direccion, email, password, perfil_tipo) VALUES( ?, ?, ?, ?, ?, ? )";

        PreparedStatement psCliente = null;

        try {
            psCliente = conn.prepareStatement(sql);

            //asigno valores
            psCliente.setString(1, client.getCedula());
            psCliente.setString(2, client.getNombres());
            psCliente.setString(3, client.getDireccion());
            psCliente.setString(4, client.getEmail());
            psCliente.setString(5, client.getPassword());
            psCliente.setInt(6, client.getPerfil_tipo());

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

    @Override
    public boolean actualizarCliente(Cliente client) {
        boolean bandera = true;

        String sql = " UPDATE cliente SET nombres = ?, direccion = ?, email = ?, password = ?, perfil_tipo = ? WHERE cedula = ?";

        PreparedStatement psCliente = null;

        try {
            psCliente = conn.prepareStatement(sql);

            //asigno valores
            psCliente.setString(1, client.getNombres());
            psCliente.setString(2, client.getDireccion());
            psCliente.setString(3, client.getEmail());
            psCliente.setString(4, client.getPassword());
            psCliente.setInt(5, client.getPerfil_tipo());
            psCliente.setString(6, client.getCedula());

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

    @Override
    public boolean eliminarCliente(String cedula) {
        boolean bandera = true;

        String sql = " DELETE FROM cliente WHERE cedula = ?";
        PreparedStatement psCliente = null;
        try {
            psCliente = conn.prepareStatement(sql);
            psCliente.setString(1, cedula);

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
