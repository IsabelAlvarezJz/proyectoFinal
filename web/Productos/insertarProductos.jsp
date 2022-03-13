<%-- 
    Document   : insertarProductos
    Created on : 13/03/2022, 15:26:38
    Author     : Familia
--%>

<%@page import="com.itq.model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="producto" class="com.itq.servicio.ProductoServicio" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar nuevo producto</title>
    </head>
   <body>
        <h1>Insertar Producto</h1>

        <form>
            <table>
                <tr>
                    <th>Codigo Producto</th>
                    <th><input type="text" name="idP" maxlength="10" required></th>
                </tr>
                <tr>
                    <th>Nombres</th>
                    <th><input type="text" name="nomP" required></th>
                </tr>
                <tr>
                    <th>Foto</th>
                    <th><input type="file" name="fotoP" required></th>
                </tr>
                <tr>
                    <th>Descripcion</th>
                    <th><input type="text" name="descP" required></th>
                </tr>
                <tr>
                    <th>Precio</th>
                    <th><input type="number" name="precio" required></th>
                </tr>
                <tr>
                    <th>Stock</th>
                    <th><input type="number" name="stock" required></th>
                </tr>
                <tr>
                    <th>Ruta</th>
                    <th><input type="text" name="ruta" required></th>
                </tr>
                <tr>
                    <td><input type="submit" name="btnEnviar" value="Guardar Producto">
                        <br><br><a href="conusltaProductos.jsp"> Regresar</a>
                    </td>
                </tr>                
            </table>
        </form>
        <%
            Producto pro = new Producto();

            if (request.getParameter("btnEnviar") != null) {
                pro.setCodProducto(request.getParameter("idP"));
                pro.setNombres(request.getParameter("nomP"));
                pro.setFoto(request.getParameter("fotoP"));
                pro.setDescripcion(request.getParameter("descripcion"));
                pro.setPrecio(Double.parseDouble(request.getParameter("precio")));
                pro.setStock(Integer.parseInt(request.getParameter("stock")));
                pro.setRuta(request.getParameter("ruta"));

                //out.print(local)
                if (producto.insertarProducto(pro)) {
                    out.print("Datos insertados correctamente");
                    out.print(pro);
                } else {
                    out.print("No fue posible insertar datos");
                    out.print(pro);
                }
            }
        %>

    </body>
</html>
