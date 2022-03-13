/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.model;

import java.util.List;

/**
 *
 * @author Familia
 */
public class Perfil {
    
    private int idPerfil;
    private String tipo;
    private String descripcion;
    private List<Perfil> perfiles; 

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public List<Perfil> getPerfiles() {
        return perfiles;
    }

    public void setPerfiles(List<Perfil> perfiles) {
        this.perfiles = perfiles;
    }

    public Perfil() {
    }

    public Perfil(int idPerfil, String tipo, String descripcion) {
        this.idPerfil = idPerfil;
        this.tipo = tipo;
        this.descripcion = descripcion;
    }

    public Perfil(String tipo, String descripcion) {
        this.tipo = tipo;
        this.descripcion = descripcion;
    }
    

    @Override
    public String toString() {
        return "Perfil{" + "idPerfil=" + idPerfil + ", tipo=" + tipo + ", descripcion=" + descripcion + ", perfiles=" + perfiles + '}';
    }
    
    
    
    
}
