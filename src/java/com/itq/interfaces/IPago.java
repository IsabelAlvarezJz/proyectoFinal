/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.interfaces;

import com.itq.model.Pago;
import java.util.List;

/**
 *
 * @author Familia
 */
public interface IPago {
    
    public List<Pago> buscarPago();
    public Pago buscarPorId(int idPago);
    public boolean insertarPago(Pago pag);
    public boolean actualizarPago(Pago pag);
    public boolean eliminarPago(int idPago);
    
}
