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
  </head>

  <body>

    <jsp:include page="includes/header.jsp"/>

    <div class="container">
        
        <div class="row">
            <form class="form form-horizontal validate-form" action="" method="post" enctype="multipart/form-data">
              <div class="col-sm-3 col-lg-2">
                <div class="box">
                  <div class="box-content">
                    <img class="img-responsive" src="http://placehold.it/230x230&amp;text=Imagen" id="preview" width="230" height="230">
                  </div>        
                </div>
              </div>
              <div class="col-sm-9 col-lg-10">
                <div class="box">
                  <div class="box-content">
                    <div class="form-group">
                      <label class="control-label col-sm-3 col-sm-3" for="nombre">Nombre</label>
                      <div class="col-sm-6 controls">
                        <input class="form-control" data-rule-required="true" id="nombre" name="nombre" placeholder="Nombre" type="text">
                      </div>
                    </div>          
                    <div class='form-group'>
                      <label class="control-label col-sm-3 col-sm-3" for="bio">Bio</label>
                      <div class="col-sm-6 controls">
                        <textarea class='form-control' data-rule-required="true" name="bio" id='bio' placeholder='Bio' rows='3'></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-3"></label>
                      <div class="col-sm-6 controls">
                        <input title="Subir Imagen" type="file" accept="image/*" name="foto" id="foto" data-rule-required="true">
                      </div>
                    </div>
                    <div class="form-actions">
                      <div class="row">
                        <div class="col-sm-9 col-sm-offset-3">
                          <button class="btn btn-primary" type="submit">
                            <i class="icon-save"></i> Guardar
                          </button>
                          <a class="btn" href="/">Cancelar</a>
                        </div>
                      </div>
                    </div>
                  </div>
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
