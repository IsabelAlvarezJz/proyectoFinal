/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.servicio;

import com.itq.dao.PagoMetodos;
import com.itq.model.Pago;
import java.util.List;

/**
 *
 * @author Familia
 */
public class PagoServicio {
    
    public List<Pago> buscarPago() {
        return new PagoMetodos().buscarPago();
    }
    
    public Pago buscarPorId(int idPago) {
        return new PagoMetodos().buscarPorId(idPago);
    }
  
    public boolean insertarPago(Pago pag) {
        return new PagoMetodos().insertarPago(pag);
    }  
    
    public boolean actualizarPago(Pago pag) {
         return new PagoMetodos().actualizarPago(pag);
    }
   
    public boolean eliminarPago(int idPago) {
         return new PagoMetodos().eliminarPago(idPago);
    }
}
