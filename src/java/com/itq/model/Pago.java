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
public class Pago {
    
    private int idPago;
    private double monto;
    private List<Pago> pago;

    public Pago() {
    }

    public Pago(int idPago, double monto) {
        this.idPago = idPago;
        this.monto = monto;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public List<Pago> getPago() {
        return pago;
    }

    public void setPago(List<Pago> pago) {
        this.pago = pago;
    }

    @Override
    public String toString() {
        return "Pago{" + "idPago=" + idPago + ", monto=" + monto + ", pago=" + pago + '}';
    }
    
    
    
}
