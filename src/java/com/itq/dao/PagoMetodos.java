/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.IPago;
import com.itq.model.Pago;
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
public class PagoMetodos implements IPago {

    private Connection conn;

    public PagoMetodos() {
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
    public List<Pago> buscarPago() {
        List<Pago> listaPago = new ArrayList<Pago>();
        String sql = "SELECT * FROM pago";
        Statement stm = null;
        Pago obj = null;

        try {
            stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                int idPago = rs.getInt("idPago"); //NOMBRE CAMPO DE LA TABLA
                double monto = rs.getDouble("monto");

                obj = new Pago(idPago, monto);
                listaPago.add(obj);
            }
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(PagoMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return listaPago;
    }

    @Override
    public Pago buscarPorId(int idPago) {
        String sql = " SELECT * FROM pago WHERE idPago = ?";
        Pago pag = null;
        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idPago);
            ResultSet rs = ps.executeQuery();
            //diferencia entre executeQuery y executeUpdate
            while (rs.next()) {
                double tipo = rs.getDouble("monto");

                pag = new Pago(idPago, tipo);

            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(PagoMetodos.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConecction();
        }
        return pag;
    }

    @Override
    public boolean insertarPago(Pago pag) {
        boolean bandera = true;

        String sql = " INSERT INTO pago (monto) VALUES( ? )";

        PreparedStatement ps = null;

        try {
            ps = conn.prepareStatement(sql);

            //asigno valores
            ps.setDouble(1, pag.getMonto());

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(PagoMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean actualizarPago(Pago pag) {
        boolean bandera = true;
        //Los PK no se actualizan
        String sql = " UPDATE pago SET monto = ? WHERE idPago = ? ";

        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, pag.getMonto());
            ps.setInt(2, pag.getIdPago());

            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PagoMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

    @Override
    public boolean eliminarPago(int idPago) {
        boolean bandera = true;

        String sql = " DELETE FROM pago WHERE idPago = ?";
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idPago);

            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            Logger.getLogger(PagoMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            closeConecction();
        }

        return bandera;
    }

}
