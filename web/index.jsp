<%-- 
    Document   : index
    Created on : 16/09/2014, 09:09:32 PM
    Author     : rodro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <jsp:useBean class="Beans.UsuarioBean" id="usuario" scope="session" type="Beans.UsuarioBean"/>
        <jsp:setProperty name="usuario" property="nombre" value="sape"/>
        
        <%=usuario.getNombre()%>
    </body>
</html>
