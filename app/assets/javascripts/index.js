// Mozilla, Opera, Webkit 에서 dom Ready를 위해
if (document.addEventListener) {
    document.addEventListener("DOMContentLoaded", function () {
        document.removeEventListener("DOMContentLoaded", arguments.callee, false);
        domReady();
    }, false);
  }
// Internet Explorer 에서 dom Ready를 위해
else if (document.attachEvent) {
    document.attachEvent("onreadystatechange", function () {
        if (document.readyState === "complete") {
            document.detachEvent("onreadystatechange", arguments.callee);
            domReady();
        }
    });
}

function scroll_top(){
  $('html, body').animate({
    scrollTop: 0 //scrolltop은 스크롤바의 수직위치를 반환한다.
  }, 500);
}

function domReady(){

  //헤더 Dynamical Function
  $(window).scroll(function(){
    var height = $(document).scrollTop();

    //헤더가 내려오자마자
    if(height > 1){
      $('.navbar-inverse').css('background-color','white');
      $('.navbar-inverse .navbar-brand').css('color','#222');
      $('.navbar-inverse .navbar-nav > li > a').css('color','#222');
      $('#logo').css('color','black');
      $('.navbar-inverse').css('border-top-color','#F16F34');
    }else{
      $('.navbar-inverse').css('background-color','transparent');
      $('.navbar-inverse .navbar-brand').css('color','white');
      $('.navbar-inverse .navbar-nav > li > a').css('color','white');
      $('#logo').css('color','white');
      $('.navbar-inverse').css('border-top-color','transparent');
    }
  });

  var origin_setting = false;

  if($(window).width() < 768){
    $('.navbar-toggle').click(function(){
      if(!origin_setting){
        //box 없애고
        $('.navbar-toggle').attr('disabled',true);
        $('#main_top_copy #box').css('display','none');
        origin_setting = true;
        $('.navbar-toggle').removeAttr('disabled');
      }else{
        //box 띄워주고
        $('.navbar-toggle').attr('disabled',true);
        $('#main_top_copy #box').css('display','block');
        origin_setting = false;
        $('.navbar-toggle').removeAttr('disabled');
      }
    });
  }else{
    //브라우저 너비에 맞춘 Dynamical Function
    $(window).resize(function () {
      //console.log("width : "+$(window).width());

      if($(window).width() < 768){
      $('.navbar-toggle').click(function(){
        if(!origin_setting){
          //alert('없애주고');
          $('.navbar-toggle').attr('disabled',true);
          $('#main_top_copy #box').css('display','none');
          origin_setting = true;
          $('.navbar-toggle').removeAttr('disabled');

        }else{
          //alert('만들어주고');
          $('.navbar-toggle').attr('disabled',true);
          $('#main_top_copy #box').css('display','block');
          origin_setting = false;
          $('.navbar-toggle').removeAttr('disabled');

        }
      });
    }else{}
    });
  }
}