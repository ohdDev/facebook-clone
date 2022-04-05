
// set active class to top nav bar items
$(document).on('click', 'nav ul li', function (ev) {
        ev.preventDefault();
        $("nav ul li").removeClass("active");
        $(this).addClass("active");   
    });