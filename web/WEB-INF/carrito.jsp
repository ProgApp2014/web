<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <jsp:include page="/WEB-INF/includes/head.jsp"/>

    </head>

    <body class="contrast-red ">

        <jsp:include page="/WEB-INF/includes/header.jsp"/>

        <div id="wrapper">

            <div class="container">
                <div class="row invoice" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="page-header page-header-with-buttons">
                            <h1 class="pull-left">
                                <i class="icon-shopping-cart"></i>
                                <span>Carrito</span>
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
                                    <li class="active">Carrito</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="responsive-table">
                                    <div class="scrollable-area">
                                        <table class="table table-striped table-hover table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Nro Ref</th>
                                                    <th>Nombre</th>
                                                    <th>Descripcion</th>
                                                    <th>Cantidad</th>
                                                    <th>Precio</th>
                                                    <th>Precio total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>AO2</td>
                                                    <td>Facilis est esse dolores</td>
                                                    <td>Facilis est esse dolores Facilis est esse dolores Facilis est esse dolores</td>
                                                    <td>1</td>
                                                    <td>$302.00</td>
                                                    <td>$302.00</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-normal">
                        <div class="row">
                            <div class="col-sm-6">
                                <a class="btn btn-success" href="#"><i class="icon-ok"></i>
                                    Generar orden de compra
                                </a>
                            </div>
                            <div class="col-sm-6">
                                <div class="text-right text-contrast subtotal">
                                    $4,681.00
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/includes/footer.jsp" />

        <jsp:include page="/WEB-INF/includes/javascript.jsp" />

    </body>
</html>

