//Login
$('#modal-login').on('show.bs.modal', function (e) {
  $("#ErrorMsg").hide();
});

$("#btnIniciar").click(function () {
    var formData = {email: $("#usuInp").val(), password: $("#pwdInp").val()}; //Array

    $.ajax({
        url: "iniciar-sesion",
        type: "POST",
        data: formData,
        success: function (result)
        {
            if (result.indexOf("Ok") > -1) {
                window.location.href = "/ProgWeb/home";
            } else {
                $("#usuInp").val("");
                $("#pwdInp").val("");
                $("#ErrorMsg").html("Usuario o clave incorrectos");
                $("#ErrorMsg").show();
            }
        }
    });
});

$('#usuInp').live("keypress", function (e) {
    var code = (e.keyCode ? e.keyCode : e.which);
    if (code == 13) {
        $('#pwdInp').focus();
    }
});

$('#pwdInp').live("keypress", function (e) {
    var code = (e.keyCode ? e.keyCode : e.which);
    if (code == 13) {
        $('#btnIniciar').click();
    }
});

//Carrito
$("#generarOrdenLk").click(function () {
    $.ajax({
        url: "generar-orden",
        type: "POST",
        success: function (result)
        {
            alert("Orden generada con exito");
            window.location.href = "/ProgWeb/home";
        }
    });
});

//Agregar al carrito
$("#btnAgregar").click(function () {
    var formData = {nroRef: $("#nroRef").val(), cantidad: $("#cantidadProductos").val()};

    $.ajax({
        url: "agregar-carrito",
        type: "POST",
        data: formData,
        success: function (result)
        {
            window.location.href = "/ProgWeb/home";
        }
    });
});