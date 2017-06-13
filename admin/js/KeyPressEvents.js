
$('body').on('keypress', '#txt_camp_title', function 
                            (event) {


    var val = $("#text").val();
    $('.title_banner').html($(this).val()); $('body').find('.title_banner').html($(this).val());
}); $('body').on('keypress', '#txt_camp_discription', function (event) {
    $('body').find('.discription_banner').html($(this).val());
    var value = $("#discription_banner1").text() + "";

    var replacedStr = value.replace(":-)", '<img src="Emoticons/smile.gif" />');
    replacedStr = replacedStr.replace(":-(", '<img src="Emoticons/sad_smile.gif" />');
    replacedStr = replacedStr.replace(";-(", '<img src="Emoticons/cry_smile.gif" />');
    replacedStr = replacedStr.replace("s-)", '<img src="Emoticons/shades_smile.gif" />');
    replacedStr = replacedStr.replace("-))", '<img src="Emoticons/angry_smile.gif" />');
    replacedStr = replacedStr.replace("r-)", '<img src="Emoticons/regular_smile.gif" />');
    replacedStr = replacedStr.replace("-g)", '<img src="Emoticons/tounge_smile.gif" />');
    replacedStr = replacedStr.replace(":))", '<img src="Emoticons/whatchutalkingabout_smile.gif" />');
    replacedStr = replacedStr.replace(":-o", '<img src="Emoticons/omg_smile.gif" />');
    replacedStr = replacedStr.replace("w-(", '<img src="Emoticons/wink_smile.gif" />');
    replacedStr = replacedStr.replace("(y)", '<img src="Emoticons/thumbs_up.gif" />');
    replacedStr = replacedStr.replace("(d)", '<img src="Emoticons/thumbs_down.gif" />');
    replacedStr = replacedStr.replace("A-)", '<img src="Emoticons/angel_smile.gif" />');
    replacedStr = replacedStr.replace("(H)", '<img src="Emoticons/broken_heart.gif" />');
    replacedStr = replacedStr.replace("(B)", '<img src="Emoticons/beer.gif" />');
    replacedStr = replacedStr.replace("(M)", '<img src="Emoticons/beer_yum.gif" />');
    replacedStr = replacedStr.replace("(C)", '<img src="Emoticons/coffee.gif" />');
    replacedStr = replacedStr.replace("(R)", '<img src="Emoticons/rainbow.gif" />');
    replacedStr = replacedStr.replace(":-R", '<img src="Emoticons/wilted_rose.gif" />');
    replacedStr = replacedStr.replace(":-N", '<img src="Emoticons/musical_note.gif" />');
    replacedStr = replacedStr.replace("(B)", '<img src="Emoticons/soccer_ball.gif" />');
    replacedStr = replacedStr.replace(":-P", '<img src="Emoticons/present.gif" />');
    replacedStr = replacedStr.replace(":-S", '<img src="Emoticons/sun.gif" />');
    replacedStr = replacedStr.replace(":-L", '<img src="Emoticons/island.gif" />');
    replacedStr = replacedStr.replace(":-M", '<img src="Emoticons/mobile_phone.gif" />');
    replacedStr = replacedStr.replace(":-T", '<img src="Emoticons/auto.gif" />');
    replacedStr = replacedStr.replace(":-B", '<img src="Emoticons/bat.gif" />');
    replacedStr = replacedStr.replace(":-E", '<img src="Emoticons/envelope_open.gif" />');

    replacedStr = replacedStr.replace("t-)", '<img src="Emoticons/teeth_smile.gif" />');


    $("#discription_banner1").html(replacedStr); ;
}); $('body').on('keypress', '#txt_camp_call_To_Action', function (event) {
    $('body').find('.lnk_banner').html($(this).val());



});


