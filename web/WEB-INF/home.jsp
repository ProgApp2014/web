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
                        arbol += "<li><a class=\"dropdown-collapse\" href=\"#\"><span>" + current.nombre + "</span><i class=\"icon-angle-down angle-down\"></i></a>";
                        arbol += "<ul class=\"nav nav-stacked\">";
                        arbol += recorrer(current.hijos, cat);
                        arbol += "</ul>";
                    } else {
                        arbol += "<li class=\"" + activo + "\"><a href=\"home?cat=" + current.nombre + "\"><span>" + current.nombre + "</span></a></li>";
                    }
                }
                return arbol;
            }
        %>

        <div id="wrapper">

            <div id="main-nav-bg"></div>
            <nav id="main-nav">
                <div class="navigation">
                    <div class="search">
                        <form action="search" method="get">
                            <div class="search-wrapper">
                                <input value="" class="search-query form-control" placeholder="Search..." autocomplete="off" name="q" type="text" />
                                <button class="btn btn-link icon-search" name="button" type="submit"></button>
                            </div>
                        </form>
                    </div>
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
                            </div>
                            <div class="row pricing-tables">
                                <%
                                    List<DataEspecificacionProducto> productos = (List<DataEspecificacionProducto>) request.getAttribute("productos");
                                    for (DataEspecificacionProducto p : productos) {
                                %>
                                <div class="col-xs-6 col-sm-3">
                                    <div class="pricing-table">
                                        <div class="header"><%= p.getNombre()%></div>
                                        <div class="price green-background">
                                            <span>$<%= p.getPrecio()%></span>
                                        </div>
                                        <div>
                                            <img class="img-responsive center-block" src="http://lorempixel.com/140/140/technics/">
                                        </div>
                                        <p class="text-center"><%= p.getDescripcion()%></p>
                                    </div>
                                </div>
                                <% }%>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="/WEB-INF/includes/footer.jsp" />

                </div>
            </section>
        </div>

        <jsp:include page="/WEB-INF/includes/javascript.jsp" />

    </body>
</html>

