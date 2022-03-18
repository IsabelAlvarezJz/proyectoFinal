<%-- 
    Document   : principal
    Created on : 12 mar. 2022, 14:12:23
    Author     : paul.alvarez
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.itq.model.Producto"%>
<%@page import="java.util.List"%>
<jsp:useBean id="producto" class="com.itq.servicio.ProductoServicio" scope="application"/>
<%
    HttpSession objsesion = request.getSession(true);
    String usuario = "";
    String email = "";
    String cedula = "";
    int contador = 0;
    
    if(objsesion.getAttribute("nombresUsuario") == null){
        response.sendRedirect("index.jsp");
    } else {
        cedula = objsesion.getAttribute("cedulaUsuario").toString();
        usuario = objsesion.getAttribute("nombresUsuario").toString();
        email = objsesion.getAttribute("emailUsuario").toString();
        contador = Integer.parseInt(objsesion.getAttribute("contador").toString());
        //contador = objsesion
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
                                    <a href="Controlador?accion=MisCompras" class="nav-link text-secondary">
                                        <i class="zmdi zmdi-accounts-list material-icons-name" style="font-size: 30px; color: black;"> 
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
            <div class="container">
                <br>
                <div class="card-header" style="border-radius: 30px;">
                    <h5 style="padding: 5px;">Compra facil con un solo clic</h5>
                </div>
                <div class='card-body' style="background-color: #FFF;">
                    <div class="row">
                        <%
                            List<Producto> listaProducto = producto.bucarProducto();
                            for (Producto temp : listaProducto) {

                        %>
                        <div class="col-3" style="margin-bottom: 20px;">
                            <form method="post">
                                <center>
                                    <div class="card-header" style="border-radius: 1px; background-color: #ecedee;">
                                        <%= temp.getNombres()%>
                                    </div>
                                    <div class='card-body' style="background-color: #FFF;">
                                        <img src="<%= temp.getRuta() %>" alt="alt" width="100" height="100"/>
                                        <br>
                                        <%= temp.getDescripcion()%>
                                        <p> $ <%= temp.getPrecio()%></p>
                                    </div>
                                    <div class='card-footer' style="border-radius: 1px; background-color: #ecedee;">
                                        <a href="Controlador?accion=AgregarCarrito&idProducto=<%= temp.getCodProducto() %>" class="btn btn-outline-primary">
                                            <i class="zmdi zmdi-shopping-cart material-icons-name"></i>
                                        </a>
                                        <a hidden href="Controlador?accion=Comprar&idProducto=<%= temp.getCodProducto() %>" class="btn btn-success">
                                            <i class="zmdi zmdi-money material-icons-name"></i>
                                        </a>
                                    </div>
                                </center>
                            </form>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </main>
        <script src="js/nav.js"></script>
    </body>
</html>
