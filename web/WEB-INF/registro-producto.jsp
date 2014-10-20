<%@page import="java.util.List"%>
<%@page import="Controlador.DataTypes.DataCategoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="assets/stylesheets/plugins/select2/select2.css" media="all" rel="stylesheet" type="text/css" />
        <jsp:include page="/WEB-INF/includes/head.jsp"/>
    </head>

    <body class="contrast-red ">

        <jsp:include page="/WEB-INF/includes/header.jsp"/>

        <div id="wrapper">

            <div class="container">
                <div class="row" id="content-wrapper">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <h1 class="pull-left">
                                        <i class="icon-star"></i>
                                        <span>Registro de Productos</span>
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
                                            <li class="active">Registro de Productos</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <form class="form validate-form" id="form-productos" method="post" action="registro-producto" novalidate="novalidate" enctype="multipart/form-data">
                                <div class="col-sm-12">
                                    <div class="box">
                                        <div class="box-content box-double-padding">
                                            <fieldset>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" name="nro_referencia" id="nroRef" placeholder="Nro. Referencia" type="text" onblur="validarNroRef()">
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" name="titulo" placeholder="Titulo" type="text">
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea class="char-max-length form-control" data-rule-required="true" name="descripcion" maxlength="255" placeholder="Descripcion" rows="4"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" data-rule-number="true" name="precio" placeholder="Precio" type="text">
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control" data-rule-required="true" data-rule-number="true" name="stock" placeholder="Stock" type="text">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Categorias</label>
                                                        <select class="select2 form-control" multiple name="categorias" data-rule-required="true">
                                                            <%
                                                                List<DataCategoria> categorias = (List<DataCategoria>) request.getAttribute("categorias");
                                                                for (DataCategoria cat : categorias) {
                                                            %>
                                                            <option value="<%= cat.getNombre()%>"><%= cat.getNombre()%></option>
                                                            <% }%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Especificaciones</label>
                                                        <div class="row">
                                                            <div class="col-xs-4">
                                                                <input type="text" class="form-control" placeholder="Tipo" id="esp_key">
                                                            </div>
                                                            <div class="col-xs-7">
                                                                <input type="text" class="form-control" placeholder="Especificacion" id="esp_name">
                                                            </div>
                                                            <div class="col-xs-1">
                                                                <a class="btn btn-success" id="add-especificacion">
                                                                    <i class="icon-plus"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <table class="table table-striped" style="margin-top: 10px;">

                                                        </table>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <hr class="hr-normal">
                                            <fieldset>
                                                <div class="col-sm-4">
                                                    <div class="box-content">
                                                        <img class="img-responsive center-block" src="http://placehold.it/140x140&text=Foto" id="preview1"/>
                                                    </div>
                                                    <div class="box-content text-center">
                                                        <input title="Seleccionar foto" type="file" name="imagenes" id="imagen1">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="box-content">
                                                        <img class="img-responsive center-block" src="http://placehold.it/140x140&text=Foto" id="preview2"/>
                                                    </div>
                                                    <div class="box-content text-center">
                                                        <input title="Seleccionar foto" type="file" name="imagenes" id="imagen2">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="box-content">
                                                        <img class="img-responsive center-block" src="http://placehold.it/140x140&text=Foto" id="preview3"/>
                                                    </div>
                                                    <div class="box-content text-center">
                                                        <input title="Seleccionar foto" type="file" name="imagenes" id="imagen3">
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="form-actions form-actions-padding" style="margin-bottom: 0;">
                                                <div class="text-right">
                                                    <a class="btn" href="home">
                                                        Cancelar
                                                    </a>
                                                    <button class="btn btn-primary" type="button" id="btnGuardarProducto">
                                                        <i class="icon-save"></i>
                                                        Guardar
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                                        
        <jsp:include page="/WEB-INF/includes/footer.jsp" />
        
        <jsp:include page="/WEB-INF/includes/javascript.jsp" />
        <script src="assets/javascripts/plugins/fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/select2/select2.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/validate/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/validate/additional-methods.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/validate/validate_messages_es.js" type="text/javascript"></script>
        <script src="assets/javascripts/plugins/bootstrap_maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#imagen1').on('change', function () {
                    var image = document.getElementById("imagen1").files[0];
                    oFReader = new FileReader();
                    oFReader.readAsDataURL(image);
                    document.getElementById("preview1").src = '';
                    oFReader.onload = function (oFREvent) {
                        document.getElementById("preview1").src = oFREvent.target.result;
                    }
                });

                $('#imagen2').on('change', function () {
                    var image = document.getElementById("imagen2").files[0];
                    oFReader = new FileReader();
                    oFReader.readAsDataURL(image);
                    document.getElementById("preview2").src = '';
                    oFReader.onload = function (oFREvent) {
                        document.getElementById("preview2").src = oFREvent.target.result;
                    }
                });

                $('#imagen3').on('change', function () {
                    var image = document.getElementById("imagen3").files[0];
                    oFReader = new FileReader();
                    oFReader.readAsDataURL(image);
                    document.getElementById("preview3").src = '';
                    oFReader.onload = function (oFREvent) {
                        document.getElementById("preview3").src = oFREvent.target.result;
                    }
                });
                
                $('#btnGuardarProducto').on('click', function(){
                    if($('input[name="especificaciones"]').val()){
                        $('#form-productos').submit();
                    }else{
                        alert('Debe ingresar una especificacion.')
                    }
                });
            });

            $("#add-especificacion").live('click', function (e) {
                var html, esp_key, esp_name;
                esp_key = $("#esp_key").val();
                esp_name = $("#esp_name").val();
                $("#esp_key").val("");
                $("#esp_name").val("");
                if (esp_key.length !== 0 && esp_name.length !== 0) {
                    html = "<tr><td>" + esp_key + "</td><td>" + esp_name + "</td><td><div class='actions pull-right'><a class='btn btn-link remove' href='#' title='Eliminar'><i class='icon-remove'></i></a></div></td>";
                    html += "<input type='hidden' name='especificaciones' value='" + esp_key + ":" + esp_name + "'></tr>";
                    $('table').prepend(html).effect("highlight", {}, 500);
                }
                return e.preventDefault();
            });

            $(".remove").live("click", function (e) {
                $(this).tooltip("hide");
                $(this).parents("tr").fadeOut(500, function () {
                    return $(this).remove();
                });
                e.stopPropagation();
                e.preventDefault();
                return false;
            });
            
            function validarNroRef() {
                var xhr = new XMLHttpRequest();
                var nroRef = document.getElementById("nroRef").value;
                xhr.open("POST", "/ProgWeb/validar-producto", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("nroRef=" + nroRef);

                xhr.onreadystatechange = function (e) {
                    if(xhr.readyState === 4){
                        if (xhr.status !== 200){
                            document.getElementById("nroRef").value = '';
                            alert('El Numero de Referencia ya esta ingresado, ingrese uno nuevo.');
                        }
                    }
                };
            }
        </script>
    </body>
</html>

