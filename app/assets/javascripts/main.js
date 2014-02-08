function logOut(){
	
}

function logIn(){
	FB.login(function(response) {
	   if (response.authResponse) {
	     console.log('Welcome!  Fetching your information.... ');
	     FB.api('/me', function(response) {
	       console.log(response);
	     });
	   } else {
	     console.log('User cancelled login or did not fully authorize.');
	   }
	});
}


$( document ).ready(function() {
	$("#fb_login").click(function(){
		logIn();
	})
	
	$('#goal_time').datetimepicker();

});