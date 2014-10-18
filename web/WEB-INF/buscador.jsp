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
            String ordenBusqueda = (String) request.getAttribute("ordenBusqueda");
            Map<String, List<DataEspecificacionProducto>> listaProductos = ProxyProducto.getInstance().buscarProductosSeparados(buscar,ordenBusqueda);
        %>

        <div id="wrapper">

            <div class="container">
                <div class="row" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="page-header page-header-with-buttons">
                            <h1 class="pull-left">
                                <i class="icon-search"></i>
                                <span><%= listaProductos.get("productos").size() + listaProductos.get("categorias").size()%> resultados para "<%= buscar%>"</span>
                                
                                <div class="form-group">
                                    <label>Orden:</label>
                                    <form action="buscador" method="post">
                                        <select class="form-control" data-rule-required="true" id="ordenBusqueda" name="ordenBusqueda" onchange="this.form.submit()">
                                            <option value="nombre" <%if(ordenBusqueda.equals("nombre")){%> selected <%}%>>Nombre</option>
                                            <option value="precio" <%if(ordenBusqueda.equals("precio")){%> selected <%}%>>Precio</option>
                                            <option value="ventas" <%if(ordenBusqueda.equals("ventas")){%> selected <%}%>>Mas vendido</option>
                                        </select>
                                        <input type="hidden" value="<%=buscar%>" name="buscar"/>
                                    </form>
                                </div>
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
                        <%
                            if (listaProductos.get("productos").size() > 0) {
                        %>
                        <h2>Resultados por productos</h2>
                        <div class="row pricing-tables">

                            <%
                                for (DataEspecificacionProducto p : listaProductos.get("productos")) {
                            %>
                            <div class="col-xs-6 col-sm-3">
                                <div class="pricing-table">
                                    <div class="header"><%= p.getNombre()%></div>
                                    <div class="price green-background">
                                        <span>$<%= p.getPrecio()%></span>
                                    </div>
                                    <img class="img-responsive center-block" src="http://lorempixel.com/140/140/technics/"/>
                                    <p class="text-center"><%= p.getDescripcion()%></p>
                                    <div class="footer">
                                        <a class="btn btn-primary" href="detalle-producto?id=<%= p.getNroReferencia()%>">Ver producto</a>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        <% } %>
                        <%                                
                            if (listaProductos.get("categorias").size() > 0) {
                        %>
                        <hr>
                        <h2>Resultados por categoria</h2>
                        <div class="row pricing-tables">
                            <%                                
                                for (DataEspecificacionProducto p : listaProductos.get("categorias")) {
                            %>
                            <div class="col-xs-6 col-sm-3">
                                <div class="pricing-table">
                                    <div class="header"><%= p.getNombre()%></div>
                                    <div class="price green-background">
                                        <span>$<%= p.getPrecio()%></span>
                                    </div>
                                    <img class="img-responsive center-block" src="http://lorempixel.com/140/140/technics/"/>
                                    <p class="text-center"><%= p.getDescripcion()%></p>
                                    <div class="footer">
                                        <a class="btn btn-primary" href="detalle-producto?id=<%= p.getNroReferencia()%>">Ver producto</a>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/includes/footer.jsp" />

        <jsp:include page="/WEB-INF/includes/javascript.jsp" />

    </body>
</html>

