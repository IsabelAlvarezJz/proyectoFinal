<%-- 
    Document   : carrito
    Created on : 15 mar. 2022, 08:26:07
    Author     : paul.alvarez
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion = request.getSession(false);
    String usuario = "";
    String email = "";
    String cedula = "";
    int contador = 0;

    if (objsesion.getAttribute("nombresUsuario") == null) {
        response.sendRedirect("index.jsp");
    } else {
        usuario = objsesion.getAttribute("nombresUsuario").toString();
        email = objsesion.getAttribute("emailUsuario").toString();
        cedula = objsesion.getAttribute("cedulaUsuario").toString();
        contador = Integer.parseInt(objsesion.getAttribute("contador").toString());
        if (usuario.equals("")) {
            usuario = "usuario";
            contador = 0;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
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
                                    <a href="ofertas.jsp" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-local-offer material-icons-name" style="font-size: 30px; color: black;"></i><br>
                                        <span style="color: black;">Ofertas</span>
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="Controlador?accion=MisCompras" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-shopping-cart material-icons-name" style="font-size: 30px; color: black;"> 
                                        </i>
                                        <br>
                                        <span style="color: black;">Mis compras</span>
                                    </a>
                                </center>
                                </li>
                                <li>
                                <center>
                                    <a href="Controlador?accion=Carrito" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-shopping-cart material-icons-name" style="font-size: 30px; color: black;"> 
                                        </i>
                                        <br>
                                        <span style="color: red;">( ${contador} )</span>
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
                                    <br>
            <div class="container" style="padding: 10px;">
                <div class="row">
                    <div class="col-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID DETALLE</th>
                                    <th>ID COMPRA</th>
                                    <th>CÓDIGO PRODUCTO</th>
                                    <th>NOMBRES</th>
                                    <th>DESCRIPCIÓN</th>
                                    <th>CANTIDAD</th>
                                    <th>PRECIO COMPRA</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="det" items="${detalle}">
                                    <tr>
                                        <td>${det.getIdDetalle()}</td>
                                        <td>${det.getIdCompras()}</td>
                                        <td>${det.getCodProducto()}
                                        </td>
                                        <td>${det.getNombres()}</td>
                                        <td>${det.getDescripcion()}</td>
                                        <td>${det.getCantidad()}</td>
                                        <td>${det.getPrecioUnitario()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>               
                </div>
            </div>
        </main>
    </body>
</html>
