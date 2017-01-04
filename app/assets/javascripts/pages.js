// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('#profile-photo').hover(function() {
    $(this).attr('src', '/assets/about_shot.jpg');
  }, function() {
    $(this).attr('src', '/assets/headshot.jpg');
  });
})
