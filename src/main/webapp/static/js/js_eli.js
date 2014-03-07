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
	var paragraph_users = $(".user-directory-user-list")
	paragraph_users.hide();  

	$("user-directory-menu-item").click(function(){
		paragraph_users.show();
	});
    
});
