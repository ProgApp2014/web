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
                                        <span>Perfil de Usuario</span>
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
                                            <li class="active">Perfil de Usuario</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <form class="form validate-form" method="post" action="registro-usuario" novalidate="novalidate">
                                <div class="col-sm-3 col-lg-2">
                                    <div class="box">
                                        <div class="box-content">
                                            <img class="img-responsive" src="http://placehold.it/230x230&text=Foto"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-9 col-lg-10">
                                    <div class="box">
                                        <div class="box-content box-double-padding">
                                            <fieldset>
                                                <div class="col-sm-6">
                                                    <address>
                                                        <strong>Nickname</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                        <br>
                                                        <strong>E-mail</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                        <br>
                                                        <strong>Tipo Usuario</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                        <br>
                                                        <strong>Nombre Compania</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                    </address>
                                                </div>
                                                <div class="col-sm-6">
                                                    <address>
                                                        <strong>Nombre</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                        <br>
                                                        <strong>Apellido</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                        <br>
                                                        <strong>Fecha Nacimiento</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                        <br>
                                                        <strong>Link Compania</strong>
                                                        <br>
                                                        <span>first.last@example.com</span>
                                                    </address>
                                                </div>
                                            </fieldset>
                                            <hr class="hr-normal">
                                            <fieldset>
                                                <div class="col-sm-12">
                                                    <table class="table table-hover table-striped" style="margin-bottom:0;">
                                                        <thead>
                                                            <tr>
                                                                <th>Nombre</th>
                                                                <th>Descripcion</th>
                                                                <th>Precio</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Hillard Metz</td>
                                                                <td>Hillard Metz</td>
                                                                <td>$50</td>
                                                                <td>
                                                                    <div class="text-right">
                                                                        <a class="btn btn-primary btn-xs" href="#">
                                                                            <i class="icon-search"></i>
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </fieldset>
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
    </body>
</html>

