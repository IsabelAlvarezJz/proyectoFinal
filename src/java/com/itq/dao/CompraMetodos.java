/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.ICompra;
import com.itq.model.Compras;
import java.sql.Connection;
import java.sql.Date;
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
public class CompraMetodos implements ICompra {

    private Connection conn;

    public CompraMetodos() {
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
    public List<Compras> buscarCompra() {
        List<Compras> listaCompras = new ArrayList<Compras>();
        String sql = "SELECT * FROM compras";
        Statement stm = null;
        Compras obj = null;

        try {
            stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                int idC = rs.getInt("idCompras"); //NOMBRE CAMPO DE LA TABLA
                int idP = rs.getInt("idPago");
                String ced = rs.getString("cedula");
                Date fechC = rs.getDate("fechaCompra");
                double monto = rs.getDouble("monto");
                String est = rs.getString("estado");

                obj = new Compras(idC, idP, ced, fechC, monto, est);
                listaCompras.add(obj);
            }
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return listaCompras;
    }

    @Override
    public Compras buscarPorId(int idCompra) {
        String sql = " SELECT * FROM compras WHERE idCompras = ?";
        Compras compr = null;
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idCompra);
            ResultSet rs = ps.executeQuery();
            //diferencia entre executeQuery y executeUpdate
            while (rs.next()) {
                int idP = rs.getInt("idPago");
                String ced = rs.getString("cedula");
                Date fecha = rs.getDate("fechaCompra");
                double monto = rs.getDouble("monto");
                String est = rs.getString("estado");

                compr = new Compras(idCompra, idP, ced, fecha, monto, est);

            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return compr;
    }

    @Override
    public boolean insertarCompra(Compras comp) {
        boolean bandera = true;

        String sql = " INSERT INTO compras (idPago, cedula, fechaCompra, monto, estado) VALUES( ?, ?, ?, ?, ?)";

        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);

            //asigno valores
            ps.setInt(1, comp.getIdPago());
            ps.setString(2, comp.getCedula());
            ps.setDate(3,  new java.sql.Date(comp.getFechaCompra().getTime()));
            ps.setDouble(4, comp.getMonto());
            ps.setString(5, comp.getEstado());

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean actualizarCompra(Compras comp) {
        boolean bandera = true;
        //Los PK no se actualizan
        String sql = " UPDATE compras SET idPago = ?, cedula = ?, fechaCompra = ?, monto = ?, estado = ? WHERE idCompras = ? ";

        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, comp.getIdPago());
            ps.setString(2, comp.getCedula());
            ps.setDate(3, new java.sql.Date(comp.getFechaCompra().getTime()));
            ps.setDouble(4, comp.getMonto());
            ps.setString(5, comp.getEstado());
            ps.setInt(6, comp.getIdCompras());

            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean eliminarCompra(int idCompra) {
        
        boolean bandera = true;

        String sql = " DELETE FROM compras WHERE idCompras = ?";
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idCompra);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

}
