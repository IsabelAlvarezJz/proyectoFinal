<%-- 
    Document   : eliminarCliente
    Created on : 08/03/2022, 10:57:06
    Author     : Familia
--%>
<jsp:useBean id="client" class="com.itq.servicio.ClienteServicio" scope="application"/>
<%    
    String id = request.getParameter("ci").toString();
    client.eliminarCliente(id);    
%>
<jsp:forward page="consultarCliente.jsp" />
