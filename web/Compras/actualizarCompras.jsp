<%-- 
    Document   : actualizarCompras
    Created on : 13/03/2022, 16:26:32
    Author     : Familia
--%>
<%@page import="java.util.Date"%>
<%@page import="com.itq.model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="compraM" class="com.itq.model.Compras" scope="application"/>
<jsp:useBean id="Scompra" class="com.itq.servicio.CompraServicio" scope="application" />
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

<%
    int id = Integer.parseInt(request.getParameter("compra").toString());
    compraM = Scompra.buscarPorId(id);
    //List< Pago> listaPerfil = pagoS.buscarPago();
    List<Cliente> listaCliente = clienteS.bucarCliente();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Compra</title>
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
                <div class="card-header">
                    <h1>Actualizar Compra</h1>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <table class="table">
                            <tr>
                                <th>Id Compra</th>
                                <th><input type="number" name="idC" class="form-control" value="<%= compraM.getIdCompras()%>"maxlength="10" readonly></th>
                            </tr>
                            <tr>
                                <th>Id Pago</th>
                                <th><input type="number" name="idP" class="form-control" value="<%= compraM.getIdPago()%>" required></th>
                            </tr>
                            <tr>
                                <th>Cedula</th>
                                <th><select name="ced" class="form-control">
                                        <option> -- Seleccione Cliente --</option>
                                        <% for (Cliente cl : listaCliente) {%>
                                        <option value="<%= cl.getCedula()%>"
                                                <%
                                                    if (cl.getCedula().equals(compraM.getCedula())) {
                                                        out.print("selected='selected'");
                                                    }
                                                %>> <%= cl.getNombres()%></option>
                                        <% }%>
                                    </select></th>
                            </tr>
                            <tr>
                                <th>Monto</th>
                                <th><input type="number" name="monto" class="form-control" value="<%= compraM.getMonto()%>" required></th>
                            </tr>
                            <tr>
                                <th>Estado</th>
                                <th><input type="text" name="estado" class="form-control" value="<%= compraM.getEstado()%>"></th>
                            </tr>
                            <tr>
                                <td><input type="submit" name="btnEnviar" value="Actualizar Compra">
                                </td>
                            </tr>                
                        </table>
                </div>
                <div class="card-footer">
                    <center>
                        <a class="btn btn-outline-primary" name="btnGuardar" href="insertarProductos.jsp">
                            Crear Producto
                        </a>
                    </center>
                </div>
            </div>
        </main>
        <script src="../js/nav.js"></script>
    </form>
    <%
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        if (request.getParameter("btnEnviar") != null) {
            compraM.setIdCompras(Integer.parseInt(request.getParameter("idC")));
            compraM.setIdPago(Integer.parseInt(request.getParameter("idP")));
            compraM.setCedula(request.getParameter("ced"));
            Date fecha = new Date();
            compraM.setFechaCompra(fecha);
            compraM.setMonto(Double.parseDouble(request.getParameter("monto")));
            compraM.setEstado(request.getParameter("estado"));
            //cm.setPerfil_tipo(Integer.parseInt(request.getParameter("perfil").toString()));

            if (Scompra.actualizarCompra(compraM)) {
                out.print("Datos actualizados correctamente");
                out.print(compraM);
            } else {
                out.print("No fue posible actualizar datos");
                out.print(compraM);
            }
        }
    %>
</body>
</html>
