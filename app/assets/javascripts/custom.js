$(document).on('turbolinks:load', function () {
   let selecionador = $("#selecionador");
   let numbers = $(".number-hide");
   numbers.hide();

   selecionador.change(function () {
      if (selecionador.val() === "true") {
         numbers.show();
      } else {
         numbers.hide();
      }
   })

});