package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.IDetalleCompra;
import com.itq.model.DetalleCompra;
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
 * @author paul.alvarez
 */
public class DetalleCompraMetodos extends Conexion implements IDetalleCompra{

    @Override
    public boolean insertarDetalle(DetalleCompra detalle) {
        boolean bandera = true;
        
        String sql = "INSERT INTO detalle_compras (idCompras, codProducto, cantidad, precioCompra) VALUES( ?, ?, ?, ?)";

        PreparedStatement ps = null;

        try {
            ps = getConnetion().prepareStatement(sql);

            ps.setInt(1, detalle.getIdCompras());
            ps.setString(2, detalle.getCodProducto());
            ps.setInt(3, detalle.getCantidad());
            ps.setDouble(4, detalle.getPrecioUnitario());

            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMetodos.class.getName()).log(Level.SEVERE, null, ex);
            bandera = false;
        } finally {
            cerrar();
        }

        return bandera;
    }
    
    public List<DetalleCompra> listaDetalleCompras() {
        List<DetalleCompra> listaDetalle = new ArrayList<DetalleCompra>();
        String sql = "SELECT * FROM detalle_compras";
        Statement stm = null;
        DetalleCompra obj = null;

        try {
            stm = getConnetion().createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                int idDetalle = rs.getInt("idDetalle");
                int idCompras = rs.getInt("idCompras");
                String codProd = rs.getString("codProducto");
                int cantidad = rs.getInt("cantidad");
                double monto = rs.getDouble("monto");

                obj = new DetalleCompra(idDetalle, idCompras, codProd, cantidad, monto);
                listaDetalle.add(obj);
            }
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DetalleCompra.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrar();
        }
        return listaDetalle;
    }
    
    public List<DetalleCompra> listaDetalleComprasPorId(int compras) {
        List<DetalleCompra> listaDetalleCompras = new ArrayList<DetalleCompra>();
        String sql = "SELECT dc.idDetalle, dc.idCompras, dc.codProducto, p.nombres, p.descripcion, dc.cantidad, dc.precioCompra FROM detalle_compras dc, producto p  WHERE dc.codProducto = p.codProducto AND dc.idCompras = ?";
        DetalleCompra compr = null;
        PreparedStatement ps = null;

        try {
            ps = getConnetion().prepareStatement(sql);
            ps.setInt(1, compras);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int idDetalle = rs.getInt("idDetalle");
                int idCompras = rs.getInt("idCompras");
                String codProd = rs.getString("codProducto");
                int cantidad = rs.getInt("cantidad");
                double monto = rs.getDouble("precioCompra");
                String nombres = rs.getString("nombres");
                String descripcion = rs.getString("descripcion");

                compr = new DetalleCompra(idDetalle, idCompras, codProd, cantidad, monto, nombres, descripcion);
                listaDetalleCompras.add(compr);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetalleCompra.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrar();
        }
        return listaDetalleCompras;
    }
    
}
