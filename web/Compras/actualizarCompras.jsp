<%-- 
    Document   : actualizarCompras
    Created on : 13/03/2022, 16:26:32
    Author     : Familia
--%>
<%@page import="com.itq.configuracion.Fecha"%>
<%@page import="java.util.Date"%>
<%@page import="com.itq.model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="compraM" class="com.itq.model.Compras" scope="application"/>
<jsp:useBean id="Scompra" class="com.itq.servicio.CompraServicio" scope="application" />
<jsp:useBean id="clienteS" class="com.itq.servicio.ClienteServicio" scope="application" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("compra").toString());
    compraM = Scompra.buscarPorId(id);
    //List< Pago> listaPerfil = pagoS.buscarPago();
    List<Cliente> listaCliente = clienteS.bucarCliente();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Compra</title>
    </head>
    <body>
        <h1>Actualizar Compra</h1>
        <form method="POST">
            <table>
                <tr>
                    <th>Id Compra</th>
                    <th><input type="number" name="idC" value="<%= compraM.getIdCompras()%>"maxlength="10" readonly></th>
                </tr>
                <tr>
                    <th>Id Pago</th>
                    <th><input type="number" name="idP" value="<%= compraM.getIdPago()%>" required></th>
                </tr>
                <tr>
                    <th>Cedula</th>
                    <th><select name="ced" >
                            <option> -- Seleccione Cliente --</option>
                            <% for (Cliente cl : listaCliente) {%>
                            <option value="<%= cl.getCedula()%>"
                                    <%
                                        if (cl.getCedula().equals(compraM.getCedula())) {
                                            out.print("selected='selected'");
                                        }
                                    %>> <%= cl.getNombres()%></option>
                            <% }%>
                        </select></th>
                </tr>
                <tr>
                    <th>Fecha de Compra</th>
                    <th><input type="date" name="fechC" value="<%= compraM.getFechaCompra()%>" required></th>
                </tr>
                <tr>
                    <th>Monto</th>
                    <th><input type="number" name="monto" value="<%= compraM.getMonto()%>" required></th>
                </tr>
                <tr>
                    <th>Estado</th>
                    <th><input type="text" name="estado" value="<%= compraM.getEstado()%>"></th>
                </tr>
                <tr>
                    <td><input type="submit" name="btnEnviar" value="Actualizar Compra">
                        <br><br><a href="consultaCompras.jsp"> Regresar </a>
                    </td>
                </tr>                
            </table>
        </form>
        <%
            SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
            if (request.getParameter("btnEnviar") != null) {
                compraM.setIdCompras(Integer.parseInt(request.getParameter("idC")));
                compraM.setIdPago(Integer.parseInt(request.getParameter("idP")));
                compraM.setCedula(request.getParameter("ced"));
                Date fecha = new Date();
                compraM.setFechaCompra(fecha);
                compraM.setMonto(Double.parseDouble(request.getParameter("monto")));
                compraM.setEstado(request.getParameter("estado"));
                //cm.setPerfil_tipo(Integer.parseInt(request.getParameter("perfil").toString()));

                if (Scompra.actualizarCompra(compraM)) {
                    out.print("Datos actualizados correctamente");
                    out.print(compraM);
                } else {
                    out.print("No fue posible actualizar datos");
                    out.print(compraM);
                }
            }
        %>
    </body>
</html>
