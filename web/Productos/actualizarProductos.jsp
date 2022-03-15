<%-- 
    Document   : actualizarProductos
    Created on : 13/03/2022, 15:36:46
    Author     : Familia
--%>
<%@page import="com.itq.model.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="mP" class="com.itq.model.Producto" scope="application"/>
<jsp:useBean id="sP" class="com.itq.servicio.ProductoServicio" scope="application" />
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
    String id = request.getParameter("codP").toString();
    mP = sP.buscarPorId(id);
    //out.print(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Productos</title>
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
                                    <a href="../Pagos/consultaPagos.jsp" class="nav-link text-secondary">
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
        </header>
        <div class="container"> 
            <br>
            <div class="card-header">
                <% out.println("<h1> Datos del Producto " + mP.getNombres() + "</h1>");%>
            </div>
            <div class="card-body">

                <form class="table" method="POST">
                    <table>
                        <tr>
                            <th><input type="text" name="codP" class="form-control" value="<%= mP.getCodProducto()%>" readonly></th>
                        </tr>
                        <tr>
                            <th>Nombres</th>
                            <th><input type="text" name="nomP" class="form-control" value="<%= mP.getNombres()%>"></th>
                        </tr>
                        <tr>
                            <th>Foto</th>                    
                            <th><input type="file" name="fotoP" class="form-control" value="<%= mP.getRuta()%>"></th>
                        </tr>
                        <tr>
                            <th>Descripcion</th>
                            <th><input type="text" name="descP" class="form-control" value="<%= mP.getDescripcion()%>"></th>
                        </tr>
                        <tr>
                            <th>Precio</th>
                            <th><input type="number" step="0.01" name="precio" class="form-control" value="<%= mP.getPrecio()%>"></th>
                        </tr>
                        <tr>
                            <th>Stock</th>
                            <th><input type="number" name="stock" class="form-control"  value="<%= mP.getStock()%>"></th>
                        </tr>                             
                    </table>
            </div>
            <div class="card-footer">
                <center>
                    <input class="btn btn-outline-primary" type="submit" name="btnEnviar" value="Actualizar Producto" >  
                </center>
            </div>
            </form>
        </div>
    </main>
    <script src="../js/nav.js"></script>
    <%
        if (request.getParameter("btnEnviar") != null) {
            mP.setCodProducto(request.getParameter("codP"));
            mP.setNombres(request.getParameter("nomP"));
            //Implementar carga de foto
            mP.setDescripcion(request.getParameter("descP"));
            mP.setPrecio(Double.parseDouble(request.getParameter("precio")));
            mP.setStock(Integer.parseInt(request.getParameter("stock")));
            mP.setRuta("http://localhost/img/ruffles2.jpg");

            if (sP.actualizarProducto(mP)) {
                out.print("Datos actualizados correctamente");
                //out.print(mP);
            } else {
                out.print("No fue posible actualizar datos");
                //out.print(mP);
            }
        }
    %>
</body>
</html>
