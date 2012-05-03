// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// Loads all Bootstrap javascripts
//= require bootstrap

$(document).ready(function () {
  $("#new_user").validate({
    rules: {
      "user[email]": {required: true, email: true, remote:"/users/check_email" },
      "user_phone": {required: true, minlength:2 },
    }
  });
});
