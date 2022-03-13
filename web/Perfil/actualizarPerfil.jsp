<%-- 
    Document   : insertarCliente
    Created on : 7 mar. 2022, 10:44:29
    Author     : Familia
--%>

<jsp:useBean id="pm" class="com.itq.model.Perfil" scope="application"/>

<jsp:useBean id="ps" class="com.itq.servicio.PerfilServicio" scope="application" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //request.setAttribute("idC", request.getParameter("id"));
    int id = Integer.parseInt(request.getParameter("id"));
    pm = ps.buscarPorId(id);
    out.print(id);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Perfil</title>
    </head>
    <body>
        <% out.println("<h1> Datos del Perfil " + pm.getTipo()+ "</h1>");%>
        <form method="POST" >
            <table>
                <input type="hidden" name="id" value="<%= pm.getIdPerfil()%>">
                <tr>
                    <th>Tipo</th>
                    <th><input type="text" name="tipo" value="<%= pm.getTipo()%>"></th>
                </tr>
                <tr>
                    <th>Descripcion</th>
                    <th><input type="text" name="des" value="<%= pm.getDescripcion()%>"></th>
                </tr>               
                <tr>
                    <td><input type="submit" name="btnEnviar" value="Actualizar">
                        <br><br><a href="consultarPerfil.jsp"> Regresar</a>
                    </td>
                </tr>
            </table>
        </form>
        <%
            if (request.getParameter("btnEnviar") != null) {
                pm.setTipo(request.getParameter("tipo"));
                pm.setDescripcion(request.getParameter("des"));                

                if (ps.actualizarPerfil(pm)) {
                    out.print("Datos actualizados correctamente");
                    out.print(pm);
                } else {
                    out.print("No fue posible actualizar datos");
                    out.print(pm);
                }
            }
        %>

    </body>
</html>