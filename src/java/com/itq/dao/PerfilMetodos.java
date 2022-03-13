/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.IPerfil;
import com.itq.model.Perfil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Familia
 */
public class PerfilMetodos implements IPerfil {

    private Connection conn;

    public PerfilMetodos() {
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
    public List<Perfil> buscarPerfil() {
        List<Perfil> listaPerfiles = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil";
        Statement stPerfil = null;
        Perfil objPerfil = null;
 
        try {
            stPerfil = conn.createStatement();
            ResultSet rsPerfil = stPerfil.executeQuery(sql);

            while (rsPerfil.next()) {
                int idP = rsPerfil.getInt("idperfil"); //NOMBRE CAMPO DE LA TABLA
                String tipo = rsPerfil.getString("tipo");
                String desc = rsPerfil.getString("descripcion");

                objPerfil = new Perfil(idP, tipo, desc);
                listaPerfiles.add(objPerfil);
            }
            stPerfil.close();
        } catch (SQLException ex) {
            Logger.getLogger(PerfilMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return listaPerfiles;
    }

    @Override
    public Perfil buscarPorId(int idPerfil) {
        String sql = " SELECT * FROM perfil WHERE idperfil = ?";
        Perfil perf = null;
        PreparedStatement psPerfil = null;

        try {
            psPerfil = conn.prepareStatement(sql);
            psPerfil.setInt(1, idPerfil);
            ResultSet rsPerfil = psPerfil.executeQuery();
            //diferencia entre executeQuery y executeUpdate
            while (rsPerfil.next()) {
                String tipo = rsPerfil.getString("tipo");
                String desc = rsPerfil.getString("descripcion");

                perf = new Perfil( idPerfil,tipo, desc);

            }
            rsPerfil.close();
        } catch (SQLException ex) {
            Logger.getLogger(PerfilMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return perf;
    }

    @Override
    public boolean insertarPerfil(Perfil perf) {
        boolean bandera = true;

        String sql = " INSERT INTO perfil (tipo, descripcion) VALUES( ?, ?)";

        PreparedStatement psPerfil = null;

        try {
            psPerfil = conn.prepareStatement(sql);

            //asigno valores
            psPerfil.setString(1, perf.getTipo());
            psPerfil.setString(2, perf.getDescripcion());

            psPerfil.executeUpdate();
            psPerfil.close();

        } catch (SQLException ex) {
            Logger.getLogger(PerfilMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean actualizarPerfil(Perfil perfil) {
        boolean bandera = true;
        //Los PK no se actualizan
        String sql = " UPDATE perfil SET tipo = ?, descripcion = ? WHERE idperfil = ? ";

        PreparedStatement psPerfil = null;
        try {
            psPerfil = conn.prepareStatement(sql);
            psPerfil.setString(1, perfil.getTipo());
            psPerfil.setString(2, perfil.getDescripcion()); 
            psPerfil.setInt(3, perfil.getIdPerfil());

            psPerfil.executeUpdate();
            psPerfil.close();
        } catch (SQLException ex) {
            Logger.getLogger(PerfilMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean eliminarPerfil(int idPerfil) {
        boolean bandera = true;

        String sql = " DELETE FROM perfil WHERE idperfil = ?";
        PreparedStatement psPerfil = null;
        try {
            psPerfil = conn.prepareStatement(sql);
            psPerfil.setInt(1, idPerfil);

            psPerfil.executeUpdate();
            psPerfil.close();

        } catch (SQLException ex) {
            Logger.getLogger(PerfilMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

}
