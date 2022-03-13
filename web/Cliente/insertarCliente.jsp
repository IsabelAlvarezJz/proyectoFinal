<%-- 
    Document   : insertarCliente
    Created on : 7 mar. 2022, 10:44:29
    Author     : Oskar
--%>
<%@page import="com.itq.model.Perfil"%>
<%@page import="java.util.List"%>
<%@page import="com.itq.model.Cliente"%>
<jsp:useBean id="cliente" class="com.itq.servicio.ClienteServicio" scope="application" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar nuevo cliente</title>
    </head>
    <body>
        <jsp:useBean id="perfil" class="com.itq.servicio.PerfilServicio" scope="application" />
        
        <%
            List<Perfil> perfilLista = perfil.buscarPerfil();
        %>

        <h1>Insertar Cliente</h1>

        <form>
            <table>
                <tr>
                    <th>Cedula</th>
                    <th><input type="text" name="ced" minlength="10" maxlength="10" required></th>
                </tr>
                <tr>
                    <th>Nombres</th>
                    <th><input type="text" name="nomC" required></th>
                </tr>
                <tr>
                    <th>Dirección</th>
                    <th><input type="text" name="dirL" required></th>
                </tr>
                <tr>
                    <th>Email</th>
                    <th><input type="email" name="email" required></th>
                </tr>
                <tr>
                    <th>Password</th>
                    <th><input type="password" name="pass" required></th>
                </tr>
                <tr>
                    <th>Perfil</th>
                    <th><select name="perfil" >
                            <option> -- Seleccione Pefil --</option>
                            <% for(Perfil pe: perfilLista){ %>
                            <option value="<%= pe.getIdPerfil()%>"><%= pe.getTipo()%></option>
                            <% } %>
                        </select></th>
                </tr>
                <tr>
                    <td><input type="submit" name="btnEnviar" value="Guardar Cliente">
                        <br><br><a href="consultarCliente.jsp"> Regresar</a>
                    </td>
                </tr>                
            </table>
        </form>
        <%
            Cliente clien = new Cliente();

            if (request.getParameter("btnEnviar") != null) {
                clien.setCedula(request.getParameter("ced"));
                clien.setNombres(request.getParameter("nomC"));
                clien.setDireccion(request.getParameter("dirL"));
                clien.setEmail(request.getParameter("email"));
                clien.setPassword(request.getParameter("pass"));
                clien.setPerfil_tipo(Integer.parseInt(request.getParameter("perfil")));

                //out.print(local)
                if (cliente.insertarCliente(clien)) {
                    out.print("Datos insertados correctamente");
                    out.print(clien);
                } else {
                    out.print("No fue posible insertar datos");
                    out.print(clien);
                }
            }
        %>

    </body>
</html>
