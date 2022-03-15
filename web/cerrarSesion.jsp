<%-- 
    Document   : cerrarSesion
    Created on : 13 mar. 2022, 00:23:40
    Author     : paul.alvarez
--%>
<%
    //limpiar variables de sesion
    HttpSession objsesion = request.getSession(true);
    objsesion.removeAttribute("nombresUsuario");
    objsesion.removeAttribute("emailUsuario");
    objsesion.removeAttribute("cedulaUsuario");
    objsesion.removeAttribute("tipoUsuario");
%>
<jsp:forward page="index.jsp" />
