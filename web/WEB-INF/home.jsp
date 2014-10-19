<%@page import="Controlador.DataTypes.DataEspecificacionProducto"%>
<%@page import="controlador.clases.TreeParser"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <jsp:include page="/WEB-INF/includes/head.jsp"/>

    </head>

    <body class="contrast-red ">

        <jsp:include page="/WEB-INF/includes/header.jsp"/>

        <%!
            public String recorrer(List<TreeParser.NodoCategoria> l, String cat) {
                String arbol = "";
                for (TreeParser.NodoCategoria current : l) {
                    String activo = "";
                    if (current.nombre.equals(cat)) {
                        activo = "active";
                    }
                    if (current.hijos != null && !current.hijos.isEmpty()) {
                        arbol += "<li class=\"" + activo + "\"><a href=\"home?cat=" + current.nombre + "\"><i class=\"icon-folder-open-alt\"></i><span>" + current.nombre + "</span><i class=\"icon-angle-down angle-down\"></i></a>";
                        arbol += "<ul class=\"nav nav-stacked in\">";
                        arbol += recorrer(current.hijos, cat);
                        arbol += "</ul>";
                    } else {
                        arbol += "<li class=\"" + activo + "\"><a href=\"home?cat=" + current.nombre + "\"><i class=\"icon-caret-right\"></i><span>" + current.nombre + "</span></a></li>";
                    }
                }
                return arbol;
            }
        %>

        <div id="wrapper">

            <div id="main-nav-bg"></div>
            <nav id="main-nav">
                <div class="navigation">
                    <ul class="nav nav-stacked">
                        <%
                            List<TreeParser.NodoCategoria> categorias = (List<TreeParser.NodoCategoria>) request.getAttribute("categorias");
                            String cat = (String) request.getAttribute("cat");
                        %>
                        <%= recorrer(categorias, cat)%>
                    </ul>
                </div>
            </nav>

            <section id="content">
                <div class="container">
                    <div class="row" id="content-wrapper">
                        <div class="col-xs-12">
                            <div class="page-header page-header-with-buttons">
                                <h1 class="pull-left">
                                    <i class="icon-home"></i>
                                    <span>Inicio</span>
                                </h1>
                                <div class="pull-right">
                                    <ul class="breadcrumb">
                                        <li>
                                            <a href="home">
                                                <i class="icon-home"></i>
                                                Inicio
                                            </a>
                                        </li>
                                        <% if (cat != null) {%>
                                        <li class="separator">
                                            <i class="icon-angle-right"></i>
                                        </li>
                                        <li class="active"><%= cat%></li>
                                            <% } %>
                                    </ul>
                                </div>
                            </div>
                            <div class="row pricing-tables">
                                <%
                                    List<DataEspecificacionProducto> productos = (List<DataEspecificacionProducto>) request.getAttribute("productos");
                                    if (productos.size() > 0) {
                                        for (DataEspecificacionProducto p : productos) {
                                %>
                                <div class="col-xs-6 col-sm-3">
                                    <div class="pricing-table">
                                        <div class="header"><%= p.getNombre()%></div>
                                        <div class="price green-background">
                                            <span>$<%= p.getPrecio()%></span>
                                        </div>
                                        <%if(!p.getImagenes().isEmpty()){%>
                                            <img class="img-responsive center-block" src="images/<%= p.getImagenes().get(0)%>"/>
                                        <%}else{%> 
                                            <img class="img-responsive center-block" src="http://placehold.it/140x140&text=Foto"/>
                                        <%}%>
                                        <p class="text-center"><%= p.getDescripcion()%></p>
                                        <div class="footer">
                                            <a class="btn btn-primary" href="detalle-producto?id=<%= p.getNroReferencia()%>">Ver producto</a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                } else {
                                    if (cat == null) {
                                %>
                                <div class="col-sm-6 col-sm-offset-3">
                                    <div class="text-center">
                                        <h1>Bienvenido a Direct Market</h1>
                                        <h2>El mejor precio, siempre</h2>
                                        <small class="text-muted">Seleccione una categoria para ver los productos.</small>
                                    </div>
                                </div>   
                                <% } else {%>
                                <div class="col-sm-6 col-sm-offset-3">
                                    <div class="text-center">
                                        <h1>En la categoria <b class="text-success"><%= cat%></b> no hay productos.</h1>
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
            </section>
        </div>

        <jsp:include page="/WEB-INF/includes/footer.jsp" />

        <jsp:include page="/WEB-INF/includes/javascript.jsp" />
     
    </body>
</html>

