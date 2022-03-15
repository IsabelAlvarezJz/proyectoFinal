<%-- 
    Document   : actualizarPago
    Created on : 14/03/2022, 18:15:06
    Author     : Familia
--%>
<jsp:useBean id="mp" class="com.itq.model.Pago" scope="application"/>

<jsp:useBean id="sp" class="com.itq.servicio.PagoServicio" scope="application" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("pago"));
    mp = sp.buscarPorId(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagos</title>
    </head>
    <body>
        <h1>Actualizar Pago</h1>
        <form method="POST" >
            <table>
                <input type="number" name="id" value="<%= mp.getIdPago()%>" readonly>
                <tr>
                    <th>Monto</th>
                    <th><input type="number" step="0.01" name="mon" value="<%= mp.getMonto()%>"></th>
                </tr>             
                <tr>
                    <td><input type="submit" name="btnEnviar" value="Actualizar">
                        <br><br><a href="consultaPago.jsp"> Regresar</a>
                    </td>
                </tr>
            </table>
        </form>
        <%
            if (request.getParameter("btnEnviar") != null) {
                mp.setMonto(Double.parseDouble(request.getParameter("mon")));
                if (sp.actualizarPago(mp)) {
                    out.print("Datos actualizados correctamente");
                    out.print(mp);
                } else {
                    out.print("No fue posible actualizar datos");
                    out.print(mp);
                }
            }
        %>
    </body>
</html>
