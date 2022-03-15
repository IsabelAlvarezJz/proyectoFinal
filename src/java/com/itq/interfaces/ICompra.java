/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.interfaces;

import com.itq.model.Compras;
import java.util.List;

/**
 *
 * @author Familia
 */
public interface ICompra {
    
    public List<Compras> buscarCompra();
    public Compras buscarPorId(int idCompra);
    public boolean insertarCompra(Compras comp);
    public boolean actualizarCompra(Compras comp);
    public boolean eliminarCompra(int idCompra);
}
