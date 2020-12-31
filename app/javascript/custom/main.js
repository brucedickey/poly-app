
scroll_bottom = function() {
  var messages = $('#messages');

  if ( messages.length > 0 ) {
    messages.scrollTop(messages[0].scrollHeight);
  }
}

submit_message = function() {
  $('#message_body').on('keyup', function(e) {
    if (e.keyCode == 13) {
      // Not needed; auto clicked.   $('button').click();
      e.target.value = '';
    }
  });
}

$(document).on('turbolinks:load', function() {   // Is after DOM ready
  $('.ui.dropdown').dropdown();

  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });

  submit_message();
  scroll_bottom();
});
