
function AddEmo(e) {
    var EventImgId = e.id.toString();
    var getTextDescription = document.getElementById('txt_camp_discription');
    if (EventImgId == "imgSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-)";
    if (EventImgId == "imgSad")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-(";

    if (EventImgId == "imgCry")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ";-(";

    if (EventImgId == "imgShadedSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "s-)";
    if (EventImgId == "imgAngrySmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "-))";
    if (EventImgId == "imgRegularSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "r-)";
    if (EventImgId == "imgTeethSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "t-)";
    if (EventImgId == "imgToungueSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "-g)";
    if (EventImgId == "imgwhatchutalSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":))";
    if (EventImgId == "imgOmgSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-o";
    if (EventImgId == "imgWinkSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "w-(";
    if (EventImgId == "imgThumbUp")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(y)";
    if (EventImgId == "imgThumbDown")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(d)";
    if (EventImgId == "imgAngelSmile")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "A-)";
    if (EventImgId == "imgBrokenHeart")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(H)";
    if (EventImgId == "imgBeer")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(B)";
    if (EventImgId == "imgBeerYum")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(M)";
    if (EventImgId == "imgCoffee")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(C)";
    if (EventImgId == "imgRainbow")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(R)";
    if (EventImgId == "imgWiltedRose")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-R";
    if (EventImgId == "imgMusicalNode")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-N";
    if (EventImgId == "imgSoccerBall")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + "(B)";
    if (EventImgId == "imgPresent")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-P";
    if (EventImgId == "imgSun")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-S";
    if (EventImgId == "imgIsland")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-L";
    if (EventImgId == "imgMobilePhone")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-M";
    if (EventImgId == "imgAuto")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-T";
    if (EventImgId == "imgBat")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-B";
    if (EventImgId == "imgopenEnvelop")
        document.getElementById('txt_camp_discription').value = getTextDescription.value + ":-E";


    document.getElementById('popDiv').style.display = 'none';

}

      