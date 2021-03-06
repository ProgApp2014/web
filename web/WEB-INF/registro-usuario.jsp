<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/includes/head.jsp"/>
        <link href="assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
    </head>

    <body class="contrast-red ">

        <jsp:include page="/WEB-INF/includes/header.jsp"/>

        <div id="wrapper">

            <div class="container">
                <div class="row" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <h1 class="pull-left">
                                        <i class="icon-user"></i>
                                        <span>Registro de Usuario</span>
                                    </h1>
                                    <div class="pull-right">
                                        <ul class="breadcrumb">
                                            <li>
                                                <a href="home">
                                                    <i class="icon-home"></i>
                                                    Inicio
                                                </a>
                                            </li>
                                            <li class="separator">
                                                <i class="icon-angle-right"></i>
                                            </li>
                                            <li class="active">Registro de Usuario</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <form class="form validate-form" method="post" enctype="multipart/form-data" action="registro-usuario" novalidate="novalidate" id="form-registrar">
                                <div class="col-sm-3 col-lg-2">
                                    <div class="box">
                                        <div class="box-content">
                                            <img class="img-responsive" src="http://placehold.it/230x230&text=Foto" id="preview"/>
                                        </div>
                                        <div class="box-content text-center">
                                            <input title="Seleccionar foto" type="file" name="imagen" id="imagen">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-9 col-lg-10">
                                    <div class="box">
                                        <div class="box-content box-double-padding">
                                            <fieldset>
                                                <div class="col-sm-4">
                                                    <div class="lead">
                                                        <i class="icon-signin text-contrast"></i>
                                                        Datos de Usuario
                                                    </div>
                                                </div>
                                                <div class="col-sm-7 col-sm-offset-1">
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" name="nickname" id="nickname" placeholder="Nickname" type="text" onblur="validarNickname()">
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-email="true" data-rule-required="true" name="email" id="email"  placeholder="E-mail" type="text" onblur="validarEmail()">
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" name="password" id="password" placeholder="Password" type="password">
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" data-rule-equalto="#password" name="confirmar_password" placeholder="Confirmar password" type="password">
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <hr class="hr-normal">
                                            <fieldset>
                                                <div class="col-sm-4">
                                                    <div class="lead">
                                                        <i class="icon-user text-contrast"></i>
                                                        Informacion Personal
                                                    </div>
                                                </div>
                                                <div class="col-sm-7 col-sm-offset-1">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input data-target="#tipo-proveedor" data-toggle="collapse" name="proveedor" type="checkbox" value="proveedor">
                                                                    Eres un proveedor?
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="collapse" id="tipo-proveedor">
                                                        <div class="form-group">
                                                            <input class="form-control" name="nombre_compania" placeholder="Nombre Compania" type="text">
                                                        </div>
                                                        <div class="form-group">
                                                            <input class="form-control" name="link_compania" placeholder="Link Compania" type="url">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" name="nombre" placeholder="Nombre" type="text">
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" name="apellido" placeholder="Apellido" type="text">
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="datepicker input-group">
                                                            <input class="form-control" data-format="yyyy-MM-dd" data-rule-required="true" placeholder="Fecha nacimiento" type="text" name="fecha_nacimiento">
                                                            <span class="input-group-addon">
                                                                <span data-date-icon="icon-calendar" data-time-icon="icon-time"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="form-actions form-actions-padding" style="margin-bottom: 0;">
                                                <div class="text-right">
                                                    <a class="btn" href="home">
                                                        Cancelar
                                                    </a>
                                                    <button class="btn btn-primary" type="button" id="btnGuardarPerfil">
                                                        <i class="icon-save"></i>
                                                        Guardar
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/includes/footer.jsp" />

        <jsp:include page="/WEB-INF/includes/javascript.jsp" />
        <script src="assets/javascripts/plugins/fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/validate/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/validate/additional-methods.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/validate/validate_messages_es.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#imagen').on('change', function () {
                    var image = document.getElementById("imagen").files[0];
                    oFReader = new FileReader();
                    oFReader.readAsDataURL(image);
                    document.getElementById("preview").src = '';
                    oFReader.onload = function (oFREvent) {
                        document.getElementById("preview").src = oFREvent.target.result;
                    }
                });
                
                $('#btnGuardarPerfil').on('click', function(){
                    if($('#form-registrar').valid()){
                        $('#form-registrar').submit();
                    }
                });
            });

            function validarNickname() {
                var xhr = new XMLHttpRequest();
                var nickname = document.getElementById("nickname").value;
                xhr.open("POST", "/ProgWeb/validar-usuario", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("nickname=" + nickname);

                xhr.onreadystatechange = function (e) {
                    if(xhr.readyState === 4){
                        if (xhr.status !== 200){
                            document.getElementById("nickname").value = '';
                            alert('El nickname ya esta en uso, ingrese uno nuevo.');
                        }
                    }
                };
            }
            
            function validarEmail() {
                var xhr = new XMLHttpRequest();
                var email = document.getElementById("email").value;
                xhr.open("POST", "/ProgWeb/validar-usuario", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("email=" + email);

                xhr.onreadystatechange = function (e) {
                    if(xhr.readyState === 4){
                        if (xhr.status !== 200){
                            document.getElementById("email").value = '';
                            alert('El email ya esta en uso, ingrese uno nuevo.');
                        }
                    }
                };
            }
        </script>
    </body>
</html>

