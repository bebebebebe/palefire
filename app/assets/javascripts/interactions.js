
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

  $(".keep-btn").on("click", function(){
    var url = $('form.edit_card').attr('action');
    var auth_token = $('form.edit_card div').children().first().next().next().attr('value');
    var writing = $('form.edit_card textarea').val();
    $.ajax(url, {
      type: 'POST',
      data: {
        '_method': 'PUT',
        'authenticity_token': auth_token,
        'card': {
          'writing': writing
        }
      },
      success: function(e, data, status, xhr){ $('.edit_card').trigger("versionSave");}
    })

  })

  $(".")


});
