// 画面リサイズ時にbodyのheight再調整
$(window).on("load", function() {
  // 画面サイズ取得し、bodyheightを画面サイズに
  win_height = $(window).height();
  $("body").css("height", win_height + "px");
});

$(window).resize(function() {
  win_height = $(window).height();
  $("body").css("height", win_height + "px");
});
