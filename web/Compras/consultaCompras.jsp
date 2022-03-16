<%-- 
    Document   : consultaCompras
    Created on : 13/03/2022, 15:53:06
    Author     : Familia
--%>
<%@page import="com.itq.model.Compras"%>
<%@page import="java.util.List"%>
<jsp:useBean id="comp" class="com.itq.servicio.CompraServicio" scope="application"/>
<jsp:useBean id="clienteS" class="com.itq.servicio.ClienteServicio" scope="application" />
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
        <title>Consultar Compras</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">
        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/headers.css" rel="stylesheet">
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
    </head>
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
                                <a href="consultaCompras.jsp" class="nav-link text-secondary">
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
                <h1>Consultar Compras</h1>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Codigo Compra</th>
                            <th>Id Pago</th>
                            <th>Cedula</th> 
                            <th>Fecha de Compra</th>
                            <th>Monto</th>
                            <th>Estado</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <%
                        List<Compras> listaCompras = comp.buscarCompra();
                        for (Compras temp : listaCompras) {
                            out.println("<tr>");
                            out.println("<td>" + temp.getIdCompras() + "</td>");
                            out.println("<td>" + temp.getIdPago() + "</td>");
                            out.println("<td>" + temp.getCedula() + "</td>");
                            out.println("<td>" + temp.getFechaCompra() + "</td>");
                            out.println("<td>" + temp.getMonto() + "</td>");
                            out.println("<td>" + temp.getEstado() + "</td>");
                    %>
                    <td>
                        <a href="actualizarCompras.jsp?compra=<%= temp.getIdCompras()%>">Editar</a>
                    </td>
                    <td>
                        <a href="eliminarCompras.jsp?compra=<%= temp.getIdCompras()%>"
                           onclick="return confirm('Seguro que desea eliminar la Compra?')">Eliminar</a>
                    </td>

                    <%
                            out.println("</tr>");
                        }
                    %>
                </table>
            </div>
                <div class="card-footer" hidden>
                <center>
                    <a class="btn btn-outline-primary" name="btnGuardar" href="insertarCompras.jsp" hidden>
                        Crear Compra
                    </a>
                </center>
            </div>
        </div>
    </main>
    <script src="../js/nav.js"></script>
</body>
</html>
