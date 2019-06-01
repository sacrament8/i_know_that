$(document).on("turbolinks:load", function() {
  // 画面サイズ取得し、bodyheightを画面サイズに
  win_height = $(window).height();
  $("body").css("height", win_height + "px");
  win_height = $(window).height();
  $("html").css("height", win_height + "px");
  $("document").css("margin-top", "50px");

  // flashメッセージ出現、消滅アニメーション
  $(".delay-vanish")
    .fadeIn(100)
    .fadeOut(3600);

  $(window).resize(function() {
    win_height = $(window).height();
    $("body").css("height", win_height + "px");
    win_height = $(window).height();
    $("html").css("height", win_height + "px");
  });
  $(function() {
    var $win = $(window),
      $main = $("main"),
      $nav = $("nav"),
      navHeight = $nav.outerHeight(),
      navPos = $nav.offset().top,
      fixedClass = "is-fixed";

    $win.on("load scroll", function() {
      var value = $(this).scrollTop();
      if (value > navPos) {
        $nav.addClass(fixedClass);
        $main.css("margin-top", navHeight);
      } else {
        $nav.removeClass(fixedClass);
        $main.css("margin-top", "0");
      }
    });
  });
});
