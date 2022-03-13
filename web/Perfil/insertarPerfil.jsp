<%-- 
    Document   : insertarCliente
    Created on : 7 mar. 2022, 10:44:29
    Author     : Familia
--%>
<%@page import="com.itq.model.Perfil"%>
<jsp:useBean id="perfil" class="com.itq.servicio.PerfilServicio" scope="application" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso Perfil</title>
    </head>
    <body>
        <h1>Ingreso Perfil</h1>
        <form method="POST" >
            <table border="1">
                <tr>
                    <th>Tipo</th>
                    <th><input type="text" name="tipo"></th>
                </tr>
                <tr>
                    <th>Descripcion</th>
                    <th><input type="text" name="des"></th>
                </tr>                

            </table><br><br>
            <tr>
                <td><input type="submit" name="btnEnviar" value="Actualizar">
                    <br><br><a href="consultarPerfil.jsp"> Regresar</a>
                </td>
            </tr>
        </form>
        <%
            Perfil perf = new Perfil();

            if (request.getParameter("btnEnviar") != null) {
                perf.setTipo(request.getParameter("tipo"));
                perf.setDescripcion(request.getParameter("des"));

                if (perfil.insertarPerfil(perf)) {
                    out.print("Datos insertados correctamente");
                    out.print(perf);
                } else {
                    out.print("No fue posible insertar datos");
                    out.print(perf);
                }
            }
        %>

    </body>
</html>
