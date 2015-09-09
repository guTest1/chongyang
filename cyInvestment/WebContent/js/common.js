$(function() {
    $('.menu>li').hover(function() { $(this).find('.submenu').toggle() });

    $('.tb tr:even').addClass('tab_bg');
    $('.tab li').click(function() {
        $(this).addClass('on').siblings('li').removeClass('on');
        var index = $(this).index();
        $('.tabbox>div').eq(index).show().siblings('div').hide();
    });
    $('.extensible').click(function() {
        $(this).toggleClass('show').next('dd').slideToggle();
    });
    $('.ul_tab li').click(function() {
        $(this).addClass('on').siblings('li').removeClass('on');
        var rel = $(this).attr('rel');
        $('#' + rel).show().siblings('div').hide();
    }
	);
});

function ClickLeftMenu(id) {
    for (var i = 1; i < 7; i++) {
        $("#page0" + i).hide();
        $("#menu0" + i).removeClass();
    }
    $("#page0" + id).show();
    $("#menu0" + id).addClass("on");
}

function $G() {
    var Url = top.window.location.href;
    var u, g, StrBack = '';
    if (arguments[arguments.length - 1] == "#") {
        u = Url.split("#");
    }
    else {
        u = Url.split("?");
    }

    if (u.length == 1) {
        g = '';
    }
    else {
        g = u[1];
    }

    if (g != '') {
        gg = g.split("&");
        var MaxI = gg.length;
        str = arguments[0] + "=";
        for (i = 0; i < MaxI; i++) {
            if (gg[i].indexOf(str) == 0) {
                StrBack = gg[i].replace(str, "");
                break;
            }
        }
    }
    return StrBack;
}