<%-- 
    Document   : insertarPago
    Created on : 14/03/2022, 18:11:44
    Author     : Familia
--%>

<%@page import="com.itq.model.Pago"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pa" class="com.itq.servicio.PagoServicio" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Pago</title>
    </head>
    <body>
        <h1>Agregar Pago</h1>
        <form method="POST" >
            <table border="1">
                <tr>
                    <th>Monto</th>
                    <th><input type="number" step="0.01" name="monto"></th>
                </tr>               

            </table><br><br>
            <tr>
                <td><input type="submit" name="btnEnviar" value="Insertar">
                    <br><br><a href="consultaPago.jsp"> Regresar</a>
                </td>
            </tr>
        </form>
        <%
            Pago pg = new Pago();

            if (request.getParameter("btnEnviar") != null) {
                pg.setMonto(Double.parseDouble(request.getParameter("monto")));

                if (pa.insertarPago(pg)) {
                    out.print("Datos insertados correctamente");
                    out.print(pg);
                } else {
                    out.print("No fue posible insertar datos");
                    out.print(pg);
                }
            }
        %>
    </body>
</html>
