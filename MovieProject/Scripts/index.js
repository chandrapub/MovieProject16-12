$(document).on("ready", sidenVises);
$("#results").hide();

function sidenVises() {
    $("#ButtonFind").on("click", visResultat);
}

function visResultat() {
    $(".searchresult").show();
    $(".searchresult").addClass("fade");
    $('html, body').animate({
        scrollTop: $("#results").offset().top
    }, 600);
}