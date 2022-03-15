/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.model;

import java.io.FileInputStream;
import java.util.List;

/**
 *
 * @author Familia
 */
public class Producto {
    
    private String codProducto;
    private String nombres;
    private String foto;
    private String descripcion;
    private Double precio;
    private int stock;
    private String ruta;
    private List<Producto> produ;

    public Producto() {
    }

    public Producto(String codProducto, String nombres, String foto, String descripcion, Double precio, int stock, String ruta) {
        this.codProducto = codProducto;
        this.nombres = nombres;
        this.foto = foto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.ruta = ruta;
    }

    public String getCodProducto() {
        return codProducto;
    }

    public void setCodProducto(String codProducto) {
        this.codProducto = codProducto;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public List<Producto> getProdu() {
        return produ;
    }

    public void setProdu(List<Producto> produ) {
        this.produ = produ;
    }

    @Override
    public String toString() {
        return "Producto{" + "codProducto=" + codProducto + ", nombres=" + nombres + ", foto=" + foto + ", descripcion=" + descripcion + ", precio=" + precio + ", stock=" + stock + ", ruta=" + ruta + ", produ=" + produ + '}';
    }
    
    

}