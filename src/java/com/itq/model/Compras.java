/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itq.model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Familia
 */
public class Compras {
    
    private int idCompras;
    private int idPago;
    private String cedula;
    private Date fechaCompra;
    private double monto;
    private String estado;
    private List<Compras> compra;

    public Compras() {
    }

    public Compras(int idCompras, int idPago, String cedula, Date fechaCompra, double monto, String estado) {
        this.idCompras = idCompras;
        this.idPago = idPago;
        this.cedula = cedula;
        this.fechaCompra = fechaCompra;
        this.monto = monto;
        this.estado = estado;
    }

    public Compras(int idCompras, int idPago, String cedula, Date fechaCompra, double monto, String estado, List<Compras> compra) {
        this.idCompras = idCompras;
        this.idPago = idPago;
        this.cedula = cedula;
        this.fechaCompra = fechaCompra;
        this.monto = monto;
        this.estado = estado;
        this.compra = compra;
    }

    public int getIdCompras() {
        return idCompras;
    }

    public void setIdCompras(int idCompras) {
        this.idCompras = idCompras;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<Compras> getCompra() {
        return compra;
    }

    public void setCompra(List<Compras> compra) {
        this.compra = compra;
    }

    @Override
    public String toString() {
        return "Compras{" + "idCompras=" + idCompras + ", idPago=" + idPago + ", cedula=" + cedula + ", fechaCompra=" + fechaCompra + ", monto=" + monto + ", estado=" + estado + ", compra=" + compra + '}';
    }
    
    
}
