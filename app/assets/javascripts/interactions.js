
$(document).ready(function(){

  $(".project-card").hover(function(){
    $(this).css("border", "outset");
  },function(){
    $(this).css("border","");
  });

  $(".keep-btn").hover(function(){
    $(this).css("background", "#BFBABA");
  }, function(){
    $(this).css("background","");
  });

  //$(".version").click(function(){
  //  $(this).css("background", "gray")
  //});


});
