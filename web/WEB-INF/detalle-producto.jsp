<%@page import="Controlador.DataTypes.DataEspecificacionProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="assets/stylesheets/plugins/select2/select2.css" media="all" rel="stylesheet" type="text/css" />
        <jsp:include page="/WEB-INF/includes/head.jsp"/>
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
                                        <i class="icon-star"></i>
                                        <span>Producto</span>
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
                                            <li class="active">Detalle Producto</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <form class="form validate-form" method="post" action="registro-producto" novalidate="novalidate">
                                <div class="col-sm-12">
                                    <div class="box">
                                        <div class="box-content box-double-padding">
                                            <fieldset>
                                                <div class="col-sm-6">
                                                    
                                                </div>
                                                <div class="col-sm-6">
                                                    
                                                </div>
                                            </fieldset>
                                            <hr class="hr-normal">
                                            <fieldset>
                                                <div class="col-sm-4">
                                                    <div class="box-content">
                                                        <img class="img-responsive center-block" src="http://placehold.it/140x140&text=Foto" id="preview1"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="box-content">
                                                        <img class="img-responsive center-block" src="http://placehold.it/140x140&text=Foto" id="preview2"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="box-content">
                                                        <img class="img-responsive center-block" src="http://placehold.it/140x140&text=Foto" id="preview3"/>
                                                    </div>
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

