// Always ask for JS response when making ajax requests
jQuery.ajaxSetup({  
    'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
});


$(document).ready(function (){  
  $('#new_event').submit(function (){  
    $.post($(this).attr('action'), $(this).serialize(), null, "script");  
    return false;  
  });  
});