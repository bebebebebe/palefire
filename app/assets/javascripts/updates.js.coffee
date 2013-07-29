
$(document).ready ->
  $(".edit_card").on("ajax:success", (e, data, status, xhr) ->
    $("#update_msg").append('<div class="msg"></div>');
    $(".keep-btn").css("background", "");
    $(".current_card").css("background", "#BFBABA");
    setTimeout ( ->
      $(".current_card").css("background", "").css("transition", "background 1s")
      ), 1000;
    $(".msg").delay(1000).fadeOut("slow");
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#update_msg").append('<div class="msg">Error: not saved</div>');
    $(".msg").delay(2000).fadeOut("slow");