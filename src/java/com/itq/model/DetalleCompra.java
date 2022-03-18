package com.itq.model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author paul.alvarez
 */
public class DetalleCompra {
    private int idDetalle;
    private int idCompras;
    private String codProducto;
    private int cantidad;
    private double precioUnitario;
    private String nombres, descripcion;

    public DetalleCompra() {
    }

    public DetalleCompra(int idDetalle, int idCompras, String codProducto, int cantidad, double precioUnitario) {
        this.idDetalle = idDetalle;
        this.idCompras = idCompras;
        this.codProducto = codProducto;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
    }

    public DetalleCompra(int idDetalle, int idCompras, String codProducto, int cantidad, double precioUnitario, String nombres, String descripcion) {
        this.idDetalle = idDetalle;
        this.idCompras = idCompras;
        this.codProducto = codProducto;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.nombres = nombres;
        this.descripcion = descripcion;
    }

    
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public int getIdCompras() {
        return idCompras;
    }

    public void setIdCompras(int idCompras) {
        this.idCompras = idCompras;
    }

    public String getCodProducto() {
        return codProducto;
    }

    public void setCodProducto(String codProducto) {
        this.codProducto = codProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    @Override
    public String toString() {
        return "DetalleCompra{" + "idDetalle=" + idDetalle + ", idCompras=" + idCompras + ", codProducto=" + codProducto + ", cantidad=" + cantidad + ", precioUnitario=" + precioUnitario + ", nombres=" + nombres + ", descripcion=" + descripcion + '}';
    }

    
}
