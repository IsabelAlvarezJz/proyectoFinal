<%-- 
    Document   : insertarCompras
    Created on : 13/03/2022, 16:02:36
    Author     : Familia
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itq.model.Compras"%>
<%@page import="com.itq.model.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="com" class="com.itq.servicio.CompraServicio" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Compra</title>
    </head>
    <body>        
        <jsp:useBean id="pago" class="" scope="application" />
        <jsp:useBean id="cliente" class="com.itq.servicio.ClienteServicio" scope="application" />
        <%
            //List<Pago> listaPago = pago.buscarPago();
            List<Cliente> listaCliente = cliente.bucarCliente();
        %>
    </body>
    <h1>Añadir Compra</h1>
    <form>
        <table>
            <tr>
                <th>Id Compra</th>
                <th><input type="number" name="idC" maxlength="10" required></th>
            </tr>
            <tr>
                <th>Id Pago</th>
                <th><input type="number" name="idP" required></th>
            </tr>
            <tr>
                <th>Cedula</th>
                <th><select name="ced" >
                        <option> -- Seleccione Cliente --</option>
                        <% for (Cliente cl : listaCliente) {%>
                        <option value="<%= cl.getCedula()%>"><%= cl.getNombres()%></option>
                        <% }%>
                    </select></th>
            </tr>
            <tr>
                <th>Fecha de Compra</th>
                <th><input type="date" name="fechC" required></th>
            </tr>
            <tr>
                <th>Monto</th>
                <th><input type="number" name="monto" required></th>
            </tr>
            <tr>
                <th>Estado</th>
                <th><input type="text" name="estado"></th>
            </tr>
            <tr>
                <td><input type="submit" name="btnEnviar" value="Guardar Compra">
                    <br><br><a href="consultaCompras.jsp"> Regresar </a>
                </td>
            </tr>                
        </table>
    </form>
    <%
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        Compras co = new Compras();

        if (request.getParameter("btnEnviar") != null) {
            co.setIdCompras(Integer.parseInt(request.getParameter("idC")));
            co.setIdPago(Integer.parseInt(request.getParameter("idP")));
            co.setCedula(request.getParameter("ced"));
            Date fecha = formatoFecha.parse(request.getParameter("fechC"));
            co.setFechaCompra(fecha);
            co.setMonto(Double.parseDouble(request.getParameter("monto")));
            co.setEstado(request.getParameter("estado"));
            
            //out.print(local)
            if (com.insertarCompra(co)) {
                out.print("Datos insertados correctamente");
                out.print(co);
            } else {
                out.print("No fue posible insertar datos");
                out.print(co);
            }
        }
    %>
</html>
