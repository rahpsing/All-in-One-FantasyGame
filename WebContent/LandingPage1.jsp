<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ALL-IN-ONE</title>
<link rel="stylesheet" type="text/css" href="LandingPage1.css" media="screen" />
<style type="text/css">
<!--
body { 
 padding:0;
 margin:0;
}

-->
</style>
</head>
<body>
<div id="mainDiv" class="maindiv">
	<div class="colorstrip1"></div>
	<div class="colorstrip2">
		<b class="allinonebanner">ALL-IN-ONE</b>
		<b class="multisportfantasyleague">multi-sport fantasy league!</b>
	</div>
	<div>
		<div class="imagestripdiv">
				<img class="footballimage" src="UIAssets/FootballImage1.jpeg">
	    		<img class="cricketimage" src="UIAssets/CricketImage1.jpg">
		</div>
		<div class="signupbuttondiv">
			<button class="signupbanner">Sign Up</button>
		</div>
		<div class="loginbuttondiv">
			<button id="loginButton" class="loginbanner">Log In</button>
		</div>
		<div class="colorstrip4">
			<b class="registerbanner">New player? Register with us today to get right into the action!</b>
			<div class="colorstrip41">	
				<b class="knowmorebanner">Know more</b>
			</div>
		</div>
	</div> 
	<div class="colorstrip5"></div>
	<div class="colorstrip6"></div>
	<div class="colorstrip7"></div>
	<div class="colorstrip8"></div>
	<div class="colorstrip9"></div>
	<div class="infodiv">
	</div>
	<div class="colorstrip10"></div>
	<div class="colorstrip11"></div>
	<div class="colorstrip12"></div>
	<div class="colorstrip13">
		<b class="companybanner">a group 4 project ©</b>
	</div>
</div>
<div id="loginModal" class="loginmodalcss">
		 	<!-- Modal content -->
		  	<div class="modal-content">
			    <span class="close">&times;</span>
			    <p>Some text in the Modal..</p>
		  	</div>
</div>
<script>
var mainDiv = document.getElementById("mainDiv");
var loginButton = document.getElementById("loginButton");
var loginModal = document.getElementById("loginModal");


loginButton.onclick = function() {
    loginModal.style.display = "block";
    mainDiv.classList.add("blur");
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>