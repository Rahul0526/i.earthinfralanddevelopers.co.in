
//this function will run on pageload time .. and mad banner1 visible true
window.onload = function banner_visible() {
    document.getElementById('b1').checked = true;
    document.getElementById('banner1').style.display = 'block';
    document.getElementById('banner2').style.display = 'none';
    document.getElementById('banner3').style.display = 'none';
    document.getElementById('banner4').style.display = 'none';
    document.getElementById('banner5').style.display = 'none';
    document.getElementById('banner6').style.display = 'none';
}
//checkbox banner1 visible 
function banner1() {
    document.getElementById('banner1').style.display = 'block';
    document.getElementById('banner2').style.display = 'none';
    document.getElementById('banner3').style.display = 'none';
    document.getElementById('banner4').style.display = 'none';
    document.getElementById('banner5').style.display = 'none';
    document.getElementById('banner6').style.display = 'none';

}

//checkbox banner2 visible 
function banner2() {
    document.getElementById('banner1').style.display = 'none';
    document.getElementById('banner2').style.display = 'block';
    document.getElementById('banner3').style.display = 'none';
    document.getElementById('banner4').style.display = 'none';
    document.getElementById('banner5').style.display = 'none';
    document.getElementById('banner6').style.display = 'none';
}

//checkbox banner3 visible 
function banner3() {
    document.getElementById('banner1').style.display = 'none';
    document.getElementById('banner2').style.display = 'none';
    document.getElementById('banner3').style.display = 'none';
    document.getElementById('banner4').style.display = 'block';
    document.getElementById('banner5').style.display = 'none';
    document.getElementById('banner6').style.display = 'none';
}

//checkbox banner4 visible 
function banner4() {
    document.getElementById('banner1').style.display = 'none';
    document.getElementById('banner2').style.display = 'none';
    document.getElementById('banner3').style.display = 'none';
    document.getElementById('banner4').style.display = 'none';
    document.getElementById('banner5').style.display = 'block';
    document.getElementById('banner6').style.display = 'none';

}


//checkbox banner5 visible 
function banner5() {
    document.getElementById('banner1').style.display = 'none';
    document.getElementById('banner2').style.display = 'none';
    document.getElementById('banner3').style.display = 'none';
    document.getElementById('banner4').style.display = 'none';
    document.getElementById('banner5').style.display = 'none';
    document.getElementById('banner6').style.display = 'block';

}
//checkbox banner6 visible 
function banner6() {
    document.getElementById('banner1').style.display = 'none';
    document.getElementById('banner2').style.display = 'none';
    document.getElementById('banner3').style.display = 'none';
    document.getElementById('banner4').style.display = 'none';
    document.getElementById('banner5').style.display = 'none';
    document.getElementById('banner6').style.display = 'block';


}

//sponsered radiobutton function
function alll() {

    document.getElementById('sponsore_banner1').innerHTML = "sponsored";
    document.getElementById('sponsore_banner2').innerHTML = "sponsored";
    document.getElementById('sponsore_banner3').innerHTML = "sponsored";
    document.getElementById('sponsers_banner4').innerHTML = "sponsored";
    document.getElementById('sponserese_banner_5').innerHTML = "sponsored";
    document.getElementById('sponserese_banner6').innerHTML = "sponsored";
}

//adv radiobutton function
function advv() {

    document.getElementById('sponsore_banner1').innerHTML = "Adv";
    document.getElementById('sponsore_banner2').innerHTML = "Adv";
    document.getElementById('sponsore_banner3').innerHTML = "Adv";
    document.getElementById('sponsers_banner4').innerHTML = "Adv";
    document.getElementById('sponserese_banner_5').innerHTML = "Adv";
    document.getElementById('sponserese_banner6').innerHTML = "Adv";

}



function rate_(rate) {
    //            var rate = document.getElementById('rate').value;
    var startBanner1Star1 = document.getElementById('rate_img_1_banner1');
    startBanner1Star1.style.display = "block"






    var startBanner1Star2 = document.getElementById('rate_img_2_banner1');
    startBanner1Star2.style.display = "block"


    var startBanner1Star3 = document.getElementById('rate_img_3_banner1');
    startBanner1Star3.style.display = "block"




    var startBanner1Star4 = document.getElementById('rate_img_4_banner1');
    startBanner1Star4.style.display = "block"



    var startBanner1Star5 = document.getElementById('rate_img_5_banner1');
    startBanner1Star5.style.display = "block"


    //2

    var rate_img_1_banner2 = document.getElementById('rate_img_1_banner2');
    rate_img_1_banner2.style.display = "block"




    var rate_img_2_banner2 = document.getElementById('rate_img_2_banner2');
    rate_img_2_banner2.style.display = "block"



    var rate_img_3_banner2 = document.getElementById('rate_img_3_banner2');
    rate_img_3_banner2.style.display = "block"




    var rate_img_4_banner2 = document.getElementById('rate_img_4_banner2');
    rate_img_4_banner2.style.display = "block"



    var rate_img_5_banner2 = document.getElementById('rate_img_5_banner2');
    rate_img_5_banner2.style.display = "block"

    //3

    var star_img_1_banner3 = document.getElementById('star_img_1_banner3');
    star_img_1_banner3.style.display = "block"

    document.getElementById('title_banner1').style.paddingTop = "1px";

    document.getElementById('title_banner2').style.paddingTop = "7px";

    var star_img_3_banner3 = document.getElementById('star_img_3_banner3');
    star_img_3_banner3.style.display = "block"


    var star_img_4_banner3 = document.getElementById('star_img_4_banner3');
    star_img_4_banner3.style.display = "block"




    var star_img_5_banner3 = document.getElementById('star_img_5_banner3');
    star_img_5_banner3.style.display = "block"


    if (rate == "0.00") {

        document.getElementById('title_banner1').style.paddingTop = "13px";
        document.getElementById('rate_img_1_banner1').style.display = "none"
        document.getElementById('title_banner2').style.paddingTop = "30px";
        document.getElementById('rate_img_2_banner1').style.display = "none"
        document.getElementById('rate_img_3_banner1').style.display = "none"
        document.getElementById('rate_img_4_banner1').style.display = "none"
        document.getElementById('rate_img_5_banner1').style.display = "none"
        //2
        document.getElementById('rate_img_1_banner2').style.display = "none"
        document.getElementById('rate_img_2_banner2').style.display = "none"
        document.getElementById('rate_img_3_banner2').style.display = "none"
        document.getElementById('rate_img_4_banner2').style.display = "none"
        document.getElementById('rate_img_5_banner2').style.display = "none"
        //3
        document.getElementById('star_img_1_banner3').style.display = "none"
        document.getElementById('star_img_2_banner3').style.display = "none"
        document.getElementById('star_img_3_banner3').style.display = "none"
        document.getElementById('star_img_4_banner3').style.display = "none"
        document.getElementById('star_img_5_banner3').style.display = "none"

    }



    if (rate == "1" || rate == "1.0") {

        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_3_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_2_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_3_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"


        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_2_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_3_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

        //                //6
        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_3_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



    }

    if (rate == "1.5" || rate == "1.50") {


        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner1').src = "img/rating-50.png"
        document.getElementById('rate_img_3_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner2').src = "img/rating-50.png"
        document.getElementById('rate_img_3_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"


        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-50.png"
        //                document.getElementById('star_img_3_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

        //                //6



        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner6').src = "img/rating-50.png"
        //                document.getElementById('star_img_3_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



    }



    //when rate is 2.0
    else if (rate == "2" || rate == "2.0") {

        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"


        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

        //                //6



        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



    }



    //when rate is 2.5
    else if (rate == "2.5" || rate == "2.50") {


        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner1').src = "img/rating-50.png"
        document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner2').src = "img/rating-50.png"
        document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"

        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner3').src = "img/rating-50.png"
        //                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

        //                //6
        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner6').src = "img/rating-50.png"
        //                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"

    }

    //when rate is 3.0
    else if (rate == "3" || rate == "3.0") {

        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner1').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"
        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner2').src = "img/star-empty.png"
        document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"

        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner3').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"
        //                //6
        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner6').src = "img/star-empty.png"
        //                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"



    }

    //when rate is 3.5
    else if (rate == "3.5" || rate == "3.50") {

        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner1').src = "img/rating-50.png"
        document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner2').src = "img/rating-50.png"
        document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"


        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner3').src = "img/rating-50.png"
        //                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

        //                //6

        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner6').src = "img/rating-50.png"
        //                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"

    }

    //when rate is 4.0
    else if (rate == "4" || rate == "4.0") {

        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_5_banner1').src = "img/star-empty.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_5_banner2').src = "img/star-empty.png"

        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_5_banner3').src = "img/star-empty.png"

        //                //6

        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_5_banner6').src = "img/star-empty.png"

    }

    //when rate is 4.5
    else if (rate == "4.5" || rate == "4.50") {

        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_5_banner1').src = "img/rating-50.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"

        document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_5_banner2').src = "img/rating-50.png"

        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_5_banner3').src = "img/rating-50.png"

        //                //6

        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_5_banner6').src = "img/rating-50.png"
    }


    //when rate is 5.00
    else if (rate == "5" || rate == "5.0") {

        document.getElementById('rate_img_1_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_2_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner1').src = "img/rating-100.png"
        document.getElementById('rate_img_5_banner1').src = "img/rating-100.png"

        //2
        document.getElementById('rate_img_1_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_2_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_3_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_4_banner2').src = "img/rating-100.png"
        document.getElementById('rate_img_5_banner2').src = "img/rating-100.png"


        //                //3
        //                document.getElementById('star_img_1_banner3').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner3').src = "img/rating-100.png"
        //                document.getElementById('star_img_5_banner3').src = "img/rating-100.png"

        //                //6



        //                document.getElementById('star_img_1_banner6').src = "img/rating-100.png"

        //                document.getElementById('star_img_2_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_3_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_4_banner6').src = "img/rating-100.png"
        //                document.getElementById('star_img_5_banner6').src = "img/rating-100.png"

    }
    else {

        //alert('please Choose fractional value like 1 or 1.0 or 1.5 ...  from 1.0 to 5.0');
    }


}

// select os function
function os() {

    var os_total = "";

    var wincheckbox = document.getElementById("os_1");
    var appleCheckBox = document.getElementById("os2");
    var blackberryCheckbox = document.getElementById("os3");
    var ipadcheckbox = document.getElementById("os4");
    var ipodcheckbox = document.getElementById("os5");
    var androidCheckbox = document.getElementById("os6");

    if (wincheckbox.checked) {


        if (os_total == "") {

            os_total = "Windows";
        }
        else {
            os_total = os_total + "," + "Windows";
        }
    }

    if (appleCheckBox.checked) {


        if (os_total == "") {

            os_total = "Apple";
        }
        else {
            os_total = os_total + "," + "Apple";
        }
    }

    if (blackberryCheckbox.checked) {


        if (os_total == "") {

            os_total = "Blackberry";
        }
        else {
            os_total = os_total + "," + "Blackberry";
        }
    }

    if (ipadcheckbox.checked) {


        if (os_total == "") {

            os_total = "ipad";
        }
        else {
            os_total = os_total + "," + "ipad";
        }
    }

    if (ipodcheckbox.checked) {


        if (os_total == "") {

            os_total = "ipod";
        }
        else {
            os_total = os_total + "," + "ipod";
        }
    }

    if (androidCheckbox.checked) {


        if (os_total == "") {

            os_total = "Android";
        }
        else {
            os_total = os_total + "," + "Android";
        }
    }

    document.getElementById('txt_included_devices').value = os_total;

}

function submit_camp() {



    var banner_id = "";

    if (document.getElementById('banner1').style.display == 'block') {

        banner_id = "Banner 1";

    }
    if (document.getElementById('banner2').style.display == 'block') {

        banner_id = "Banner 2";
    }

    if (document.getElementById('banner3').style.display == 'block') {

        banner_id = "Banner 3";
    }

    if (document.getElementById('banner4').style.display == 'block') {
        banner_id = "Banner 4";
    }

    //            if (document.getElementById('banner5').style.display == 'block') {
    //                banner_id = "Banner 5";
    //            }


    if (document.getElementById('banner6').style.display == 'block') {
        banner_id = "Banner 5";
    }

    var camp_name = document.getElementById('txt_camp_name').value;

    var title = document.getElementById('txt_camp_title').value;
    var description = document.getElementById('txt_camp_discription').value;
    var adv_sponserce = "";
    if (document.getElementById('sponserse').checked == true) {


        adv_sponserce = "sponsored";

    }
    else if (document.getElementById('adv').checked == true) {
        adv_sponserce = "adv";
    }

    var camp_url = document.getElementById('txt_camp_url').value;

    var vedio_url = document.getElementById('vedio_url_link').value;

    var txt_call_to_action = document.getElementById('txt_camp_call_To_Action').value;

    var included_devicess = document.getElementById('txt_included_devices').value;

    var cost = document.getElementById('cost').value;

    var pageUrl = '<%= ResolveUrl("~/admin/create_new_campaign.aspx/submit_function") %>';

    var firstName = "1";
    var lastName = "2";

    //            main banner image 
    //start 
    var fileUpload = $("#FileUpload1").get(0);
    var files = fileUpload.files;
    var file_name = $("#FileUpload1").val();

    var file1 = file_name.split('\\').pop();
    var main_banner_img = "../Campaign_Images/" + file1;

    var test = new FormData();
    for (var i = 0; i < files.length; i++) {
        test.append(files[i].name, files[i]);
    }

    $.ajax({

        url: "camp2.ashx",
        type: "POST",
        contentType: false,
        processData: false,
        data: test,
        // dataType: "json",
        success: function (result) {
            //                    alert(result);
        },
        error: function (err) {
            //                    alert(err.statusText);
        }
    });

    //main banner image upload finish



    //camp icon image upload statrt



    var fileUpload = $("#FileUpload2").get(0);
    var files = fileUpload.files;
    var file_name = $("#FileUpload2").val();

    var file2 = file_name.split('\\').pop();
    var camp_icon_img = "../Campaign_Images/" + file2;

    var test = new FormData();
    for (var i = 0; i < files.length; i++) {
        test.append(files[i].name, files[i]);
    }

    $.ajax({

        url: "camp.ashx",
        type: "POST",
        contentType: false,
        processData: false,
        data: test,
        // dataType: "json",
        success: function (result) {
            //                    alert(result);
        },
        error: function (err) {
            //                    alert(err.statusText);
        }
    });

    var countries = document.getElementById('sale_1');
    var resultc = [];
    for (var i = 0; i < countries.options.length; i++) {
        if (countries.options[i].selected) {
            resultc.push(countries.options[i].value)
        }
    }
    var countr = resultc.toString();




    var startsDD = document.getElementById('ddstars');
    var Adstars = "";
    for (var i = 0; i < startsDD.options.length; i++) {


        if (startsDD.options[i].selected) {
            Adstars = startsDD.options[i].value;
        }
    }

    var passvalueStars = Adstars.toString();


    var banner1Check = document.getElementById('chkBanner1');

    var banner2Check = document.getElementById('chkBanner2');

    var banner3Check = document.getElementById('chkbsdfsdfsanner3');
    var banner4Check = document.getElementById('chkBafghfghnner4');
    var banner5Check = document.getElementById('ckbanfgfdggner5');
    var AllBanners = "";


    if (banner1Check.checked) {


        if (AllBanners == "") {

            AllBanners = "Banner 1";

        }
        else {
            AllBanners = AllBanners + "," + "Banner 1";
        }
    }

    if (banner2Check.checked) {


        if (AllBanners == "") {

            AllBanners = "Banner 2";

        }
        else {
            AllBanners = AllBanners + "," + "Banner 2";

        }
    }

    if (banner3Check.checked) {


        if (AllBanners == "") {

            AllBanners = "Banner 3";
        }
        else {
            AllBanners = AllBanners + "," + "Banner 3";

        }
    }


    if (banner4Check.checked) {


        if (AllBanners == "") {

            AllBanners = "Banner 4";
        }
        else {
            AllBanners = AllBanners + "," + "Banner 4";

        }
    }

    if (banner5Check.checked) {


        if (AllBanners == "") {

            AllBanners = "Banner 5";
        }
        else {
            AllBanners = AllBanners + "," + "Banner 5";

        }
    }





    //main jason string send to  c# function
    var parameter = { "camp_name": camp_name, "title": title, "description": description, "camp_url": camp_url, "camp_url": camp_url, "vedio_url": vedio_url, "txt_call_to_action": txt_call_to_action, "vedio_url": vedio_url, "included_devicess": included_devicess, "adv_sponserce": adv_sponserce, "cost": cost, "banner_id": banner_id, "rate": passvalueStars, "camp_icon_img": camp_icon_img, "main_banner_img": main_banner_img, "country": countr, "AllBanners": AllBanners }
    $.ajax({
        type: 'POST',
        url: pageUrl,
        data: JSON.stringify(parameter),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (data) {
            //                    onSuccess(data);
            alert('New campaign added successfully!');
            document.getElementById("myform").reset();
            document.getElementById('b1').checked = true;

        },
        error: function (data, success, error) {
            alert("Error : " + error);
        }
    });

    return false;
    //            alert(camp_name + title + camp_url + vedio_url + txt_call_to_action);
}
