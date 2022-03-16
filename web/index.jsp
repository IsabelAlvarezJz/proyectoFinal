<%-- 
    Document   : index
    Created on : 12/03/2022, 19:30:30
    Author     : paul.alvarez
--%>
<%@page import="java.security.MessageDigest"%>
<%@page import="com.itq.model.Cliente"%>
<jsp:useBean id="login" class="com.itq.servicio.LoginServicio" scope="application" />
<!DOCTYPE html>
<html lang="en">
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
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure>
                                <img src="images/signin-image.jpg" alt="sing up image">
                            </figure>
                            <a href="registro.jsp" class="signup-image-link">Regístrate</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Tienda Online</h2>
                            <form class="register-form"
                                  id="login-form">
                                <div class="form-group">
                                    <label for="email">
                                        <i class="zmdi zmdi-account material-icons-name"></i>
                                    </label> 
                                    <input type="email" name="email" id="email" placeholder="Correo electrónico" />
                                </div>
                                <div class="form-group" style="color: red;">
                                    <label for="password">
                                        <i class="zmdi zmdi-lock"></i>
                                    </label> 
                                    <input type="password" name="password" id="password" placeholder="Contraseña" />
                                </div>
                                <div class="form-group">
                                    <a href="recuperarClave.jsp" class="signup-image-link">Olvidaste tu contraseña?</a>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" class="form-submit" name="btnLogin" value="Iniciar Sesión" />
                                </div>
                            </form>
                            <%
                                if (request.getParameter("btnLogin") != null) {
                                    String email = request.getParameter("email");
                                    String password = request.getParameter("password");

                                    MessageDigest md = MessageDigest.getInstance("MD5");
                                    md.update(password.getBytes());
                                    byte[] byteData = md.digest();

                                    StringBuilder sb = new StringBuilder(32);
                                    for (byte b : byteData) {
                                        sb.append(String.format("%02x", b & 0xff));
                                    }
                                    Cliente clienteLogin = new Cliente();
                                    clienteLogin = login.autenticacion(email, sb.toString());
                                    if (clienteLogin != null) {
                                        HttpSession objsesion = request.getSession(true);
                                        objsesion.setAttribute("cedulaUsuario", clienteLogin.getCedula());
                                        objsesion.setAttribute("nombresUsuario", clienteLogin.getNombres());
                                        objsesion.setAttribute("direccionUsuario", clienteLogin.getDireccion());
                                        objsesion.setAttribute("emailUsuario", clienteLogin.getEmail());
                                        objsesion.setAttribute("tipoUsuario", clienteLogin.getPerfil_tipo());
                                        objsesion.setAttribute("contador", 0);
                                        
                                        if(clienteLogin.getPerfil_tipo() == 1){
                                            response.sendRedirect("admin.jsp");
                                        } else {
                                            response.sendRedirect("principal.jsp");
                                        }
                                    } else {
                                        out.println("<br>");
                                        out.println("<p style='color: red;'>");
                                        out.println("Ups, usuario no encontrado!!!");
                                        out.println("</p>");
                                    }
                                }
                            %>
                            <div class="social-login">
                                <span class="social-label">Siguenos en nuestras redes sociales:</span>
                                <ul class="socials">
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                    <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>