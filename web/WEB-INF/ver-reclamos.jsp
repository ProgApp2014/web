<%-- 
    Document   : VerReclamos
    Created on : 22/11/2014, 11:45:50 PM
    Author     : mauro
--%>
<%@page import="controlador.middleware.DataEspecificacionProducto"%>
<%@page import="controlador.clases.ProxyUsuario"%>
<%@page import="controlador.middleware.DataReclamo"%>
<%@page import="controlador.middleware.DataProveedor"%>
<%@page import="controlador.middleware.DataUsuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="controlador.clases.ProxyProducto"%>
 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="/WEB-INF/includes/head.jsp"/>
        <link href="assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
    </head>
    <body class="contrast-red ">
        
        <jsp:include page="/WEB-INF/includes/header.jsp"/>

        <% 
            DataUsuario usuario;
            usuario = (DataProveedor) request.getAttribute("usuario");
        %>    
        <div id="wrapper">

            <div class="container">
                <div class="row" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-sm-12">        
                                        <h1 class="pull-left">
                                            <i class="icon-bullhorn"></i>
                                            <span>Listado de reclamos</span>
                                        </h1> 
                                                            <%
                                                                String nickname = usuario.getNickname();
                                                                List<DataReclamo> lReclamos = ProxyProducto.getInstance().listarReclamos(nickname);

                                                                if (lReclamos.size() > 0) {
                                                                    for (DataReclamo rec : lReclamos) {
                                                            %>                                
                                            <fieldset>
                                                <div class="col-sm-12">
                                                    <table class="table table-hover table-striped" style="margin-bottom:0;">
                                                        <thead>
                                                            <tr>
                                                                <th>Cliente</th>
                                                                <th>Nombre Producto</th>
                                                                <th>Nro Referencia</th>
                                                                <th>Fecha</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                            <tr>
                                                                <td><%= rec.getCliente().getNickname() %></td>
                                                                <td><%= rec.getEspecificacionProducto().getNombre() %></td>                                                                
                                                                <td><%= rec.getEspecificacionProducto().getNroReferencia() %> </td>
                                                                <td><%= rec.getFecha() %></td>
                                                            </tr>
                                                           <table class="table table-hover table-striped" style="margin-bottom:0;">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Reclamo</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>  
                                                            <tr>
                                                                <td><%= rec.getReclamo() %>
                                                            </tr>
                                                        
                                                            <%
                                                                    }
                                                                } 
                                                                else { 
                                                            %>
                                                            <br/>
                                                            <div class="alert alert-danger" role="alert">
                                                                Actualmente no hay reclamos sobre tus productos.
                                                            </div>                                                               
                                                                   <%} %>
                                                        </tbody>
                                                    </table>
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
