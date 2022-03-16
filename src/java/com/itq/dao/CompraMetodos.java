/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.ICompra;
import com.itq.model.Compras;
import java.util.Date;

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
public class CompraMetodos extends Conexion implements ICompra {

    @Override
    public List<Compras> buscarCompra() {
        List<Compras> listaCompras = new ArrayList<Compras>();
        String sql = "SELECT * FROM compras";
        Statement stm = null;
        Compras obj = null;

        try {
            stm = getConnetion().createStatement();
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
            cerrar();
        }
        return listaCompras;
    }

    public List<Compras> listaComprasPorId(String cedula) {
        List<Compras> listaCompras = new ArrayList<Compras>();
        String sql = " SELECT * FROM compras WHERE cedula = ?";
        Compras compr = null;
        PreparedStatement ps = null;

        try {
            ps = getConnetion().prepareStatement(sql);
            ps.setString(1, cedula);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                int idC = rs.getInt("idCompras");
                int idP = rs.getInt("idPago");
                String ced = rs.getString("cedula");
                Date fecha = rs.getDate("fechaCompra");
                double monto = rs.getDouble("monto");
                String est = rs.getString("estado");

                compr = new Compras(idC, idP, ced, fecha, monto, est);
                listaCompras.add(compr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrar();
        }
        return listaCompras;
    }
    
    @Override
    public Compras buscarPorCedulaMonto(String cedula, double monto) {
        String sql = " SELECT * FROM compras WHERE cedula = ? AND monto = ?";
        Compras compr = null;
        PreparedStatement ps = null;

        try {
            ps = getConnetion().prepareStatement(sql);
            ps.setString(1, cedula);
            ps.setDouble(2, monto);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                int idC = rs.getInt("idCompras");
                int idP = rs.getInt("idPago");
                String ced = rs.getString("cedula");
                Date fecha = rs.getDate("fechaCompra");
                double mon = rs.getDouble("monto");
                String est = rs.getString("estado");
                compr = new Compras(idC, idP, ced, fecha, monto, est);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrar();
        }
        return compr;
    }

    @Override
    public boolean insertarCompra(Compras comp) {
        boolean bandera = true;

        String sql = " INSERT INTO compras (idPago, cedula, fechaCompra, monto, estado) VALUES( ?, ?, ?, ?, ?)";

        PreparedStatement ps = null;

        try {
            ps = getConnetion().prepareStatement(sql);

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
            cerrar();
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
            ps = getConnetion().prepareStatement(sql);
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
            cerrar();
        }

        return bandera;
    }

    @Override
    public boolean eliminarCompra(int idCompra) {
        
        boolean bandera = true;

        String sql = " DELETE FROM compras WHERE idCompras = ?";
        PreparedStatement ps = null;
        try {
            ps = getConnetion().prepareStatement(sql);
            ps.setInt(1, idCompra);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(CompraMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            cerrar();
        }

        return bandera;
    }

    @Override
    public Compras buscarPorId(int idCompra) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
