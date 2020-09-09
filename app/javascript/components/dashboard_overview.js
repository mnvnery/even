function hideReveal() {
    // Hide to left / show from left
    $("#about-1").toggle("slide", {direction: "left"}, 500);

    // Show from right / hide to right
    $("#about-2").toggle("slide", {direction: "right"}, 500);
}

$(document).ready(function() {
    $('#about-1').click(hideReveal);
    $('#about-2').click(hideReveal);
});
export {hideReveal};
