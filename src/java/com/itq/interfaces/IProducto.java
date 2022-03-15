/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.interfaces;

import com.itq.model.Producto;
import java.util.List;

/**
 *
 * @author Familia
 */
public interface IProducto {
    
    public List<Producto> bucarProducto();

    public Producto buscarPorId(String codProducto);

    public boolean insertarProducto(Producto prod);

    public boolean actualizarProducto(Producto prod);

    public boolean eliminarProducto(String codProducto);
}
