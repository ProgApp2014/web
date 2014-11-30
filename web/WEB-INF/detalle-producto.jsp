<%@page import="controlador.middleware.DataEspecificacion"%>
<%@page import="controlador.middleware.DataCategoria"%>
<%@page import="controlador.middleware.DataEspecificacionProducto"%>
<%@page import="java.util.Iterator"%>
<%@page import="controlador.clases.TreeParserComentarios"%>
<%@page import="java.util.List"%>
<%@page import="controlador.clases.ProxyProducto"%> 
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

            Boolean esCliente;
            if (session.getAttribute("esCliente") != null && session.getAttribute("esCliente").toString() == "yes") {
                esCliente = true;
            } else {
                esCliente = false;
            }
        %>

        <%!
            public String recorrer(List<TreeParserComentarios.NodoComentario> l, Boolean puedeResponder) {
                String arbol = "";
                for (TreeParserComentarios.NodoComentario current : l) {
                    if (current.hijos != null && !current.hijos.isEmpty()) {
                        arbol += "<li class=\"comentario\">";
                        arbol += "<div class=\"name\"><a class=\"text-contrast\" href=\"#\">" + current.cliente.getNombre() + " " + current.cliente.getApellido() + "</a></div>";
                        arbol += "<div class=\"text\">" + current.comentario.toString() + "</div>";
                        arbol += "</li>";
                        arbol += "<ul class=\"list-unstyled comments comentario-hijo\">";
                        arbol += recorrer(current.hijos, puedeResponder);
                        arbol += "</ul>";
                    } else {
                        arbol += "<li class=\"comentario\">";
                        arbol += "<div class=\"name\"><a class=\"text-contrast\" href=\"#\">" + current.cliente.getNombre() + " " + current.cliente.getApellido() + "</a></div>";
                        arbol += "<div class=\"text\">" + current.comentario.toString() + "</div>";
                        arbol += "</li>";
                        arbol += "<ul class=\"list-unstyled comments comentario-hijo\">";
                        arbol += "<li>";
                        if (puedeResponder) {
                            arbol += "<div class=\"form-group\">";
                            arbol += "<textarea class=\"form-control\" style=\"display:none\" id=\"comentarioText" + current.id + "\" placeholder=\"Ingresar respuesta...\" rows=\"3\"></textarea>";
                            arbol += "</div>";
                            arbol += "<div class=\"text-right\">";
                            arbol += "<div class=\"btn btn-primary\" onclick=\"responderComentario(" + current.id + ")\">Responder</div>";
                            arbol += "</div>";
                            arbol += "</li>";
                        }
                        arbol += "</ul><hr class=\"hr-normal\">";
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
                                            <div class="col-sm-3">
                                                <div class="col-sm-5">
                                                    <div style="width: 140px; height: 140px;">
                                                        <div class="carousel slide" id="myCarousel">
                                                            <div class="carousel-inner">
                                                                <%
                                                                    if (!producto.getImagenes().isEmpty()) {
                                                                        Iterator it = producto.getImagenes().iterator();

                                                                        String isActive = "active";
                                                                        while (it.hasNext()) {

                                                                            String s = (String) it.next();
                                                                %>

                                                                <div class="<%=isActive%> item"><img width="140" height="140" src="images/<%=s%>" /></div> 
                                                                    <% isActive = "";
                                                                        }
                                                                    } else {%> 
                                                                <img class="img-responsive center-block" width="140" height="140" src="http://placehold.it/140x140&text=Foto"/>
                                                                <%}%>

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
                                                    if (esCliente) {
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
                                            <div class="col-sm-2">
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
                                            <div class="col-sm-3">
                                                <address>
                                                    <strong>Especificaciones</strong>
                                                    <table class="table table-hover table-striped" style="margin-bottom:0;">
                                                        <% for (DataEspecificacion dep : producto.getEspecificacion()) {%>
                                                        <tbody>
                                                            <tr>
                                                                <td><%= dep.getKey()%></td>
                                                                <td><%= dep.getValue()%></td>
                                                            </tr>
                                                        </tbody>
                                                        <% }%>
                                                    </table>
                                                </address>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="col-sm-6">
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-success" style="width:70%;">5 estrellas</div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-primary" style="width:20%;">4 estrellas</div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-info" style="width:10%;">3 estrellas</div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-warning" style="width:40%;">2 estrellas</div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-danger" style="width:40%;">1 estrella</div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="text-center">
                                                        <strong>Puntaje Promedio</strong>
                                                        <h1>4.5</h1>
                                                    </div>
                                                    <hr style="margin-bottom: 0px;">
                                                    <form>
                                                        <input id="rating-input" type="number" data-container-class='text-center'/>
                                                        <div class="form-group text-right" style="margin-top: 5px;">
                                                            <a class="btn btn-primary" id="puntuarLnk">Puntuar</a>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </fieldset>
                                        
                                        <%
                                            Boolean puedeComentar = false;
                                            if (esCliente && ProxyProducto.getInstance().puedeComentar(session.getAttribute("nickname").toString(), producto.getNroReferencia())) {
                                                puedeComentar = true;
                                        %>
                                        <hr class="hr-normal">
                                        <fieldset>
                                            <div class="col-sm-12 recent-activity">
                                                <div class="box-header">
                                                    <div class="title">
                                                        <i class="icon-comment"></i>
                                                        Comentar
                                                    </div>
                                                </div>
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
                                            </div>
                                        </fieldset>
                                        <% }%>
                                        
                                        <%
                                            List<TreeParserComentarios.NodoComentario> comentarios = (List<TreeParserComentarios.NodoComentario>) request.getAttribute("comentarios");
                                            if (comentarios.size() > 0) {
                                        %>
                                        <hr class="hr-normal">
                                        <fieldset>
                                            <div class="col-sm-12 recent-activity">
                                                <div class="box-header">
                                                    <div class="title">
                                                        <i class="icon-comments"></i>
                                                        Comentarios
                                                    </div>
                                                </div>
                                                <div class="box">
                                                    <div class="box-content">
                                                        <ul class="list-unstyled comments">
                                                            <%= recorrer(comentarios, puedeComentar)%>
                                                        </ul>
                                                    </div>  
                                                </div>
                                            </div>
                                        </fieldset>
                                        <% }%>
                                        
                                        <%
                                            Boolean puedeReclamar = false;
                                            if (esCliente && ProxyProducto.getInstance().puedeReclamar(session.getAttribute("nickname").toString(), producto.getNroReferencia())) {
                                                puedeReclamar = true;
                                            }
                                            
                                            if (puedeReclamar) {
                                        %>
                                        <hr class="hr-normal">
                                        <fieldset>
                                            <div class="col-sm-12 recent-activity">
                                                <div class="box-header">
                                                    <div class="title">
                                                        <i class="glyphicon glyphicon-bullhorn"></i>
                                                        Reclamar
                                                    </div>
                                                </div>
                                                <div class="box">
                                                    <div class="box-content">
                                                        <div class="form-group">
                                                            <textarea class="form-control" id="reclamoText" placeholder="Ingresar reclamo..." rows="3"></textarea>
                                                        </div>
                                                        <div class="text-right">
                                                            <a class="btn btn-warning" href="#" id="reclamarLnk">Reclamar</a>
                                                        </div>                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <% } %>
                                        
                                        <input type="hidden" name="nroRef" id="nroRef" value="<%= producto.getNroReferencia()%>"/>
                                        <input type="hidden" name="cliente" id="cliente" value="<%= session.getAttribute("nickname")%>"/>
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
        <link href="assets/stylesheets/star-rating.css" media="all" rel="stylesheet" type="text/css" />
        <script src="assets/javascripts/star-rating.js" type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                $('#rating-input').rating({
                    min: 0,
                    max: 5,
                    step: 1,
                    size: 'xs',
                    showClear : false,
                    showCaption : false,
                });
            });
            
            $("#puntuarLnk").click(function () {
                if($('#rating-input').val() == 0){
                    alert("Debe seleccionar un puntaje");
                }else{
                    var formData = {puntaje: $('#rating-input').val(), nroRef: $("#nroRef").val(), cliente: $("#cliente").val()}; //Array

                    $.ajax({
                        url: "detalle-producto",
                        type: "POST",
                        data: formData,
                        success: function (result)
                        {
                            window.location.href = "/ProgWeb/detalle-producto?id="+$("#nroRef").val();
                        }
                    });
                }
            });
        </script>

    </body>
</html>

