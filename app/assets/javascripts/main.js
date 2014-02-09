//globals
var uid = null;
var accessToken = null;

function logOut(){
	
}

function logIn(){
	FB.login(function(response) {
	   if (response.authResponse) {
	     console.log('Welcome!  Fetching your information.... ');
	     FB.api('/me', function(response) {
	       console.log(response);
	       uid = response["id"];
	       accessToken =   FB.getAuthResponse()['accessToken'];
	     });
	   } else {
	     console.log('User cancelled login or did not fully authorize.');
	   }
	});
}


$(window).load(function() {
	$("#fb_login").click(function(){
		logIn();
	});
	
	$("#confirm_button").click(function(){
		var goaltype = $("#goal_type").val();
		var goalstr = $("#goal_desc").val();
		var goaldate = $("#goal_date").val();
		var staketype = $("#stake_type").val();
		var stakedesc = $("#stake_desc").val();
		var refemail = $("#ref_mail").val();
		
		$.ajax({
	      url : "create_achievment",
	      type : "POST",
	      data : {"user" : { "fb_id" : uid, "fb_token" : accessToken }, "achievment" : {"referee_email" : refemail}, "goal" : {"goal_type" : goaltype, "goal_str" : goalstr, "goal_date" : goaldate}, "stake" : {"stake_type" : staketype, "stake_str" : stakedesc} }
	    });
	})
	
	FB.getLoginStatus(function(response) {
	  if (response.status === 'connected') {
	    uid = response.authResponse.userID;
	    accessToken = response.authResponse.accessToken;
	    $(".logFace").hide();
	  }
	 });
	
	$('#goal_time').datetimepicker({
		format: 'Y/m/d H:i:s'
	});

});
