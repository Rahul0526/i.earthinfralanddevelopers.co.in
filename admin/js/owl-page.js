$(document).ready(function () {
    var oVideoTag = document.getElementById('videoPlayer');
    var oLink = document.getElementById('vedioAnchorTag');
    if (oLink && oVideoTag) {
        oLink.addEventListener('click', function (e) {
            oVideoTag.play();
            setTimeout(function () {
                oVideoTag.controls = 'controls';
            }, 2500);
        }, false);
    }

    $('video').attr('webkit-playsinline', '');
    $("#owl-demo").owlCarousel({

        autoPlay: false, //Set AutoPlay to 3 seconds
        pagination: false,
        items: 5,
        itemsDesktop: [1199, 5],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 1.2],
        itemsTabletSmall: [500, 1.2],
        itemsMobile: [479, 1.2]

    });
    $("#owl-demo4").owlCarousel({

        autoPlay: false, //Set AutoPlay to 3 seconds
        pagination: false,
        items: 5,
        itemsDesktop: [1199, 5],
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 1.2],
        itemsTabletSmall: [500, 1.2],
        itemsMobile: [479, 1.2]

    });
});
    