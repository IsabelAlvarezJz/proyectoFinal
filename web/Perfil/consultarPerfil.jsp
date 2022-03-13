<%-- 
    Document   : ConsultarCliente
    Created on : 03-mar-2022, 11:14:21
    Author     : Familia
--%>

<jsp:useBean id="per" class="com.itq.servicio.PerfilServicio" scope="application"/>

<%@page import="com.itq.model.Perfil"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Perfil</title>        
    </head>
    <body>
        <h1>Actualizar Perfil</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Id Perfil</th>
                    <th>Tipo</th> 
                    <th>Descripcion</th>                     
                    <th>Editar</th>
                    <td>Eliminar</td>
                </tr>
            </thead>
            <%

                List<Perfil> listaPerfil = per.buscarPerfil();
                for (Perfil temp : listaPerfil) {
                    out.println("<tr>");
                    out.println("<td>" + temp.getIdPerfil() + "</td>");
                    out.println("<td>" + temp.getTipo() + "</td>");
                    out.println("<td>" + temp.getDescripcion() + "</td>");
            %>
            <td>
                <a href="actualizarPerfil.jsp?id=<%= temp.getIdPerfil()%>"
                   onclick="return confirm('Seguro que desea actualizar el perfil?')">Editar</a>
            </td>
            <td>
                <a href="eliminarPerfil.jsp?id=<%= temp.getIdPerfil()%>"
                   onclick="return confirm('Seguro que desea eliminar el perfil?')">Eliminar</a>
            </td>

            <%
                    out.println("</tr>");
                }
            %>
        </table>        
    </body>
</html>
