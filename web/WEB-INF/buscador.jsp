<%@page import="controlador.clases.ProxyProducto"%>
<%@page import="java.util.Map"%>
<%@page import="Controlador.DataTypes.DataEspecificacionProducto"%>
<%@page import="java.util.List"%>
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
            Map<String,List<DataEspecificacionProducto>> listaProductos = ProxyProducto.getInstance().buscarProductosSeparados(buscar);
        %>

        <div id="wrapper">

            <div class="container">
                <div class="row" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="page-header page-header-with-buttons">
                            <h1 class="pull-left">
                                <i class="icon-search"></i>
                                <span><%= listaProductos.get("productos").size() + listaProductos.get("categorias").size()%> resultados para "<%= buscar%>"</span>
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
                        RESULTADOS POR PRODUCTO
                        <div class="row pricing-tables">
                            
                            <%
                                    
                                    if (listaProductos.size() > 0) {
                                        for (DataEspecificacionProducto p : listaProductos.get("productos")) {
                                %>
                                <div class="col-xs-6 col-sm-3">
                                    <div class="pricing-table">
                                        <div class="header"><%= p.getNombre() %></div>
                                        <div class="price green-background">
                                            <span>$<%= p.getPrecio()%></span>
                                        </div>
                                        <div>
                                            <img class="img-responsive center-block" src="http://lorempixel.com/140/140/technics/">
                                        </div>
                                        <p class="text-center"><%= p.getDescripcion()%></p>
                                        <div class="footer">
                                            <a class="btn" href="detalle-producto?id=<%= p.getNroReferencia() %>">Ver producto</a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                }
                                 
                                %>
                            </div>
                            <%
                                    
                                    if (listaProductos.size() > 0) {
                                        for (DataEspecificacionProducto p : listaProductos.get("categorias")) {
                                %>
                            <hr>
                            RESULTADOS POR CATEGORIA
                            <div class="row pricing-tables">
                                <div class="col-xs-6 col-sm-3">
                                    <div class="pricing-table">
                                        <div class="header"><%= p.getNombre() %></div>
                                        <div class="price green-background">
                                            <span>$<%= p.getPrecio()%></span>
                                        </div>
                                        <div>
                                            <img class="img-responsive center-block" src="http://lorempixel.com/140/140/technics/">
                                        </div>
                                        <p class="text-center"><%= p.getDescripcion()%></p>
                                        <div class="footer">
                                            <a class="btn" href="detalle-producto?id=<%= p.getNroReferencia() %>">Ver producto</a>
                                        </div>
                                    </div>
                                </div>

                        </div>
                                        <%
                                    }
                                }
                                 
                                %>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/includes/footer.jsp" />

        <jsp:include page="/WEB-INF/includes/javascript.jsp" />

    </body>
</html>

