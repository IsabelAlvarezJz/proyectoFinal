<%-- 
    Document   : eliminarCompras
    Created on : 13/03/2022, 16:51:18
    Author     : Familia
--%>
<jsp:useBean id="c" class="com.itq.servicio.CompraServicio" scope="application"/>
<%
    
    int id = Integer.parseInt(request.getParameter("compra").toString());
    c.eliminarCompra(id);
    
%>
<jsp:forward page="consultaCompras.jsp" />
