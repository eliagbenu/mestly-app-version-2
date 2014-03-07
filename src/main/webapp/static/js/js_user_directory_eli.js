$(document).ready(function(){
    
	var paragraph_users = $(".user-directory-user-list");
	paragraph_users.hide();  

	$(".user-directory-header").click(function(){
		paragraph_users.show();
	});

    
});
