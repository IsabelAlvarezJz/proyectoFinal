<%-- 
    Document   : consultaCompras
    Created on : 13/03/2022, 15:53:06
    Author     : Familia
--%>
<%@page import="com.itq.model.Compras"%>
<%@page import="java.util.List"%>
<jsp:useBean id="comp" class="com.itq.servicio.CompraServicio" scope="application"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Compras</title>
    </head>
    <body>
        <h1>Consultar Compras</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo Compra</th>
                    <th>Id Pago</th>
                    <th>Cedula</th> 
                    <th>Fecha de Compra</th>
                    <th>Monto</th>
                    <th>Estado</th>
                    <th>Editar</th>
                    <td>Eliminar</td>
                </tr>
            </thead>
            <%

                List<Compras> listaCompras = comp.buscarCompra();
                for (Compras temp : listaCompras) {
                    out.println("<tr>");
                    out.println("<td>" + temp.getIdCompras()+ "</td>");
                    out.println("<td>" + temp.getIdPago()+ "</td>");
                    out.println("<td>" + temp.getCedula()+ "</td>");
                    out.println("<td>" + temp.getFechaCompra()+ "</td>");
                    out.println("<td>" + temp.getMonto()+ "</td>");
                    out.println("<td>" + temp.getEstado()+ "</td>");
            %>
            <td>
                <a href="actualizarCompras.jsp?compra=<%= temp.getIdCompras()%>"
                   onclick="return confirm('Seguro que desea eliminar la Compra?')">Editar</a>
            </td>
            <td>
                <a href="eliminarCompras.jsp?compra=<%= temp.getIdCompras()%>"
                   onclick="return confirm('Seguro que desea eliminar la Compra?')">Eliminar</a>
            </td>

            <%
                    out.println("</tr>");
                }
            %>
        </table>   
    </body>
</html>
