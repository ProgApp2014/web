<%@page import="controlador.clases.TreeParserComentarios"%>
<%@page import="java.util.List"%>
<%@page import="controlador.clases.ProxyProducto"%>
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
            int stockMaximo = producto.getStock();
            String carrito = session.getAttribute("carrito") == null ? null : session.getAttribute("carrito").toString();
            String[] items = null;
            if (carrito != null) {
                items = carrito.split(";");
            }
            if (items != null) {
                for (String iter : items) {
                    String[] productoCantidad = iter.split("-");
                    if (productoCantidad[1].equals(producto.getNroReferencia())) {
                        stockMaximo = stockMaximo - Integer.parseInt(productoCantidad[0]);
                        stockMaximo = stockMaximo < 0 ? 0 : stockMaximo;
                        break;
                    }
                }
            }
        %>
        
        <%!
            public String recorrer(List<TreeParserComentarios.NodoComentario> l) {
                String arbol = "";
                for (TreeParserComentarios.NodoComentario current : l) {
                    if (current.hijos != null && !current.hijos.isEmpty()) {
                        arbol += "<li><a href=\"home?cat=\"><i class=\"icon-folder-open-alt\"></i><span>" + current.id + "</span><i class=\"icon-angle-down angle-down\"></i></a>";
                        arbol += "<ul class=\"nav nav-stacked in\">";
                        arbol += recorrer(current.hijos);
                        arbol += "</ul>";
                    } else {
                        arbol += "<li class=\"\"><a href=\"home?cat=" + current.id + "\"><i class=\"icon-caret-right\"></i><span>" + current.id + "</span></a></li>";
                    }
                }
                return arbol;
            }
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

                            <div class="col-sm-12">
                                <div class="box">
                                    <div class="box-content box-double-padding">
                                        <fieldset>
                                            <div class="col-sm-4">
                                                <div class="col-sm-5">
                                                    <div style="width: 140px; height: 140px;">
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
                                                <%
                                                    if (session.getAttribute("nickname") != null && session.getAttribute("esProveedor") == null) {
                                                        if (stockMaximo > 0) {
                                                %>
                                                <div class="col-sm-7">
                                                    <div class="box">
                                                        <div class="box-content">
                                                            <div class="form-group">
                                                                <label>Cantidad:</label>
                                                                <select class="form-control" data-rule-required="true" id="cantidadProductos" name="quantity">
                                                                    <% for (Integer stock = 1; stock <= stockMaximo; stock++) {%>
                                                                    <option><%= stock%></option>
                                                                    <% }%>
                                                                </select>
                                                                <input type="hidden" name="nroRef" id="nroRef" value="<%= producto.getNroReferencia()%>"/>
                                                                <input type="hidden" name="cliente" id="cliente" value="<%= session.getAttribute("nickname")%>"/>
                                                            </div>
                                                            <button class="btn btn-primary btn-block btn-lg" type="button" id="btnAgregar">
                                                                <i class="icon-plus"></i>
                                                                Agregar al carrito
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                    }
                                                %>
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
                                                </address>
                                            </div>
                                        </fieldset>
                                        <hr class="hr-normal">
                                        <fieldset>
                                            <div class="col-sm-12 recent-activity">
                                                <div class="box-header">
                                                    <div class="title">
                                                        <i class="icon-comment"></i>
                                                        Comentarios
                                                    </div>
                                                </div>
                                                <%
                                                    if (session.getAttribute("nickname") != null && ProxyProducto.getInstance().puedeComentar(session.getAttribute("nickname").toString(), producto.getNroReferencia())) {
                                                %>
                                                <div class="box">
                                                    <div class="box-content">
                                                        <div class="form-group">
                                                            <textarea class="form-control" id="comentarioText" placeholder="Ingresar comentario..." rows="3"></textarea>
                                                        </div>
                                                        <div class="text-right">
                                                            <a class="btn btn-warning" href="#" id="comentarLnk">Comentar</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>
                                                <div class="box">
                                                    <div class="box-content">
                                                        <%
                                                            List<TreeParserComentarios.NodoComentario> comentarios = (List<TreeParserComentarios.NodoComentario>) request.getAttribute("comentarios");
                                                        %>
                                                        <%= recorrer(comentarios)%>
                                                        <!--<ul class="list-unstyled comments">
                                                            <li class="comentario-padre">
                                                                <div class="name"><a class="text-contrast" href="#">Kellie</a></div>
                                                                <div class="text">Qui vel omnis quia ea quasi voluptate rerum cum sit. Corporis qui ducimus quidem</div>
                                                            </li>
                                                            <li class="comentario-hijo">
                                                                <div class="name"><a class="text-contrast" href="#">Kellie</a></div>
                                                                <div class="text">Qui vel omnis quia ea quasi voluptate rerum cum sit. Corporis qui ducimus quidem</div>
                                                            </li>
                                                            <li class="comentario-hijo">
                                                                <div class="name"><a class="text-contrast" href="#">Kellie</a></div>
                                                                <div class="text">Qui vel omnis quia ea quasi voluptate rerum cum sit. Corporis qui ducimus quidem</div>
                                                            </li>
                                                            <li class="comentario-hijo">
                                                        <div class="form-group">
                                                            <textarea class="form-control" id="inputTextArea1" placeholder="Ingresar respuesta..." rows="3"></textarea>
                                                        </div>
                                                        <div class="text-right">
                                                            <a class="btn btn-primary" href="#">Responder</a>
                                                        </div>
                                                            </li>
                                                        </ul>-->
                                                    </div>  
                                                </div>
                                            </div>
                                        </fieldset>
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

