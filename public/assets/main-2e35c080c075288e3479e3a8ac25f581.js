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
	       scroll(".logFace", ".setStake");
	     }, {scope: 'publish_actions'});
	   } else {
	     console.log('User cancelled login or did not fully authorize.');
	   }
	}, {scope: 'publish_actions'});
}

function scroll(from, to){
	$(to).show();
	$('html, body').animate({
        scrollTop: $(to).offset().top
    }, 2000, function (){
	    $(from).hide();
    });
}

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    return pattern.test(emailAddress);
};

$(window).load(function() {

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1418604408384387',
      status     : true,
      xfbml      : true
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/all.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));


	$("#fb_login").click(function(){
		logIn();
	});
	
	$("#confirm_button").click(function(){
		var goaltype = $("#goal_type").val();
		var goalstr = $("#goal_desc").val();
		var goaldate = $("#goal_time").val();
		var staketype = $("#stake_type").val();
		var stakedesc = $("#stake_desc").val();
		var refemail = $("#ref_mail").val();
		
		
		if (isValidEmailAddress(refemail)){
			 $.ajax({
		      url : "achiever/create_achievment",
		      type : "POST",
		      data : {"user" : { "fb_id" : uid, "fb_token" : accessToken }, "achievment" : {"referee_email" : refemail}, "goal" : {"goal_type" : goaltype, "goal_str" : goalstr, "goal_date" : goaldate}, "stake" : {"stake_type" : staketype, "stake_str" : stakedesc} }
		    });
		    scroll(".chooseReferee", ".congrats");
		}
		
	})
	
	
	$("#goal_extra").hide();
	$("#stake_extra").hide();
	
	$("#goal_type").change(function(){
		var type = $(this).val();
		if(type == "exercise"){
			$("#goal_extra").show();
			$("#goal_desc_label").text("How many times?");
			$("#goal_desc").val("i.e 3 times");
			$("#goal_time_label").text("By when?");
		}else if (type == "wakeup"){
			$("#goal_extra").show();
			$("#goal_desc_label").text("What for?");
			$("#goal_desc").val("i.e for a lecture");
			$("#goal_time_label").text("By when?");
		}else{
			$("#goal_extra").hide();
		}
	})
	
	$("#stake_type").change(function(){
		$("#stake_extra").show();
	})
	
	$("#goal_time").datetimepicker({
		format: 'Y/m/d H:i:s'
	});
	
	$(".nextButton").hover(function(){
		$(".nextButton").css("width","18em");
		$(".nextButton").css("height","4em");
		$(".nextButton").css("color","white");
		$(".nextButton").css("opacity","1");
		$(".buttonWrapper").css("margin-left","-9em");
	},function(){
		$(".nextButton").css("width","15em");
		$(".nextButton").css("height","3em");
		$(".nextButton").css("color","#636363");
		$(".nextButton").css("opacity","0.4");
		$(".buttonWrapper").css("margin-left","-7.5em");
	});
	
	
	//$(".panel:not(.intro)").hide();
	
	
	$(".nextButton").click(function(){
		var id = $(this).attr("id");
		
		if(id == "intronext"){
			scroll(".intro", ".chooseGoal");
		}else if (id == "chooseGoalnext"){
			var goaltype = $("#goal_type").val();
			var goalstr = $("#goal_desc").val();
			var goaldate = $("#goal_time").val();
			var next = (uid == null) ? ".logFace" : ".setStake";
			if (goaltype != "null" && goalstr != "" && goaldate != "") scroll(".chooseGoal", next);
		}else if (id == "logFacenext"){
			scroll(".logFace", ".setStake");
		}else if (id == "setStakenext"){
			var staketype = $("#stake_type").val();
			var stakedesc = $("#stake_desc").val();
			if (staketype == "facebookpost" && stakedesc != "") scroll(".setStake", ".chooseReferee");
		}
		
	})
	
	
	
	
	FB.getLoginStatus(function(response) {
	  if (response.status === 'connected') {
	    uid = response.authResponse.userID;
	    accessToken = response.authResponse.accessToken;
	    $(".logFace").hide();
	  }
	 });
	
	

});
