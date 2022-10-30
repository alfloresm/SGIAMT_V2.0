
function notify(from, align, type, title, message) {
    $.growl({
        title: title,
        message: message,
        url: ''
    }, {
            element: 'body',
            type: type,
            allow_dismiss: true,
            placement: {
                from: from,
                align: align
            },
            offset: {
                x: 20,
                y: 85
            },
            spacing: 10,
            z_index: 1031,
            delay: 2500,
            timer: 1000,
            url_target: '_blank',
            mouse_over: false,
            animate: {
                enter: 'animated fadeInUp',
                exit: 'animated fadeInDown'
            },
            icon_type: 'class',
            template: '<div data-growl="container" class="alert" role="alert">' +
                '<button type="button" class="close" data-growl="dismiss">' +
                '<span aria-hidden="true">&times;</span>' +
                '<span class="sr-only">Close</span>' +
                '</button>' +
                '<span data-growl="icon"></span>' +
                '<span data-growl="title"></span>' +
                '<span data-growl="message"></span>' +
                '<a href="#" data-growl="url"></a>' +
                '</div>'
        });
}(jQuery);

function showSuccessMessage2() {
    setTimeout(function () {
        swal({
            title: "Todo guardado",
            text: "Tiene que activar su cuenta",
            type: "success"
        }, function () {
            window.location = "W_Pagina_Inicio.aspx";
        });
    }, 1000);
};

function showSuccessMessageEntrada() {
    setTimeout(function () {
        swal({
            title: "Entradas reservadas",
            text: "Por favor revise su correo",
            type: "success"
        }, function () {
            window.location = "W_Iniciar_Sesion.aspx";
        });
    }, 1000);
};
function showSuccessMessageSubirVoucher() {
    swal({
        title: 'Voucher Registrado!',
        icon: 'success',
        confirmButtonText: 'Cool'
    })
};
function showErrorMessageLogin() {
    swal({
        title: 'ERROR!',
        icon: 'error',
        text: 'Su usuario o contraseña es incorrecta o no existe'
    })
};
