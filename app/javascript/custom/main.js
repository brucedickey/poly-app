
scroll_bottom = function() {
  var messages = $('#message-container');

  if ( messages.length > 0 ) {
    messages.scrollTop(messages[0].scrollHeight);
  }
}

submit_message = function() {
  $('#new_message').on('keyup', function(e) {

    // `keyCode` is deprecated.   if (e.keyCode == 13) {  
    if (e.key === 'Enter') { 

      // Not needed; auto submitted.   $('#message_submit_btn').click();
      e.target.value = '';
    }
  });
}

$(document).on('turbolinks:load', function() {   // Is after DOM ready
  submit_message();
  scroll_bottom();
});
