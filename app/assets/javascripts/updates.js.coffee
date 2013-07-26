

$(document).ready ->
  $(".edit_card").on("ajax:success", (e, data, status, xhr) ->
    $("#update_msg").append('<div class="msg">version saved</div>');
    $(".current_card").css("background", "#D6D4D5").css("border", "solid gray 5px");
    setTimeout ( ->
      $(".current_card").css("border", "").css("background", "")
      ), 1500;
    $(".msg").delay(1500).fadeOut(1000);
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#update_msg").append "<p>ERROR</p>"


# css("border", "solid black 2px").