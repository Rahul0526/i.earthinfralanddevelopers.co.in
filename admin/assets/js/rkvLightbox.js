$(document).ready(function () {
    var _URL = window.URL || window.webkitURL;
    function displayPreview(input, elem, target, width, height) {
        var file = input.files[0]
        var img = new Image();
        var sizeKB = file.size / 1024;
        img.onload = function () {
            $('#checkImgSize').append(img);
            if (img.height != height || img.width != width) {
                alert("Image size must be " + width + 'x' + height + ".\nimage size is " + img.width + 'x' + img.height)
                if (!$('#' + target).is('.backgroundImage'))
                    $('#' + target).addClass('bordered').html(width + 'x' + height)
                else
                    $('#' + target).html('')
                $('#' + target + '_2').css('background-image', "");
                elem.val('')
            } else {
                $('#' + target).removeClass('bordered').html(img);
                $('#' + target + '_2').css('background-image', "url('" + img.src + "')");
            }
        }
        img.src = _URL.createObjectURL(file);
    }

    function resetLightbox() {
        $('.lightbox .customizeBanner').hide();
        $('.lightbox .customizeBanner input,.lightbox .customizeBanner select').val('');
        $('.lightbox .selectTypeSelection').show();
        $('.lightbox .customizeBanner img').remove();
        $('.lightbox .customizeBanner .bannerPart').each(function () {
            $(this).addClass('bordered').html($(this).data('text'));
        })
        $('#bannerType1_2').show();
        $('#bannerType2_2').show();
    }

    $('.generateBanner').on('click', function () {
        $('.lightbox').fadeOut();
    })

    $('.lightbox input[type=file]').on('change', function () {
        target = $(this).data('target');
        width = $(this).data('width');
        height = $(this).data('height');
        displayPreview(this, $(this), target, width, height);
    })

    $('.lightbox .animation-preview.input-dropdown').on('change', function () {
        var anim = $(this).val();
        var target = $(this).data('target');
        testAnim(anim, target);
        $('#' + target + '_2').attr('data-animation', anim);
    })

    $('.lightbox .play-animation').on('click', function () {
        $(this).closest('.customizeBanner').find('.animation-preview.input-dropdown').each(function () {
            var anim = $(this).val();
            var target = $(this).data('target');
            testAnim(anim, target);
        })
    })

    $('.lightbox .createBanner').on('click', function () {
        $('.selectTypeSelection').hide();
        bannerType = $.trim($('input[name=bannerType]:checked').val());
        $('.customizeBanner.bannerType' + bannerType).show();
        $('#bannerType' + bannerType + '_2').show();
    })

    $('.lightbox .closeAndReset').on('click', function () {
        $('.lightbox').fadeOut(function () {
            resetLightbox();
        });
    })

    $(".createPoster").on("click", function () {
        $(".lightbox").fadeIn();
    })

    $("#videoButton").on("change", function () {
        value = $(this).val();
        $("#videoPlayButton").val(value);
        if (value != "") {
            $("playButton").show();
            $("#playVideo").removeClass().addClass(value);
        } else {
            $("playButton").hide();
        }
    })

    $("#DivVideo").on("click", "#playVideo", function () {
        $("#videoPlayer").trigger("click");
        $("#playButton").hide();
    })
})


function testAnim(x, target) {
    if ($('#' + target).find('img').length) {
        $('#' + target).find('img').removeClass().addClass(x + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $(this).removeClass();
        });
    } else {
        $('#' + target).removeClass().addClass(x + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $(this).removeClass();
        });
    }
}

function showOverlayBanner() {
    $('#afterOverlay').show();
    $('#DivVideo').find('[data-animation]').each(function () {
        anim = $(this).data('animation');
        target = $(this).attr('id');
        testAnim(anim, target);
    })
    setTimeout(function () {
        $('#replay').fadeIn();
    }, 700);
}

function replay() {
    $('#vedio_url_link').trigger('change');
    $('#afterOverlay').hide();
    $('#replay').hide();
    $("#playButton").show();
}