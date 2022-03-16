package com.itq.servicio;

import com.itq.dao.DetalleCompraMetodos;
import com.itq.model.DetalleCompra;

/**
 *
 * @author paul.alvarez
 */
public class DetalleCompraServicio {
    public boolean insertarDetalle(DetalleCompra detalle) {
        return new DetalleCompraMetodos().insertarDetalle(detalle);
    }
}
