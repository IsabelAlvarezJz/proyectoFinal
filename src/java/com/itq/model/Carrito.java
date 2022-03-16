package com.itq.model;

/**
 *
 * @author paul.alvarez
 */
public class Carrito {
    int item;
    private String idProducto;
    private String nombres;
    private String descripcion;
    private double precioCompra;
    private int cantidad;
    private double subTotal;
    private String ruta;

    public Carrito() {
    }

    public Carrito(int item, String idProducto, String nombres, String descripcion, double precioCompra, int cantidad, double subTotal, String ruta) {
        this.item = item;
        this.idProducto = idProducto;
        this.nombres = nombres;
        this.descripcion = descripcion;
        this.precioCompra = precioCompra;
        this.cantidad = cantidad;
        this.subTotal = subTotal;
        this.ruta = ruta;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
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

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }
    
    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    @Override
    public String toString() {
        return "Carrito{" + "item=" + item + ", idProducto=" + idProducto + ", nombres=" + nombres + ", descripcion=" + descripcion + ", precioCompra=" + precioCompra + ", cantidad=" + cantidad + ", subTotal=" + subTotal + ", ruta=" + ruta + '}';
    }
}
