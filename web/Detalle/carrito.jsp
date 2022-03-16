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
                    <div class="col-8">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ITEM</th>
                                    <th>NOMBRE</th>
                                    <th>DESCRIPCIÓN</th>
                                    <th>PRECIO</th>
                                    <th>CANTIDAD</th>
                                    <th>SUBTOTAL</th>
                                    <th hidden>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="car" items="${carrito}">
                                    <tr>
                                        <td>${car.getItem()}</td>
                                        <td>${car.getNombres()}</td>
                                        <td>${car.getDescripcion()}
                                        </td>
                                        <td>${car.getPrecioCompra()}</td>
                                        <td>
                                            <input type="hidden" id="idpro" value="${car.getIdProducto()}">
                                            ${car.getCantidad()}
                                        </td>
                                        <td>${car.getSubTotal()}</td>
                                        <td hidden>
                                            <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                            <a href="Controlador?accion=EliminarItem&idProducto=${car.getIdProducto()}" id="btnDelete" class="btn btn-danger">
                                                <i class="zmdi zmdi-minus material-icons-name"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-4">                    
                        <div class="card">
                            <div class="card-header">
                                <h6>Detalle de Compra</h6>
                            </div>
                            <div class="card-body">
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-6">
                                        SubTotal:
                                    </div>
                                    <div class="col-6">
                                        <input type="text" value="$ ${subtotal}0" readonly="" class="form-control"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-6">
                                        IVA (12%):
                                    </div>
                                    <div class="col-6">
                                        <input type="text" value="$ ${iva}0" readonly="" class="form-control"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-6">
                                        Total a Pagar:
                                    </div>
                                    <div class="col-6">
                                        <input type="text" value="$ ${totalPagar}0" readonly="" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <h6>Realizar el Pago</h6>
                                <form action="Controlador?accion=GenerarCompra" method="post">
                                    <div class="input-group mb-3" hidden>                        
                                        <input type="text" class="form-control" name="cardName" placeholder="Nombre de Tarjeta">
                                    </div>
                                    <div class="input-group mb-3" hidden>                        
                                        <input type="number" maxlength="16" class="form-control" name="cardNumber" placeholder="Número de Tarjeta">
                                    </div>
                                    <div class="row">
                                        <div class="col-6" hidden>
                                            <input type="text" class="form-control" name="cardDate" placeholder="MM/YY">
                                        </div>
                                        <div class="col-6" hidden>
                                            <input type="password" maxlength="3" class="form-control" name="cardCode" placeholder="CVV">
                                        </div>
                                    </div>
                                    <br>
                                    <center>
                                        <input type="submit" class="btn btn-success btn-block" value="Realizar Pago"/>
                                    </center>                                
                                </form>
                            </div>
                        </div>
                    </div>                
                </div>
            </div>
        </main>
    </body>
</html>
