/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.servicio;

import com.itq.dao.CompraMetodos;
import com.itq.model.Compras;
import java.util.List;

/**
 *
 * @author Familia
 */
public class CompraServicio {
    
     public List<Compras> buscarCompra() {
        return new CompraMetodos().buscarCompra();
    }
    
    public Compras buscarPorId(int idCompra) {
        return new CompraMetodos().buscarPorId(idCompra);
    }
  
    public boolean insertarCompra(Compras comp) {
        return new CompraMetodos().insertarCompra(comp);
    }  
    
    public boolean actualizarCompra(Compras comp) {
         return new CompraMetodos().actualizarCompra(comp);
    }
   
    public boolean eliminarCompra(int idCompra) {
         return new CompraMetodos().eliminarCompra(idCompra);
    }
}
