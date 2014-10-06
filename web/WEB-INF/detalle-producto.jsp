<%@page import="Controlador.DataTypes.DataCategoria"%>
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

        <%
            DataEspecificacionProducto producto = (DataEspecificacionProducto) request.getAttribute("producto");
        %>

        <div id="wrapper">

            <div class="container">
                <div class="row" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <h1 class="pull-left">
                                        <i class="icon-star"></i>
                                        <span>Producto - <%= producto.getNombre()%></span>
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
                                                <div class="col-sm-4">
                                                    <div style="width: 140px; height: 140px">
                                                        <div class="carousel slide" id="myCarousel">
                                                            <div class="carousel-inner">
                                                                <div class="active item"><img src="http://placehold.it/140x140&text=1" /></div>
                                                                <div class="item"><img src="http://placehold.it/140x140/143249/fff&text=2" /></div>
                                                                <div class="item"><img src="http://placehold.it/140x140/f34541/fff&text=3" /></div>
                                                            </div>
                                                            <a class="left carousel-control" data-slide="prev" href="#myCarousel">
                                                                <span class="icon-angle-left icon-prev"></span>
                                                            </a>
                                                            <a class="right carousel-control" data-slide="next" href="#myCarousel">
                                                                <span class="icon-angle-right icon-next"></span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <address>
                                                        <strong>Descripcion</strong>
                                                        <br>
                                                        <span><%= producto.getDescripcion()%></span>
                                                        <br>
                                                        <strong>Categorias</strong>
                                                        <br>
                                                        <% for (DataCategoria cat : producto.getCategorias()) {%>
                                                        <span><%= cat.getNombre()%></span>
                                                        <br>
                                                        <% } %>
                                                    </address>
                                                </div>
                                                <div class="col-sm-4">
                                                    <address>
                                                        <strong>Especificaciones</strong>
                                                        <table class="table table-hover table-striped" style="margin-bottom:0;">
                                                            <% for (String keyEsp : producto.getEspecificacion().keySet()) {%>
                                                            <tbody>
                                                                <tr>
                                                                    <td><%= keyEsp%></td>
                                                                    <td><%= producto.getEspecificacion().get(keyEsp)%></td>
                                                                </tr>
                                                            </tbody>
                                                            <% }%>
                                                        </table>
                                                        Ï                                                    </address>
                                                </div>
                                            </fieldset>
                                            <hr class="hr-normal">
                                            <fieldset>
                                                <div class="col-sm-12 recent-activity">
                                                    <div class="box-header">
                                                        <div class="title">
                                                            <i class="icon-comments"></i>
                                                            Comentarios
                                                        </div>
                                                    </div>
                                                    <div class="box-content box-no-padding">
                                                        <ul class="list-unstyled comments list-hover list-striped">
                                                            <li>
                                                                <div class="avatar pull-left">
                                                                    <div class="icon-user"></div>
                                                                </div>
                                                                <div class="body">
                                                                    <div class="name"><a class="text-contrast" href="#">Kellie</a></div>
                                                                    <div class="actions">
                                                                        <a class="btn btn-link ok has-tooltip" title="Approve" href="#"><i class="icon-thumbs-up"></i>
                                                                        </a>

                                                                        <a class="btn btn-link remove has-tooltip" title="Remove" href="#"><i class="icon-thumbs-down"></i>
                                                                        </a>

                                                                    </div>
                                                                    <div class="text">Qui vel omnis quia ea quasi voluptate rerum cum sit. Corporis qui ducimus quidem</div>
                                                                </div>
                                                            </li>
                                                        </ul>
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

