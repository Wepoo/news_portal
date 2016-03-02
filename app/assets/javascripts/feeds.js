var ready;
ready = function() {
  $('.hidden_article').hide();
};
$(document).ready(ready);
$(document).on('page:load', ready);
