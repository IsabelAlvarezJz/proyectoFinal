<%-- 
    Document   : ConsultarCliente
    Created on : 03-mar-2022, 11:14:21
    Author     : Familia
--%>

<%@page import="com.itq.model.Cliente"%>
<%@page import="java.util.List"%>
<jsp:useBean id="cliente" class="com.itq.servicio.ClienteServicio" scope="application"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Clientes</title>        
    </head>
    <body>
        <h1>Consultar Clientes</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Cedula</th>
                    <th>Nombres</th>
                    <th>Dirección</th> 
                    <th>Email</th>
                    <th>Password</th>
                    <th>Perfil</th>
                    <th>Editar</th>
                    <th>Elimina</th>
                </tr>
            </thead>
            <%

                List<Cliente> listaClientes = cliente.bucarCliente();
                for (Cliente temp : listaClientes) {
                    out.println("<tr>");
                    out.println("<td>" + temp.getCedula() + "</td>");
                    out.println("<td>" + temp.getNombres() + "</td>");
                    out.println("<td>" + temp.getDireccion() + "</td>");
                    out.println("<td>" + temp.getEmail() + "</td>");
                    out.println("<td>" + temp.getPassword() + "</td>");
                    out.println("<td>" + temp.getPerfil_tipo() + "</td>");
            %>
            <td>
                <a href="actualizarCliente.jsp?ci=<%= temp.getCedula()%>"
                   onclick="return confirm('Seguro que desea eliminar el cliente?')">Editar</a>
            </td>
            <td>
                <a href="eliminarCliente.jsp?ci=<%= temp.getCedula()%>"
                   onclick="return confirm('Seguro que desea eliminar el cliente?')">Eliminar</a>
            </td>

            <%
                    out.println("</tr>");
                }
            %>
        </table>       
    </body>
</html>
