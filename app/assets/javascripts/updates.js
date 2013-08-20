$(document).ready(function(){
  $(".edit_card").on("save-confirm", function(e, data, status, xhr){
    $("#update_msg").append('<div class="msg">version saved</div>');
    $(".keep-btn").css("background", "");
    $(".current_card").css("background", "#BFBABA");
    setTimeout( function(){
      $(".current_card").css("background", "").css("transition", "background 1s")
    }), 1000;
    $(".msg").delay(1000).fadeOut("slow")
  }).bind("ajax:error", function(e,xhr,status,error){
    $("#update_msg").append('<div class="msg">Error: not saved</div>');
    $(".msg").delay(2000).fadeOut("slow");
  })  

  // $(".edit_card").on("version-info", function(){
  //  $('#see_versions').append('hi');
  // })

});