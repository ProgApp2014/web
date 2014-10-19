<%@page import="controlador.clases.ProxyProducto"%>
<%@page import="java.util.List"%>
<header>
    <nav class="navbar navbar-default">
        <a class="navbar-brand" href="home">
            Direct Market
        </a> 
        <%
            Boolean login = false;
            //session.invalidate(); 
            if (session.getAttribute("usuario_logueado") != null) {
                login = true;
            }
            String carrito = session.getAttribute("carrito") == null ? null : session.getAttribute("carrito").toString();
            String[] items = null;
            if (carrito != null) {
                items = carrito.split(";");
            }
            int listLength = items != null ? items.length : 0;
            if (login) {
                
            Boolean esProveedor;
            if (session.getAttribute("esProveedor") != null && session.getAttribute("esProveedor").toString() == "yes") {
                esProveedor = true;
            } else {
                esProveedor = false;
            }
        %>
        <ul class="nav">
            <% if (!esProveedor) { %>
            <li class="dropdown medium only-icon widget">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="icon-shopping-cart"></i>
                    <div class="label"><%= listLength %></div>
                </a>
                <ul class="dropdown-menu">
                    <%
                        if (items != null) {
                            for (String iter : items) {
                                String[] productoCantidad = iter.split("-");

                    %>
                    <li>
                        <a href="#">
                            <div class="widget-body">
                                <div class="pull-left icon">
                                    <i class="icon-ok text-success"></i>
                                </div>
                                <div class="pull-left text">
                                    <%= ProxyProducto.getInstance().mostrarDatosProducto(productoCantidad[1]).getNombre()%> (<%= productoCantidad[0]%>)
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                        <%
                                }
                            }
                        %>
                    <li class="widget-footer">
                        <a href="carrito">Ver orden</a>
                    </li>
                </ul>
            </li>
            <% } %>
            <li class="dropdown dark user-menu">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <span class="user-name">${usuario_logueado}</span>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="perfil">
                            <i class="icon-user"></i>
                            Perfil
                        </a>
                    </li>
                    <li class="divider"></li>
                        <% if (esProveedor) { %>
                    <li>
                        <a href="registro-producto">
                            <i class="glyphicon glyphicon-list-alt"></i>
                            Publicar producto
                        </a>
                    </li>
                    <li class="divider"></li><% } %>
                    <li>
                        <a href="cerrar-sesion">
                            <i class="icon-signout"></i>
                            Cerrar Sesion
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
        <% } else { %>
        <ul class="nav">
            <li class="dropdown dark user-menu">
                <a class="dropdown-toggle" href="registro-usuario">
                    Registrarse
                </a>
            </li>
            <li class="dropdown dark user-menu">
                <a class="dropdown-toggle" href="#modal-login" role="button" data-toggle="modal">
                    <i class="icon-signin"></i>
                    Iniciar Sesion
                </a>
            </li>
        </ul>
        <% }%>
        <form action="buscador" class="navbar-form navbar-right hidden-xs" method="post">
            <button class="btn btn-link icon-search" name="button" type="submit"></button>
            <div class="form-group">
                <input value="" class="form-control" placeholder="Buscar..." autocomplete="off" name="buscar" type="text" />
            </div>
        </form>
    </nav>

    <!-- modal inisiar sesion -->
    <div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="ModalLogin" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Iniciar Sesion</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger alert-dismissable" id="ErrorMsg" style="display:none"></div>
                    <div class='login-container'>
                        <div class='container'>
                            <div class='row'>
                                <div class='form-group'>
                                    <div class='controls with-icon-over-input'>
                                        <input id="usuInp" value="" placeholder="Usuario" class="form-control" data-rule-required="true" name="email" type="text" />
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <div class='controls with-icon-over-input'>
                                        <input id="pwdInp" value="" placeholder="Password" class="form-control" data-rule-required="true" name="password" type="password" />
                                    </div>
                                </div>
                                <button id="btnIniciar" class='btn btn-block'>Iniciar Sesion</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>