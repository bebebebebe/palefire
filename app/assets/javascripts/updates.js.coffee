

$(document).ready ->
  $(".edit_card").on("ajax:success", (e, data, status, xhr) ->
    $("#update_msg").append('<div class="msg">version saved</div>');
    $(".msg").delay(1000).fadeOut(1000);
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#update_msg").append "<p>ERROR</p>"