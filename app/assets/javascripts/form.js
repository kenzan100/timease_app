$(document).ready(function(){
  $('input[type="text"]').on("focusout", function(){
    var form = $(this).closest("form");
    $.post(form.attr("action"), function(data){
      console.log(data);
    });
  });
});
