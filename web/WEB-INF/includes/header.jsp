<header>
    <nav class="navbar navbar-default">
         <a class="navbar-brand" href="home">
          Direct Market
        </a> 
        <%
            Boolean login = false;
            //session.invalidate(); 
            if(session.getAttribute("usuario_logueado") != null){
                login = true;
            }
            if (login) {
        %>
        <ul class="nav">
            <li class="dropdown medium only-icon widget">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="icon-shopping-cart"></i>
                    <div class="label">3</div>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">
                            <div class="widget-body">
                                <div class="pull-left icon">
                                    <i class="icon-ok text-success"></i>
                                </div>
                                <div class="pull-left text">
                                    Iphone 5
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div class="widget-body">
                                <div class="pull-left icon">
                                    <i class="icon-ok text-success"></i>
                                </div>
                                <div class="pull-left text">
                                    Ipad Mini
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div class="widget-body">
                                <div class="pull-left icon">
                                    <i class="icon-ok text-success"></i>
                                </div>
                                <div class="pull-left text">
                                    Cargador Iphone
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="widget-footer">
                        <a href="carrito">Ver orden</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown dark user-menu">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <!--<img width="23" height="23" alt="Mila Kunis" src="assets/images/avatar.jpg" />-->
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
                    <% if(session.getAttribute("esProveedor") != null && session.getAttribute("esProveedor").toString() == "yes"){ %>
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

    <!-- modal cambiar clave -->
    <div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="ModalLogin" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Iniciar Sesion</h4>
                </div>
                <div class="modal-body">
                    <div id="ErrorMsg" style="color:red;"></div>
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

                                <script>
                                    function init() {
                                        $("#btnIniciar").click(function(){
                                            var formData = {email:$("#usuInp").val(),password:$("#pwdInp").val()}; //Array

                                            $.ajax({
                                                url : "iniciar-sesion",
                                                type: "POST",
                                                data : formData,
                                                success: function(result)
                                                {
                                                    console.info(result);
                                                    if(result.indexOf("Ok") > -1){
                                                        window.location.href="/ProgWeb/home";
                                                    }else{
                                                        $("#usuInp").val("");
                                                        $("#pwdInp").val("");
                                                        $("#ErrorMsg").html("Usuario o clave incorrectos");
                                                    }
                                                }
                                            });
                                        }); 
                                        $('#usuInp').live("keypress", function(e) {
                                            var code = (e.keyCode ? e.keyCode : e.which);
                                            if (code == 13) {
                                               $('#pwdInp').focus();
                                            }
                                         });
                                         $('#pwdInp').live("keypress", function(e) {
                                            var code = (e.keyCode ? e.keyCode : e.which);
                                            if (code == 13) {
                                               $('#btnIniciar').click();
                                            }
                                         });
                                    
                                    
                                    }
                                    window.onload = init; 
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>