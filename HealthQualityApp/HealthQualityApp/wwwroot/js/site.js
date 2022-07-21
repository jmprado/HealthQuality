// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.


$(".btn_guess").on('click', function () {
    var apiUrl = "/api/guessvalue";

    var idBtn = $(this).attr("id");
    console.log(idBtn);
    var carId = idBtn.replace("btn_", "");
    var idGuessInput = "#input_" + carId;
    var guessValue = $(idGuessInput).val();

    if ($.trim(guessValue) !== "") {
        var apiUrl = `${apiUrl}/${carId}/${guessValue}`;

        $.post(apiUrl, function (data) {
            if (data)
                $("#modal_success").modal("show");
            else
                $("#modal_fail").modal("show");
        });
    }
});
