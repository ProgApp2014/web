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
        
        <script>    
           var xhr = new XMLHttpRequest();
           xhr.open("POST","newuser",true);
           xhr.send();
           
           xhr.onreadystatechange = function(e){
                if(xhr.readyState == 4 && xhr.status == 200)
                    console.info(xhr.responseText)
            }
        </script>
    </body>
</html>
