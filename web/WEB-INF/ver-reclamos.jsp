<%@page import="controlador.clases.Utils"%>
<%@page import="controlador.middleware.DataEspecificacionProducto"%>
<%@page import="controlador.clases.ProxyUsuario"%>
<%@page import="controlador.middleware.DataReclamo"%>
<%@page import="controlador.middleware.DataProveedor"%>
<%@page import="controlador.middleware.DataUsuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="controlador.clases.ProxyProducto"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <jsp:include page="/WEB-INF/includes/head.jsp"/>

    </head>

    <body class="contrast-red ">

        <jsp:include page="/WEB-INF/includes/header.jsp"/>
        
        <% 
            DataUsuario usuario;
            usuario = (DataProveedor) request.getAttribute("usuario");
        %>  

        <div id="wrapper">

            <div class="container">
                <div class="row invoice" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="page-header page-header-with-buttons">
                            <h1 class="pull-left">
                                <i class="icon-bullhorn"></i>
                                <span>Listado de reclamos</span>
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
                                    <li class="active">Listado de reclamos</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="row recent-activity">
                                  <div class="col-sm-12">
                                    <div class="box">
                                      <div class="box-content box-no-padding">
                                        <div class="tab-content">
                                          <div class="tab-pane fade active in" id="comments">
                                            <ul class="list-unstyled comments list-hover list-striped">
                                                <%
                                                    String nickname = usuario.getNickname();
                                                    List<DataReclamo> lReclamos = ProxyProducto.getInstance().listarReclamos(nickname);

                                                    if (lReclamos.size() > 0) {
                                                        for (DataReclamo rec : lReclamos) {
                                                %>
                                              <li>
                                                <div class="avatar pull-left">
                                                  <div class="icon-user"></div>
                                                </div>
                                                <div class="body">
                                                    <div class="name"><a class="badge badge-info" href="detalle-producto?id=<%= rec.getEspecificacionProducto().getNroReferencia() %>">#<%= rec.getEspecificacionProducto().getNroReferencia() %> <%= rec.getEspecificacionProducto().getNombre() %></a> <a class="text-contrast" href="#"><%= rec.getCliente().getNickname() %></a></div>
                                                  <div class="text"><%= rec.getReclamo() %></div>
                                                </div>
                                                <div class="text-right">
                                                  <small class="date text-muted">
                                                    <span class="timeago fade has-tooltip in" data-placement="top" title="<%= Utils.getFechaNacFormateada(rec.getFecha()) %>"><%= Utils.getFechaNacFormateada(rec.getFecha()) %></span>
                                                    <i class="icon-time"></i>
                                                  </small>
                                                </div>
                                              </li>
                                                <%
                                                        }
                                                    }  else { 
                                                %>
                                                <li> Actualmente no hay reclamos sobre tus productos. </li>                                                             
                                                <%} %>
                                            </ul>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
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

