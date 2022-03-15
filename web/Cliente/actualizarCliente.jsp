<%-- 
    Document   : insertarCliente
    Created on : 7 mar. 2022, 10:44:29
    Author     : Familia
--%>


<%@page import="java.security.MessageDigest"%>
<%@page import="com.itq.model.Perfil"%>
<%@page import="java.util.List"%>
<jsp:useBean id="cm" class="com.itq.model.Cliente" scope="application"/>

<jsp:useBean id="cs" class="com.itq.servicio.ClienteServicio" scope="application" />
<jsp:useBean id="pers" class="com.itq.servicio.PerfilServicio" scope="application" />
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
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/headers.css" rel="stylesheet">
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
    </head>
    <body>
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
                                    <a href="consultaProductos.jsp" class="nav-link text-secondary">
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
                    <% out.println("<h1> Datos del Cliente " + cm.getNombres() + "</h1>");%>
                </div>
                <form method="POST">
                    <div class="card-body">

                        <table class="table">
                            <tr>
                                <th>Cedula</th>
                                <th><input type="text" class="form-control" name="ced" value="<%= cm.getCedula()%>" readonly></th>
                            </tr>
                            <tr>
                                <th>Nombres</th>
                                <th><input type="text" class="form-control" name="nomC" value="<%= cm.getNombres()%>" required></th>
                            </tr>
                            <tr>
                                <th>Direccion</th>
                                <th><input type="text" class="form-control" name="dirL" value="<%= cm.getDireccion()%>" required></th>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <th><input type="email" class="form-control" name="email" value="<%= cm.getEmail()%>" required></th>
                            </tr>
                            <tr hidden>
                                <th>Password</th>
                                <th><input type="password" class="form-control" name="pass" value="<%= cm.getPassword()%>" ></th>
                            </tr>
                            <tr>
                                <th>Perfil</th>
                                <th><select class="form-control" name="perfil" required>
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
                        </table>


                    </div>
                    <div class="card-footer">
                        <center>
                            <input class="btn btn-outline-primary" type="submit" name="btnEnviar" value="Actualizar Cliente" onclick="return confirm('Seguro que desea actualizar el cliente?')">  
                        </center>
                    </div>
                </form>
            </div>
            <%
                if (request.getParameter("btnEnviar") != null) {
                    cm.setCedula(request.getParameter("ced"));
                    cm.setNombres(request.getParameter("nomC"));
                    cm.setDireccion(request.getParameter("dirL"));
                    cm.setEmail(request.getParameter("email"));

                    String password = request.getParameter("pass");
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    md.update(password.getBytes());
                    byte[] byteData = md.digest();

                    StringBuilder sb = new StringBuilder(32);
                    for (byte b : byteData) {
                        sb.append(String.format("%02x", b & 0xff));
                    }
                    cm.setPassword(String.valueOf(sb));

                    if (cs.actualizarCliente(cm)) {
                        response.sendRedirect("consultarCliente.jsp");
                    } else {
                        out.print("No fue posible actualizar datos");
                    }
                }
            %>
        </main>
        <script src="../js/nav.js"></script>
    </body>
</html>


