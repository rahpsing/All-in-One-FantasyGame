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
			<button id="signupButton" class="signupbanner">Sign Up</button>
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
		  	<div id="loginModalContent" class="modal-content">
			  	<form action="sample.jsp" method="POST">
			  		<p class="logincred">Login Details</p>
				    <input type="text" class="username" id="username" name="username" placeholder="User Name..."><br>
				    <input type="text" class="password" id="password" name="password" placeholder="Password..."><br>
				    <input class="submit" type="submit" value="Submit" />
				    <div class="forgotuorpdiv">
					    <p class="forgotuorp">Forgot username or password?</p>
					    <button id="reset" class="reset">click here</button>
				    </div>
				</form>
		  	</div>
</div>
<div id="signupModal" class="signupmodalcss">
		 	<!-- Modal content -->
		  	<div id="signupModalContent" class="signup-modal-content">
			  	<form action="sample.jsp" method="POST">
			  		<p class="signupcred">Signup Details</p>
			  		<input type="text" class="semail" id="email" name="email" placeholder="Email ID"..."><br>
				    <input type="text" class="susername" id="username" name="username" placeholder="User Name..."><br>
				    <input type="text" class="spassword" id="password" name="password" placeholder="Password..."><br>
				    <input type="text" class="srepassword" id="repassword" name="repassword" placeholder="Reconfirm password..."><br>
				    <input class="ssubmit" type="submit" value="Submit" />
				</form>
		  	</div>
</div>
<script>
var mainDiv = document.getElementById("mainDiv");
var loginButton = document.getElementById("loginButton");
var loginModal = document.getElementById("loginModal");
var loginModalContent = document.getElementById("loginModalContent");
var signupButton = document.getElementById("signupButton");
var signupModal = document.getElementById("signupModal");

window.onclick = function(event) {
	if(event.target.className !="loginbanner" && event.target.className != "signupbanner"){
	    if (event.target.className != loginModal) {
	        loginModal.style.display = "none";
	        mainDiv.classList.remove("blur");
	    }
	    if (event.target.className != signupModal){
	    	signupModal.style.display = "none";
	        mainDiv.classList.remove("blur");
	    }
	}
}

loginButton.onclick = function() {
    loginModal.style.display = "block";
    mainDiv.classList.add("blur");
}

signupButton.onclick = function() {
    signupModal.style.display = "block";
    mainDiv.classList.add("blur");
}


</script>
</body>
</html>