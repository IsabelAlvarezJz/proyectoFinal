<%-- 
    Document   : insertarCliente
    Created on : 7 mar. 2022, 10:44:29
    Author     : Familia
--%>


<%@page import="com.itq.model.Perfil"%>
<%@page import="java.util.List"%>
<jsp:useBean id="cm" class="com.itq.model.Cliente" scope="application"/>

<jsp:useBean id="cs" class="com.itq.servicio.ClienteServicio" scope="application" />
<jsp:useBean id="pers" class="com.itq.servicio.PerfilServicio" scope="application" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("ci").toString();
    cm = cs.buscarPorId(id);
    List< Perfil> listaPerfil = pers.buscarPerfil();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Cliente</title>
    </head>
    <body>
        <% out.println("<h1> Datos del Cliente " + cm.getNombres() + "</h1>");%>

        <form method="POST">
            <table>
                <tr>
                    <th><input type="text" name="ced" value="<%= cm.getCedula()%>" readonly></th>
                </tr>
                <tr>
                    <th>Nombres</th>
                    <th><input type="text" name="nomC" value="<%= cm.getNombres()%>"></th>
                </tr>
                <tr>
                    <th>Direccion</th>
                    <th><input type="text" name="dirL" value="<%= cm.getDireccion()%>"></th>
                </tr>
                <tr>
                    <th>Email</th>
                    <th><input type="email" name="email" value="<%= cm.getEmail()%>"></th>
                </tr>
                <tr>
                    <th>Direccion</th>
                    <th><input type="password" name="pass" value="<%= cm.getPassword()%>"></th>
                </tr>
                <tr>
                    <th>Perfil</th>
                    <th><select name="perfil" >
                            <% for (Perfil perf : listaPerfil) {%>
                            <option value="<%= perf.getIdPerfil()%>"
                                    <%
                                        if (perf.getIdPerfil() == cm.getPerfil_tipo()) {
                                            out.println("selected='selected'");
                                        }
                                    %>
                                    ><%= perf.getTipo()%></option>
                            <% } %>
                        </select>
                    </th>
                </tr>
                <tr>
                    <td><input type="submit" name="btnEnviar" value="Actualizar">
                        <br><br><a href="consultarCliente.jsp">Regresar</a>
                    </td>
                </tr>                
            </table>
        </form>
        <%
            if (request.getParameter("btnEnviar") != null) {
                cm.setCedula(request.getParameter("ced"));
                cm.setNombres(request.getParameter("nomC"));
                cm.setDireccion(request.getParameter("dirL"));
                cm.setEmail(request.getParameter("email"));
                cm.setPassword(request.getParameter("pass"));
                //cm.setPerfil_tipo(Integer.parseInt(request.getParameter("perfil").toString()));

                if (cs.actualizarCliente(cm)) {
                    out.print("Datos actualizados correctamente");
                    out.print(cm);
                } else {
                    out.print("No fue posible actualizar datos");
                    out.print(cm);
                }
            }
        %>
    </body>
</html>


