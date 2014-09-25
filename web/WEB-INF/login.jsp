<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link href="css/style.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
  </head>

  <body>

    <jsp:include page="/WEB-INF/includes/header.jsp"/>

    <div class="container">

      <div class="col-sm-5 col-sm-offset-4 well">
        <h1 class="text-center title">Iniciar Sesion</h1>
        <form class="form-horizontal" role="form" action="iniciar-sesion" method="POST">
          <div class="form-group has-success">
            <label for="usuario" class="col-sm-2 control-label">Usuario</label>
            <div class="col-sm-10">
              <input type="usuario" name="usuario" class="form-control" id="usuario" placeholder="Usuario">
            </div>
          </div>
          <div class="form-group has-error">
            <label for="clave" class="col-sm-2 control-label">Clave</label>
            <div class="col-sm-10">
              <input type="password" name="clave" class="form-control" id="clave" placeholder="Clave">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="submit" class="btn btn-success">Ingresar</button>
            </div>
          </div>
        </form>
      </div>

    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
