<%-- 
    Document   : eliminarPago
    Created on : 14/03/2022, 18:21:30
    Author     : Familia
--%>
<jsp:useBean id="pgo" class="com.itq.servicio.PagoServicio" scope="application"/>
<%
    
    int id = Integer.parseInt(request.getParameter("pago").toString());
    pgo.eliminarPago(id);
    
%>
<jsp:forward page="consultaPago.jsp" />

