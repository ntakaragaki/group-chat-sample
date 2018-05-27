window.addEventListener('load', () => {
  var form = document.getElementById('message_form');
  form.onsubmit = () => {
    var text = document.getElementById('chat_input').value;
    var user_login_id = document.getElementById('chat_user_login_id').value;
    var group_id = document.getElementById('chat_group_id').value;
    var chat = { text: text, user_login_id: user_login_id, group_id: group_id };
    App.chat.put_message(chat);
    form.reset();
    return false;
  }
});
