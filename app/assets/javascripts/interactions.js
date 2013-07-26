
$(document).ready(function(){

  $(".project-card").hover(function(){
    $(this).css("border", "outset");
  },function(){
    $(this).css("border","");
  });

  $(".keep-btn").hover(function(){
    $(this).css("background", "firebrick");
  }, function(){
    $(this).css("background","");
  });

});
