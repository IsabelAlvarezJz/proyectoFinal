<%-- 
    Document   : perfilCliente
    Created on : 13 mar. 2022, 08:45:31
    Author     : paul.alvarez
--%>
<%@page import="java.security.MessageDigest"%>
<jsp:useBean id="login" class="com.itq.servicio.LoginServicio" scope="application" />
<jsp:useBean id="cm" class="com.itq.model.Cliente" scope="application"/>
<jsp:useBean id="cs" class="com.itq.servicio.ClienteServicio" scope="application" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        cm = cs.buscarPorId(cedula);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tienda Online - </title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/headers.css" rel="stylesheet">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <main>
            <header>
                <div class="px-3 py-2 bg-info text-white">
                    <div class="container">
                        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                            <a href="perfilCliente.jsp" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                                <img src="images/user.png" alt="sing up image" style="width: 40px; height: 40px; margin-right: 20px;"> 
                                <span style="color: black;">Hola: <% out.println(usuario);%></span>
                            </a>
                            <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                                <span style="color: black;">SHOOPER</span>
                            </a>
                            <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                                <li>
                                <center>
                                    <a href="principal.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-home material-icons-name" style="font-size: 30px; color: black;"></i><br>
                                        <span style="color: black;">Inicio</span>
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="#" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-local-offer material-icons-name" style="font-size: 30px; color: black;"></i><br>
                                        <span style="color: black;">Ofertas</span>
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="#" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-shopping-cart material-icons-name" style="font-size: 30px; color: black;"></i><br>
                                        <span style="color: black;">Mis Compras</span>
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="cerrarSesion.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-power material-icons-name" style="font-size: 30px; color: black;"></i><br>
                                        <span style="color: black;">Cerrar Sesión</span>
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
                <form class="register-form" id="login-form">
                    <div class="card-header">
                        <h5>Perfil de Usuario</h5>
                    </div>
                    <div class='card-body'>
                        <div class='row'>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="cedula">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="text" name="cedula" id="cedula" placeholder="Cédula" readonly="true" value="<%= cm.getCedula()%>"/>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="nombres">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="text" name="nombres" id="nombres" placeholder="Nombres" value="<%= cm.getNombres()%>"/>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="email">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="email" name="email" id="email" placeholder="Correo electrónico" value="<%= cm.getEmail()%>"/>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="direccion">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="text" name="direccion" id="direccion" placeholder="Dirección" value="<%= cm.getDireccion()%>"/>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group" style="color: red;">
                                    <label for="password">
                                        <i class="zmdi zmdi-lock"></i>
                                    </label> 
                                    <input type="password" name="password" id="password" placeholder="Contraseña" value="" hidden=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='card-footer'>
                        <center>
                            <button type="submit" class="btn btn-outline-primary" name="btnGuardar">
                                Guardar
                            </button>
                        </center>
                    </div>
                </form>
                <br>
                <form class="register-form" id="login-form">
                    <div class="card-header">
                        <h5>Actualizar Contraseña</h5>
                    </div>
                    <div class='card-body'>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group" style="color: red;">
                                    <label for="password">
                                        <i class="zmdi zmdi-lock"></i>
                                    </label> 
                                    <input type="password" name="password" id="password" placeholder="Contraseña" value=""/>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group" style="color: red;">
                                    <label for="repassword">
                                        <i class="zmdi zmdi-lock"></i>
                                    </label> 
                                    <input type="password" name="repassword" id="repassword" placeholder="Repetir contraseña" value=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class='card-footer'>
                        <center>
                            <button type="submit" class="btn btn-outline-primary" name="btnCambiarContrasena">
                                Cambiar Contraseña
                            </button>
                        </center>
                    </div>
                </form>
                <%
                    if (request.getParameter("btnGuardar") != null) {
                        cm.setCedula(cm.getCedula());
                        cm.setNombres(request.getParameter("nombres"));
                        cm.setDireccion(request.getParameter("direccion"));
                        cm.setEmail(request.getParameter("email"));
                        cm.setPassword(cm.getPassword());
                        cm.setPerfil_tipo(cm.getPerfil_tipo());

                        if (cs.actualizarCliente(cm)) {
                            out.println("<center>");
                            out.println("<span style='color: green; font-size: 15px;'>");
                            out.print("Datos actualizados correctamente");
                            out.println("</span>");
                            out.println("</center>");
                        } else {
                            out.println("<center>");
                            out.println("<span style='color: red; font-size: 15px;'>");
                            out.print("No fue posible actualizar datos");
                            out.println("</span>");
                            out.println("</center>");
                        }
                    } else if (request.getParameter("btnCambiarContrasena") != null){
                        String passw = request.getParameter("password");
                        String passr = request.getParameter("repassword");
                        if(passw.isEmpty() || passr.isEmpty()){
                            out.println("<center>");
                            out.println("<span style='color: red; font-size: 15px;'>");
                            out.print("Ingrese las contraseñas!!!");
                            out.println("</span>");
                            out.println("</center>");
                        } else {
                            if(passw.equals(passr)){
                            
                                MessageDigest md = MessageDigest.getInstance("MD5");
                                md.update(passw.getBytes());
                                byte[] byteData = md.digest();

                                StringBuilder sb = new StringBuilder(32);
                                for (byte b : byteData) {
                                    sb.append(String.format("%02x", b & 0xff));
                                }
                            
                                out.println(cedula);
                                out.println(String.valueOf(sb));
                                
                                if (login.actualizarClave(cedula, String.valueOf(sb))) {
                                    out.println("<center>");
                                    out.println("<span style='color: green; font-size: 15px;'>");
                                    out.print("Contraseña actualizada correctamente!!!");
                                    out.println("</span>");
                                    out.println("<br>");

                                    out.println("<span style='color: blue; font-size: 15px;'>");
                                    out.print("Debes iniciar sesión nuevamente.");
                                    out.println("</span>");
                                    out.println("</center>");
                                    objsesion = request.getSession(true);
                                    objsesion.removeAttribute("nombresUsuario");
                                    objsesion.removeAttribute("emailUsuario");
                                    objsesion.removeAttribute("cedulaUsuario");
                                    objsesion.removeAttribute("tipoUsuario");
                                    
                                    //response.sendRedirect("index.jsp");
                                } else {
                                    out.println("Ups, algo salio mal!");
                                }
                            } else {
                                out.println("<center>");
                                out.println("<span style='color: red; font-size: 15px;'>");
                                out.print("Las contraseñas deben ser iguales!");
                                out.println("</span>");
                                out.println("</center>");
                            }
                        }
                    }
                %>
            </div>
        </main>
        <script src="js/nav.js"></script>
    </body>
</html>
