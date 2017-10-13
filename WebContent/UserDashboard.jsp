<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Dashboard</title>
<!--  ${pageContext.request.contextPath} - gives you path of the project -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/UserDashboard.css" media="screen" />
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
	<div class="colorstrip1">
			<!--<tr>
				<b>aaaaa</b>
				<b>bbbbb</b>
			</tr>-->
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg" class="userimage">
			<div class="welcomemsg">
			<b>hello, </b>
			<b class="name">jason bourne</b>
			</div>
			<img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign">
 		</div>
 		<div class="userinfo">
 			<div class="colorstrip21">
	 			<form>	
	 				<input class="searchbar" type="text" name="search" placeholder="search...">
	 			</form>
	 			<b class="searchdisc">find users and leagues</b>
	 		</div>
 			<div class="leaguelist">
		 		<div class="systemleagueslist">
		 			<div class="colorstrip22">
		 				<b> Leagues </b>
		 			</div>
		 			<div class="dropdown">
	  					<button class="dropbtn1">
	  						<b>Soccer</b>
	  					</button>
					 	<div class="dropdown-content">
						    <a href="#">League 1</a>
						    <a href="#">League 2</a>
						    <a href="#">League 3</a>
					 	</div>
					 </div>
					 <div class="dropdown">
					 	<button class="dropbtn2">Cricket</button>
					 	<div class="dropdown-content">
						    <a href="#">League 1</a>
						    <a href="#">League 2</a>
						    <a href="#">League 3</a>
					 	</div>
					</div>
		 		</div>
		 		<div class="userleagueslist">
		 			<div class="dropdown">
	  					<button class="dropbtn3">
	  						<b>User sport 1</b>
	  					</button>
					 	<div class="dropdown-content">
						    <a href="#">League 1</a>
						    <a href="#">League 2</a>
						    <a href="#">League 3</a>
					 	</div>
					 </div>
					 <div class="dropdown">
					 	<button class="dropbtn4">User sport 2</button>
					 	<div class="dropdown-content">
						    <a href="#">League 1</a>
						    <a href="#">League 2</a>
						    <a href="#">League 3</a>
					 	</div>
					</div>
		 		</div>
	 		</div>
 			<div class="usermenu">
	 			<button id="editProfile" class="editprofile">profile</button>
	 			<button id="createLeague" class="createleague">create league</button>
	 			<button id="Stats" class="stats">statistics</button>
	 		</div>
	 	</div>
 		<div class="highlights">
 			<div style="text-align: center">
 				<b class="highlightsbanner">highlights</b>
 			</div>
 			<div style="display:inline-block">
	 			<div class="colorstrip101">
		 			<div class="video1">
		 				<iframe width="1000" height="400" src="https://www.youtube.com/embed/CUI2K7jSJrw?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
		 			</div>
		 			<div style="text-align:center;margin-top: 150px">
		 				<b class="footballhbanner">football</b>
		 			</div>
	 			</div>
	 		</div>
	 		<div style="display:inline-block">
	 			<div class="colorstrip102">
		 			<div class="video2">
		 				<iframe width="1000" height="400" src="https://www.youtube.com/embed/1A6RA6iJdFg?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
		 			</div>
		 			<div style="text-align:center;margin-top: 150px">
		 				<b class="crickethbanner">cricket</b>
		 			</div>
	 			</div>
	 		</div>
 		</div>
 		<div class="colorstrip10"></div>
		<div class="colorstrip11"></div>
		<div class="colorstrip12"></div>
		<div class="colorstrip13">
			<b class="companybanner">a group 4 project ©</b>
		</div>
	</div>
	<script>
var mainDiv = document.getElementById("mainDiv");
var profileButton = document.getElementById("editProfile");
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