/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.servicio;

import com.itq.dao.PerfilMetodos;
import com.itq.model.Perfil;
import java.util.List;

/**
 *
 * @author Familia
 */
public class PerfilServicio {
    
    public List<Perfil> buscarPerfil() {
        return new PerfilMetodos().buscarPerfil();
    }
    
    public Perfil buscarPorId(int idPerfil) {
        return new PerfilMetodos().buscarPorId(idPerfil);
    }
  
    public boolean insertarPerfil(Perfil perf) {
        return new PerfilMetodos().insertarPerfil(perf);
    }  
    
    public boolean actualizarPerfil(Perfil perf) {
         return new PerfilMetodos().actualizarPerfil(perf);
    }
   
    public boolean eliminarPerfil(int idPerfil) {
         return new PerfilMetodos().eliminarPerfil(idPerfil);
    }
}
