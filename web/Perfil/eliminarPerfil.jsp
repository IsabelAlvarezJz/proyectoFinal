<%-- 
    Document   : eliminarCliente
    Created on : 08/03/2022, 10:57:06
    Author     : Familia
--%>
<jsp:useBean id="perfil" class="com.itq.servicio.PerfilServicio" scope="application"/>
<%
    
    int id = Integer.parseInt(request.getParameter("id").toString());
    perfil.eliminarPerfil(id);
    
%>
<jsp:forward page="consultarPerfil.jsp" />
