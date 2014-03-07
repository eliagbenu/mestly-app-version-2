$(document).ready(function(){
    
  $('#file-to-upload').tooltip();

   $('#tag-label').hover(function(){
	   $(this).popover('toggle')
   });

	$('#save-all-changes').click(function () {
	    var btn = $(this)
	    btn.button('loading')
	    setTimeout(function () {
	        btn.button('reset')
	    }, 3000)
	}) 


});
