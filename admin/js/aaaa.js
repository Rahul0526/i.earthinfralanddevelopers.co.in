$.fn.isOnScreen = function (x, y) {

    if (x == null || typeof x == 'undefined') x = 1;
    if (y == null || typeof y == 'undefined') y = 1;

    var win = $(window);

    var viewport = {
        top: win.scrollTop(),
        left: win.scrollLeft()
    };

    viewport.right = viewport.left + win.width();
    viewport.bottom = viewport.top + win.height();

    var height = this.outerHeight();
    var width = this.outerWidth();

    if (!width || !height) {
        return false;
    }

    var bounds = this.offset();
    bounds.right = bounds.left + width;
    bounds.bottom = bounds.top + height;

    var visible = (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));

    if (!visible) {
        return false;
    }

    var deltas =
    {
        top: Math.min(1, (bounds.bottom - viewport.top) / height),
        bottom: Math.min(1, (viewport.bottom - bounds.top) / height),
        left: Math.min(1, (bounds.right - viewport.left) / width),
        right: Math.min(1, (viewport.right - bounds.left) / width)
    };

    return (deltas.left * deltas.right) >= x && (deltas.top * deltas.bottom) >= y;

};


//********************************window onload function.************************
$(window).load(function () {

    alert("Hi");
    var a = document.getElementById('my_frame');
    alert(a);
    if ($('#my_frame').isOnScreen(0.5, 0.5) == true) {
        alert('hello on screen')
    }
    else {
        alert('no ... onscreen')
    }
    //    alert("ViewCount" + ViewCount);
});




 //*************************** ******scroll function***********************

 $(window).scroll(function () 
 {
     //alert("Hi");
     if ($('#my_frame').isOnScreen(0.5, 0.5) == true) {
         alert('hello on screen')
     }
     //    alert("ViewCount" + ViewCount);
 });