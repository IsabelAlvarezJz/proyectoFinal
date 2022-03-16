<%-- 
    Document   : insertarCliente
    Created on : 7 mar. 2022, 10:44:29
    Author     : Oskar
--%>
<%@page import="java.security.MessageDigest"%>
<%@page import="com.itq.model.Perfil"%>
<%@page import="java.util.List"%>
<%@page import="com.itq.model.Cliente"%>
<jsp:useBean id="cliente" class="com.itq.servicio.ClienteServicio" scope="application" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion = request.getSession(false);
    String usuario = "";
    String email = "";
    String cedula = "";

    if (objsesion.getAttribute("nombresUsuario") == null) {
        response.sendRedirect("index.jsp");
    } else {
        usuario = objsesion.getAttribute("nombresUsuario").toString();
        email = objsesion.getAttribute("emailUsuario").toString();
        cedula = objsesion.getAttribute("cedulaUsuario").toString();
        if (usuario.equals("")) {
            usuario = "usuario";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar nuevo cliente</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/headers.css" rel="stylesheet">
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
    </head>
    <body>        
        <jsp:useBean id="perfil" class="com.itq.servicio.PerfilServicio" scope="application" />

        <%
            List<Perfil> perfilLista = perfil.buscarPerfil();
        %>
        <main>
            <header>
                <div class="px-3 py-2 bg-dark text-white">
                    <div class="container">
                        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                            <a href="../perfilAdmin.jsp" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                                <img src="../images/user.png" alt="sing up image" style="width: 40px; height: 40px; margin-right: 20px;"> <% out.println(usuario + " - " + email);%>
                            </a>
                            <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                                logo
                            </a>
                            <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                                <li>
                                <center>
                                    <a href="../admin.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-home material-icons-name" style="font-size: 30px;"></i><br>
                                        Inicio
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="../Productos/consultaProductos.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-store material-icons-name" style="font-size: 30px;"></i><br>
                                        Productos
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="../Compras/consultaCompras.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-ticket-star material-icons-name" style="font-size: 30px;"></i><br>
                                        Compras
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="../Pago/consultaPago.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-card material-icons-name" style="font-size: 30px;"></i><br>
                                        Pagos
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="../Cliente/consultarCliente.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-account-add material-icons-name" style="font-size: 30px;"></i><br>
                                        Clientes
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="../Perfil/consultarPerfil.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-accounts-list material-icons-name" style="font-size: 30px;"></i><br>
                                        Perfiles
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="../cerrarSesion.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-power material-icons-name" style="font-size: 30px;"></i><br>
                                        Cerrar Sesión
                                    </a>
                                </center>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
            <div class="container"> 
                <br>
                <div class="card-header">
                    <h1>Insertar Cliente</h1>
                </div>
                <form>
                    <div class="card-body">

                        <table>
                            <tr>
                                <th>Cedula</th>
                                <th><input type="text" class="form-control" name="ced" minlength="10" maxlength="10" required></th>
                            </tr>
                            <tr>
                                <th>Nombres</th>
                                <th><input type="text" class="form-control" name="nomC" required></th>
                            </tr>
                            <tr>
                                <th>Dirección</th>
                                <th><input type="text" class="form-control" name="dirL" required></th>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <th><input type="email" class="form-control" name="email" required></th>
                            </tr>
                            <tr>
                                <th>Password</th>
                                <th><input type="password" class="form-control" name="pass" required></th>
                            </tr>
                            <tr>
                                <th>Perfil</th>
                                <th><select class="form-control" name="perfil" required>
                                        <option value=""> -- Seleccione Pefil --</option>
                                        <% for (Perfil pe : perfilLista) {%>
                                        <option value="<%= pe.getIdPerfil()%>"><%= pe.getTipo()%></option>
                                        <% } %>
                                    </select></th>
                            </tr>                
                        </table>
                    </div>
                    <div class="card-footer">
                        <center>
                            <input class="btn btn-outline-primary" type="submit" name="btnEnviar" value="Insertar Cliente" onclick="return confirm('Seguro que desea inseratar el cliente?')">  
                        </center>
                    </div>
                </form>
            </div>
            <%
                Cliente clien = new Cliente();

                if (request.getParameter("btnEnviar") != null) {
                    clien.setCedula(request.getParameter("ced"));
                    clien.setNombres(request.getParameter("nomC"));
                    clien.setDireccion(request.getParameter("dirL"));
                    clien.setEmail(request.getParameter("email"));

                    String password = request.getParameter("pass");
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    md.update(password.getBytes());
                    byte[] byteData = md.digest();

                    StringBuilder sb = new StringBuilder(32);
                    for (byte b : byteData) {
                        sb.append(String.format("%02x", b & 0xff));
                    }
                    clien.setPassword(String.valueOf(sb));
                    clien.setPerfil_tipo(Integer.parseInt(request.getParameter("perfil")));

                    //out.print(local)
                    if (cliente.insertarCliente(clien)) {
                        response.sendRedirect("consultarCliente.jsp");
                    } else {
                        out.print("No fue posible insertar datos, ingrese otro numero de cedula aqui...");
                    }
                }
            %>
        </main>
        <script src="../js/nav.js"></script>
    </body>
</html>
