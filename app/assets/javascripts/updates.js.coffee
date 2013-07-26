$(document).ready ->
  $(".edit_card").on("ajax:success", (e, data, status, xhr) ->
    $("#update_msg").append 'version saved'
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#update_msg").append "<p>ERROR</p>"