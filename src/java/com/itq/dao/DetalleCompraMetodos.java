package com.itq.dao;

import com.itq.configuracion.Conexion;
import com.itq.interfaces.IDetalleCompra;
import com.itq.model.DetalleCompra;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
    
}
