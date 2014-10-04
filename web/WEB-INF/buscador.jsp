<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <jsp:include page="/WEB-INF/includes/head.jsp"/>

    </head>

    <body class="contrast-red ">

        <jsp:include page="/WEB-INF/includes/header.jsp"/>

        <%
            String buscar = (String) request.getAttribute("buscar");
        %>

        <div id="wrapper">

            <div class="container">
                <div class="row" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="page-header page-header-with-buttons">
                            <h1 class="pull-left">
                                <i class="icon-search"></i>
                                <span>118 resultados para "<%= buscar%>"</span>
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
                                    <li class="active">Buscador</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row pricing-tables">

                            <div class="col-xs-6 col-sm-3">
                                <div class="pricing-table">
                                    <div class="header">Nombre</div>
                                    <div class="price green-background">
                                        <span>$precio</span>
                                    </div>
                                    <div>
                                        <img class="img-responsive center-block" src="http://lorempixel.com/140/140/technics/">
                                    </div>
                                    <p class="text-center">Descripcion</p>
                                    <div class="footer">
                                        <a class="btn" href="detalle-producto?id=">Ver producto</a>
                                    </div>
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

