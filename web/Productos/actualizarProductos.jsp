<%-- 
    Document   : actualizarProductos
    Created on : 13/03/2022, 15:36:46
    Author     : Familia
--%>

<%@page import="com.itq.model.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="mP" class="com.itq.model.Producto" scope="application"/>
<jsp:useBean id="sP" class="com.itq.servicio.ProductoServicio" scope="application" />
<%
    String id = request.getParameter("codP").toString();
    mP = sP.buscarPorId(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Productos</title>
    </head>
    <body>
        <% out.println("<h1> Datos del Producto " + mP.getNombres() + "</h1>");%>

        <form method="POST">
            <table>
                <tr>
                    <th><input type="text" name="codP" value="<%= mP.getCodProducto()%>" readonly></th>
                </tr>
                <tr>
                    <th>Nombres</th>
                    <th><input type="text" name="nomP" value="<%= mP.getNombres()%>"></th>
                </tr>
                <tr>
                    <th>Foto</th>
                    <th><input type="file" name="fotoP" value="<%= mP.getFoto()%>"></th>
                </tr>
                <tr>
                    <th>Descripcion</th>
                    <th><input type="text" name="descP" value="<%= mP.getDescripcion()%>"></th>
                </tr>
                <tr>
                    <th>Precio</th>
                    <th><input type="number" name="precio" value="<%= mP.getPrecio()%>"></th>
                </tr>
                <tr>
                    <th>Stock</th>
                    <th><input type="number" name="stock" value="<%= mP.getStock()%>"></th>
                </tr>
                <tr>
                    <th>Ruta</th>
                    <th><input type="text" name="ruta" value="<%= mP.getRuta()%>"></th>
                </tr>                
                <tr>
                    <td><input type="submit" name="btnEnviar" value="Actualizar Producto">
                        <br><br><button><a href="consultaProductos.jsp">Regresar a Productos</a></button>
                    </td>
                </tr>                
            </table>
        </form>
        <%
            if (request.getParameter("btnEnviar") != null) {
                mP.setCodProducto(request.getParameter("codP"));
                mP.setNombres(request.getParameter("nomP"));
                mP.setFoto(request.getParameter("fotoP"));
                mP.setDescripcion(request.getParameter("descripcion"));
                mP.setPrecio(Double.parseDouble(request.getParameter("precio")));
                mP.setStock(Integer.parseInt(request.getParameter("precio")));
                mP.setRuta(request.getParameter("ruta"));
                
                if (sP.actualizarProducto(mP)) {
                    out.print("Datos actualizados correctamente");
                    out.print(mP);
                } else {
                    out.print("No fue posible actualizar datos");
                    out.print(mP);
                }
            }
        %>
    </body>
</html>
