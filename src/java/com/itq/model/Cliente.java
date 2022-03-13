package com.itq.model;


import java.util.List;

public class Cliente {

    //Atributos
    private String cedula;
    private String nombres;
    private String direccion;
    private String email;
    private String password;
    private int perfil_tipo;
    private List<Cliente> clientes;

    //Métodos habituales get y se    

    public Cliente() {
    }

    public Cliente(String cedula, String nombres, String direccion, String email, String password, int perfil_tipo) {
        this.cedula = cedula;
        this.nombres = nombres;
        this.direccion = direccion;
        this.email = email;
        this.password = password;
        this.perfil_tipo = perfil_tipo;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPerfil_tipo() {
        return perfil_tipo;
    }

    public void setPerfil_tipo(int perfil_tipo) {
        this.perfil_tipo = perfil_tipo;
    }

    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    @Override
    public String toString() {
        return "Cliente{" + "cedula=" + cedula + ", nombres=" + nombres + ", direccion=" + direccion + ", email=" + email + ", password=" + password + ", perfil_tipo=" + perfil_tipo + ", clientes=" + clientes + '}';
    }

    
}
