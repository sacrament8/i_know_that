$(document).on("turbolinks:load", function() {
  // 画面サイズ取得し、bodyheightを画面サイズに
  win_height = $(window).height();
  $("body").css("height", win_height + "px");
  win_height = $(window).height();
  $("html").css("height", win_height + "px");

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
});
