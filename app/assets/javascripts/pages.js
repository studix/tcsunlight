$(function(){
  $('.expandable-link > a').click (function(event) {
    $(".expandable-items > a").removeClass("hidden");
    $(this).remove();
    event.preventDefault();
  });
});
