 
<%@page import="java.util.Iterator"%>
<%@page import="controlador.clases.TreeParser"%>
<%@page import="Controlador.DataTypes.DataCategoria"%>
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
    
    <div class="container marketing">

      <div class="row">
        <div class="col-sm-3 sidebar">
          <ul class="nav-list">
            <% 
                List<TreeParser.NodoCategoria> categorias = (List<TreeParser.NodoCategoria>) request.getAttribute("categorias");
                System.out.println("Categorias " + categorias);
               Iterator it = categorias.iterator();
               while(it.hasNext()){
                  TreeParser.NodoCategoria nodo = (TreeParser.NodoCategoria) it.next();
            %>  
            <%=nodo.nombre%>
            <li><label class="tree-toggler nav-header"></label>
              <ul class="nav-list tree none">
                <li><a href="#">categoria 1.1</a></li>
                <li><label class="tree-toggler nav-header">Categoria 1.2</label>
                  <ul class="nav-list tree none">
                    <li><a href="#">categoria 1.2.1</a></li>
                    <li><label class="tree-toggler nav-header">Categoria 1.2.3</label>
                    <ul class="nav-list tree none">
                      <li><a href="#">categoria 1.2.3.1</a></li>
                      <li><a href="#">categoria 1.2.3.2</a></li>
                      <li><a href="#">categoria 1.2.3.3</a></li>
                      <li><a href="#">categoria 1.2.3.4</a></li>
                    </ul>
                    </li>
                    <li><a href="#">categoria 1.2.2</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <% }%> 
          </ul>
        </div>
          
        <div class="col-sm-9">
            
          <div class="col-lg-4">
            <img src="http://lorempixel.com/140/140/technics/">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
          </div><!-- /.col-lg-4 -->

          <div class="col-lg-4">
            <img src="http://lorempixel.com/140/140/technics/">
            <h2>Heading</h2>
            <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
          </div><!-- /.col-lg-4 -->

          <div class="col-lg-4">
            <img src="http://lorempixel.com/140/140/technics/">
            <h2>Heading</h2>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          
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

