 
<%@page import="Controlador.DataTypes.DataEspecificacionProducto"%>
<%@page import="java.util.Iterator"%>
<%@page import="controlador.clases.TreeParser"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Direct Market</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
  </head>

  <body>
        
    <jsp:include page="/WEB-INF/includes/header.jsp"/>
    <%!
    public String recorrer(List<TreeParser.NodoCategoria> l, String cat){
        String arbol = "";
        for (TreeParser.NodoCategoria current : l) {
            String activo = "";
            if(current.nombre.equals(cat)){
                activo = "active";
            }
            if(current.hijos != null && !current.hijos.isEmpty()){
                arbol += "<li><label class=\"tree-toggler nav-header\">" + current.nombre + "</label>";
                arbol += "<ul class=\"nav-list tree none\">";
                arbol += recorrer(current.hijos, cat);
                arbol += "</ul>";
            }else{
                arbol += "<li class=\"" + activo + "\"><a href=\"home?cat="+ current.nombre +"\">" + current.nombre + "</a></li>";
            }
        }
        return arbol;
    }
    %>
    <div class="container marketing">

      <div class="row">
        <div class="col-sm-3 sidebar">
          <ul class="nav-list">
            <% 
                List<TreeParser.NodoCategoria> categorias = (List<TreeParser.NodoCategoria>) request.getAttribute("categorias");
                String cat = (String) request.getAttribute("cat");
            %>
            <%= recorrer(categorias, cat) %>
          </ul>
        </div>
          
        <div class="col-sm-9">
            
          <%
          List<DataEspecificacionProducto> productos = (List<DataEspecificacionProducto>) request.getAttribute("productos");
          for (DataEspecificacionProducto p : productos) {
          %>
          <div class="col-lg-4">
            <img src="http://lorempixel.com/140/140/technics/">
            <h2><%= p.getNombre() %></h2>
            <p><%= p.getDescripcion() %></p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <% } %>
          
        </div>
          
      </div><!-- /.row -->

    </div><!-- /.container -->

    <jsp:include page="/WEB-INF/includes/footer.jsp" />

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $('label.tree-toggler').click(function () {
          $(this).parent().children('ul.tree').toggle(300);
        });
      });
    </script>
        
  </body>
</html>

