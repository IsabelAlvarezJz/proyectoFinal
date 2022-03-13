<%-- 
    Document   : consultaProductos
    Created on : 13 mar. 2022, 08:52:44
    Author     : Famila
--%>
<%@page import="com.itq.model.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="producto" class="com.itq.servicio.ProductoServicio" scope="application"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Productos</title>        
    </head>
    <body>
        <h1>Consultar Productos</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo de producto</th>
                    <th>Nombres</th>
                    <th>Foto</th> 
                    <th>Descripcion</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>ruta</th>
                    <th>Editar</th>
                    <td>Eliminar</td>
                </tr>
            </thead>
            <%

                List<Producto> listaProducto = producto.bucarProducto();
                for (Producto temp : listaProducto) {
                    out.println("<tr>");
                    out.println("<td>" + temp.getCodProducto()+ "</td>");
                    out.println("<td>" + temp.getNombres() + "</td>");
                    out.println("<td>" + temp.getFoto()+ "</td>");
                    out.println("<td>" + temp.getDescripcion()+ "</td>");
                    out.println("<td>" + temp.getPrecio()+ "</td>");
                    out.println("<td>" + temp.getStock()+ "</td>");
                    out.println("<td>" + temp.getRuta()+ "</td>");
            %>
            <td>
                <a href="actualizarCliente.jsp?codP=<%= temp.getCodProducto()%>"
                   onclick="return confirm('Seguro que desea eliminar el cliente?')">Editar</a>
            </td>
            <td>
                <a href="eliminarCliente.jsp?codP=<%= temp.getCodProducto()%>"
                   onclick="return confirm('Seguro que desea eliminar el cliente?')">Eliminar</a>
            </td>

            <%
                    out.println("</tr>");
                }
            %>
        </table>       
    </body>
</html>

