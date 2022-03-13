
package com.itq.servicio;

import com.itq.dao.ClienteMetodos;
import com.itq.model.Cliente;
import java.util.List;

public class ClienteServicio {   
    public List<Cliente> bucarCliente() {
        return new ClienteMetodos().bucarCliente();
    }
 
    
    public Cliente buscarPorId(String cedula) {
        return new ClienteMetodos().buscarPorId(cedula);
    }
  
    public boolean insertarCliente(Cliente client) {
        return new ClienteMetodos().insertarCliente(client);
    }  
    
    public boolean actualizarCliente(Cliente client) {
         return new ClienteMetodos().actualizarCliente(client);
    }
   
    public boolean eliminarCliente(String cedula) {
         return new ClienteMetodos().eliminarCliente(cedula);
    }
}
