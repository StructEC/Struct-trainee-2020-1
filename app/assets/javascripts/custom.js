$(document).on('turbolinks:load', function () {
    let selecionador = $('#selecionador');

    // Inicialização sem mostrar o selecionador de números
    let numbers = $('.numbers-hide');
    numbers.hide();

    // Visualização
    selecionador.change(function () {
        if (this.value === "true") {
            numbers.show();
        } else {
            numbers.hide();
        }
    })
});