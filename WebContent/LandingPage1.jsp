<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ALL-IN-ONE</title>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/css/jQuery.min.js"></script>
<!--  ${pageContext.request.contextPath} - gives you path of the project -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/LandingPage1.css" media="screen" />
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
		<div class="imagestripdiv1">
				<img class="footballimage" src="${pageContext.request.contextPath}/resources/UIAssets/FootballImage1.jpeg">
	    		<img class="cricketimage" src="${pageContext.request.contextPath}/resources/UIAssets/CricketImage1.jpg">
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
		<div class="colorstrip91">
			<b class="featuresbanner">Features</b>
		</div>
		<div class="colorstrip92">
			<b class="leaguessupportedbanner">Leagues Supported</b>
			<img class="leaguesimage" src="${pageContext.request.contextPath}/resources/UIAssets/Leagues.png">
		</div>
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
			  	<form name="loginForm" action="/All-In-One-FantasyGame/login" onsubmit="return validateLoginForm()" method="POST">
			  		<p class="logincred">Login Details</p>
				    <input type="text" class="username" id="username" name="username" placeholder="User Name..."><br>
				    <input type="password" class="password" id="password" name="password" placeholder="Password..."><br>
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
			  	<form name="signupForm" action="/All-In-One-FantasyGame/register" onsubmit="return validateSignUpForm()" method="POST">
			  		<p class="signupcred">Signup Details</p>
			  		<input type="text" class="semail" id="email" name="email" placeholder="Email ID"..."><br>
				    <input type="text" class="susername" id="username" name="username" placeholder="User Name..."><br>
				    <input type="password" class="spassword" id="password" name="password" placeholder="Password..."><br>
				    <input type="password" class="srepassword" id="repassword" name="repassword" placeholder="Reconfirm password..."><br>
				    <input class="ssubmit" type="submit" value="Submit" />
				</form>
		  	</div>
</div>
<script>
$.noConflict();
jQuery(document).ready( function() {
  console.log("i am ready");
});
var mainDiv = document.getElementById("mainDiv");
var loginButton = document.getElementById("loginButton");
var loginModal = document.getElementById("loginModal");
var loginModalContent = document.getElementById("loginModalContent");
var signupButton = document.getElementById("signupButton");
var signupModal = document.getElementById("signupModal");

window.onclick = function(event) {
	if(event.target.parentNode.className != "" && event.target.parentNode.className != "signup-modal-content" && event.target.parentNode.className != "signupmodalcss" && event.target.parentNode.className != "modal-content" && event.target.parentNode.className != "loginmodalcss" && event.target.parentNode.className != "forgotuorpdiv"){
		if(event.target.parentNode.className !="loginbuttondiv"){
			if(event.target.parentNode.className != "signupbuttondiv"){
			    if (event.target.parentNode.className != loginModal) {
			        loginModal.style.display = "none";
			        mainDiv.classList.remove("blur");
			    }
			    if (event.target.parentNode.className != signupModal){
			    	signupModal.style.display = "none";
			        mainDiv.classList.remove("blur");
			    }
			}
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

function validateSignUpForm(){
	
	var email = document.forms["signupForm"]["email"].value;
	var username = document.forms["signupForm"]["username"].value;
	var password = document.forms["signupForm"]["password"].value;
	var repassword = document.forms["signupForm"]["repassword"].value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var pfilter1 = /^(?=.*[a-z])/;
	var pfilter2 = /^(?=.*[A-Z])/;
	var pfilter3 = /^(?=.*\d)/;
	
	if (!filter.test(email)) {
	    alert("Please provide a valid email address");
	    return false;
 	}else if(email == "" || username == "" || password == "" || repassword == ""){
		alert("Enter all fields");
		return false;
	}else if(password.length < 8){
		alert("Password must be at least 8 characters long");
		return false;
	}else if(!pfilter1.test(password)){
		alert("Password must containt at least 1 lowercase letter");
		return false;
	}else if(!pfilter2.test(password)){
		alert("Password must containt at least 1 uppercase letter");
		return false;
	}else if(!pfilter3.test(password)){
		alert("Password must containt at least 1 number");
		return false;
	}else if(password != repassword){
		alert("Passwords do not match, reconfirm password");
		return false;
	}
    return true;
}

function validateLoginForm(){
	var username = document.forms["loginForm"]["username"].value;
	var password = document.forms["loginForm"]["password"].value;
	
	if(username == "" || password == ""){
		alert("Enter all fields");
		return false;
	}
    return true;
 }

</script>
</body>
</html>