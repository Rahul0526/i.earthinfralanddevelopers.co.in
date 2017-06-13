$('#txt_camp_title').keypress(function (event) {



                $('#title_banner1').html($(this).val()),
                $('#title_banner2').html($(this).val()),
                $('#title_banner3').html($(this).val()),
                $('#title_banner4').html($(this).val()),
                $('#title_banner_5').html($(this).val()),
                $('#title_banner_6').html($(this).val()),
                $('#mini_title_banner3').html($(this).val())

});

$('#txt_camp_discription').keypress(function (event) {
    $('#mini_title_banner3').html($(this).val()),
                $('#discription_banner1').html($(this).val()),
                $('#discription_banner2').html($(this).val()),
                $('#discription_banner4').html($(this).val()),
                $('#discription_banner_5').html($(this).val())
});



$('#txt_camp_call_To_Action').keypress(function (event) {
                $('#lnk_banner1').html($(this).val()),
                $('#lnk_banner2').html($(this).val()),
                $('#lnk_banner3').html($(this).val()),
                $('#lnk_banner5').html($(this).val()),
                $('#lnk_banner6').html($(this).val())
});