<%-- 
    Document   : eliminarProductos
    Created on : 13/03/2022, 15:51:05
    Author     : Familia
--%>
<jsp:useBean id="pr" class="com.itq.servicio.ProductoServicio" scope="application"/>
<%    
    String id = request.getParameter("codP").toString();
    pr.eliminarProducto(id);    
%>

<jsp:forward page="consultaProductos.jsp"/>

