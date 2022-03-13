/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.interfaces;

import com.itq.model.Perfil;
import java.util.List;

/**
 *
 * @author Familia
 */
public interface IPerfil {
    
    public List<Perfil> buscarPerfil();
    public Perfil buscarPorId(int idPerfil);
    public boolean insertarPerfil(Perfil perf);
    public boolean actualizarPerfil(Perfil perf);
    public boolean eliminarPerfil(int idPerfil);
    
}
