<%-- 
    Document   : registro
    Created on : 12/03/2022, 19:30:30
    Author     : paul.alvarez
--%>
<%@page import="java.security.MessageDigest"%>
<%@page import="com.itq.model.Cliente"%>
<jsp:useBean id="login" class="com.itq.servicio.LoginServicio" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Proyecto Final - Ambientes Computacionales</title>
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <p class="form-title" style="font-size: 20px; font-weight: bold; color: #000">Registrar Usuario</p>

                            <form class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="cedula">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="text" name="cedula" id="cedula" placeholder="Cédula" />
                                </div>

                                <div class="form-group">
                                    <label for="nombres">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="text" name="nombres" id="nombres" placeholder="Nombres" />
                                </div>
                                <div class="form-group">
                                    <label for="direccion">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="text" name="direccion" id="direccion" placeholder="Dirección"/>
                                </div>
                                <div class="form-group">
                                    <label for="email">
                                        <i class="zmdi zmdi-email"></i>
                                    </label> 
                                    <input type="email" name="email" id="email" placeholder="Correo electrónico" />
                                </div>
                                <div class="form-group">
                                    <label for="password">
                                        <i class="zmdi zmdi-lock"></i>
                                    </label> 
                                    <input type="password" name="password" id="password" placeholder="Contraseña" />
                                </div>
                                <div class="form-group" hidden>
                                    <label for="tipo">
                                        <i class="zmdi zmdi-lock"></i>
                                    </label> 
                                    <input type="number" name="tipo" id="tipo" placeholder="Tipo Perfil" value="2"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="btnRegistro" id="signup" class="form-submit" value="Registrar" />
                                </div>
                            </form>
                            <%
                                if (request.getParameter("btnRegistro") != null) {
                                    String cedula = request.getParameter("cedula");
                                    String nombres = request.getParameter("nombres");
                                    String direccion = request.getParameter("direccion");
                                    String email = request.getParameter("email");
                                    String password = request.getParameter("password");
                                    
                                    MessageDigest md = MessageDigest.getInstance("MD5");
                                    md.update(password.getBytes());
                                    byte[] byteData = md.digest();

                                    StringBuilder sb = new StringBuilder(32);
                                    for (byte b : byteData) {
                                        sb.append(String.format("%02x", b & 0xff));
                                    }
                                    int perfilTipo = Integer.parseInt(request.getParameter("tipo"));
                                    if (login.registrar(cedula, nombres, direccion, email, String.valueOf(sb), perfilTipo)) {
                                        HttpSession objsesion = request.getSession(true);
                                        objsesion.setAttribute("cedulaUsuario", cedula);
                                        objsesion.setAttribute("nombresUsuario", nombres);
                                        objsesion.setAttribute("direccionUsuario", direccion);
                                        objsesion.setAttribute("emailUsuario", email);
                                        objsesion.setAttribute("tipoUsuario", perfilTipo);
                                        response.sendRedirect("principal.jsp");
                                    } else {
                                        out.println("Ups, algo salio mal!");
                                    }
                                }
                            %>
                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="images/signup-image.jpg" alt="sing up image">
                            </figure>
                            <a href="index.jsp" class="signup-image-link">Ya tengo cuenta</a>
                        </div>
                    </div>
                </div>
            </section>


        </div>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>



    </body>
    <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>