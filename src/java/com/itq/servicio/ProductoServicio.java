/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.servicio;

import com.itq.dao.ProductoMetodos;
import com.itq.model.Producto;
import java.util.List;

/**
 *
 * @author Familia
 */
public class ProductoServicio {
    
    public List<Producto> bucarProducto() {
        return new ProductoMetodos().bucarProducto();
    }
    
    public Producto buscarPorId(String codProducto) {
        return new ProductoMetodos().buscarPorId(codProducto);
    }
  
    public boolean insertarProducto(Producto prod) {
        return new ProductoMetodos().insertarProducto(prod);
    }  
    
    public boolean actualizarProducto(Producto prod) {
         return new ProductoMetodos().actualizarProducto(prod);
    }
   
    public boolean eliminarProducto(String codProducto) {
         return new ProductoMetodos().eliminarProducto(codProducto);
    }
}
