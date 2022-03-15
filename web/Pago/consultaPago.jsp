<%-- 
    Document   : consultaPago
    Created on : 14/03/2022, 18:08:10
    Author     : Familia
--%>
<%@page import="com.itq.model.Pago"%>
<%@page import="java.util.List"%>
<jsp:useBean id="pag" class="com.itq.servicio.PagoServicio" scope="application"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagos</title>
    </head>
    <body>
        <h1>Pagos</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Id Pago</th>
                    <th>Monto</th> 
                    <th>Editar</th>
                    <th>Eliminar</th> 
                </tr>
            </thead>
            <%

                List<Pago> listaPago = pag.buscarPago();
                for (Pago temp : listaPago) {
                    out.println("<tr>");
                    out.println("<td>" + temp.getIdPago()+ "</td>");
                    out.println("<td>" + temp.getMonto()+ "</td>");
            %>
            <td>
                <a href="actualizarPago.jsp?pago=<%= temp.getIdPago()%>">Editar</a>
            </td>
            <td>
                <a href="eliminarPago.jsp?pago=<%= temp.getIdPago()%>"
                   onclick="return confirm('Seguro que desea eliminar el pago?')">Eliminar</a>
            </td>

            <%
                    out.println("</tr>");
                }
            %>
        </table>        
    </body>
</html>
