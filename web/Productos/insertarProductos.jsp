<%-- 
    Document   : insertarProductos
    Created on : 13/03/2022, 15:26:38
    Author     : Familia
--%>

<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="com.itq.model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="producto" class="com.itq.servicio.ProductoServicio" scope="application" />
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
        <title>Agregar nuevo producto</title>
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
            <div class="container"> 
                <br>
                <form enctype="multipart/form-data" >
                    <div class="card-header">
                        <h1>Insertar Producto</h1>

                    </div>
                    <div class="card-body">
                        <table>
                            <tr>
                                <th>Codigo Producto</th>
                                <th><input type="text" class="form-control" name="idP" maxlength="10" required></th>
                            </tr>
                            <tr>
                                <th>Nombre</th>
                                <th><input type="text" class="form-control" name="nomP" required></th>
                            </tr>
                            <tr>
                                <th>Foto</th>
                                <th><input type="file" class="form-control" name="fotoP" required></th>
                            </tr>
                            <tr>
                                <th>Descripcion</th>
                                <th><textarea type="text" class="form-control" name="descP" required></textarea></th>
                            </tr>
                            <tr>
                                <th>Precio</th>
                                <th><input type="number" class="form-control" name="precio" required></th>
                            </tr>
                            <tr>
                                <th>Stock</th>
                                <th><input type="number" class="form-control" name="stock" required></th>
                            </tr>       
                        </table>
                    </div>
                    <div class="card-footer">
                        <center>
                            <input type="submit" class="btn btn-outline-primary" name="btnEnviar" value="Crear Producto"> 
                        </center>
                    </div>


                </form>
                <%
                    Producto pro = new Producto();

                    if (request.getParameter("btnEnviar") != null) {
                        pro.setCodProducto(request.getParameter("idP"));
                        pro.setNombres(request.getParameter("nomP"));
                        pro.setDescripcion(request.getParameter("descP"));
                        pro.setPrecio(Double.parseDouble(request.getParameter("precio")));
                        pro.setStock(Integer.parseInt(request.getParameter("stock")));
                        /*FileItemFactory file = new DiskFileItemFactory();
                        ServletFileUpload fileUpload = new ServletFileUpload(file);
                        List items = fileUpload.parseRequest(request);
                        for (int i = 0; i < items.size(); i++) {
                            FileItem fileItem = (FileItem) items.get(i);
                            if (!fileItem.isFormField()) {
                                File f = new File("C:/xampp/htdocs/img/" + fileItem.getName());
                                fileItem.write(f);
                                pro.setRuta("http://localhost/img/" + fileItem.getName());
                                //out.print("http://localhost/img/" + fileItem.getName());
                            }
                        }*/
                        out.print(request.getParameter("nomP"));
                        pro.setRuta("http://localhost/img/ruffles.jpg");
                        if (producto.insertarProducto(pro)) {
                            out.print("Datos insertados correctamente");
                            out.print(pro);
                        
                        } else {
                            out.print("No fue posible insertar datos");
                            out.print(pro);
                        }
                                               
                    }
                %>

                </body>
                </html>
