<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Direct Market</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/500.css" rel="stylesheet">
    </head>
    <body>
        <div class="container jumbotron">
            <div class="row">
              <div class="span12">
                <div class="center">
                    <h1>Page Not Found <small><font face="Tahoma" color="red">Error 500</font></small></h1>
                    <br />
                    <p>
                        <b><%= exception.getClass().getName() %>:</b> <%= exception.getMessage() %><br/>
                        <%= exception.getCause() %><br/>
                        <% for(StackTraceElement ste: exception.getStackTrace()){ %>
                        <small><%= ste.toString() %></small><br/>
                        <% } %>
                    </p>
                    <a href="home" class="btn btn-large btn-info"><i class="icon-home icon-white"></i> Take Me Home</a>
                  </div>
              </div>
            </div>
        </div>
    </body>
</html>
