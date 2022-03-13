package com.itq.interfaces;

import com.itq.model.Cliente;
import java.util.List;

/**
 *
 * @author Isabel
 */
public interface ICliente {

    //TODOS LOS METODOS NECESARIOS PARA EL CRUD
    public List<Cliente> bucarCliente();

    public Cliente buscarPorId(String cedula);

    public boolean insertarCliente(Cliente client);

    public boolean actualizarCliente(Cliente client);

    public boolean eliminarCliente(String cedula);
}
