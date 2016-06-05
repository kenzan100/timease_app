$(document).ready(function(){
  $('input[type="text"]').on("focusout", function(){
    var form = $(this).closest("form");
    form.submit();
  });
});
