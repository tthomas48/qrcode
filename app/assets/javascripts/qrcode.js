$(function() {
    var el = $('#error_explanation');
    var p = el.parent();
    if(el) {
      var content = el.html();
      el.detach();
      el.find('h2').each(function() {
        $(this).detach();
      });
      p.prepend($('<div class="alert-message error"><a class="close" href="#">×</a>' + content + '</div>'));
      $('div.alert-message').alert();
    }
});
