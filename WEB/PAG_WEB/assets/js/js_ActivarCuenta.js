function MensajeConfirmacion() {

    setTimeout(function () {
        swal({
            title: 'Cuenta activada',
            text: 'Pulse en el botón OK para iniciar sesión',
            type: "success"
        }, function () {
            window.location = "IniciarSesion.aspx";
        });
    }, 1000);
}


function MensajeErrorConfirmacion() {
    swal({
        title: 'Existe un error',
        text: 'Pulse en el link nuevamente de su correo para activar la cuenta',
        type: "error"
    });
}
