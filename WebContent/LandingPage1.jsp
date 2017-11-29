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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css"  media="screen,projection"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/materialize.min.css"  media="screen,projection"/>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
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

<%-- <div class="container1">
	
		<div class="diagonal" id="d0">
		   
		  <img  src="${pageContext.request.contextPath}/resources/UIAssets/footballmatch.jpeg" />
		
		 
		  </div>
		  
		   <div class="diagonal" id="d1">
		    
		  <img src="${pageContext.request.contextPath}/resources/UIAssets/basketballmatch.jpg" />
		  </div>
		  
		  <div class="diagonal" id="d2">
		    
		  <img src="${pageContext.request.contextPath}/resources/UIAssets/soccermatch.jpg" />
		  </div>
		  
		  <div class="diagonal" id="d3">
		    
		  <img src="${pageContext.request.contextPath}/resources/UIAssets/cricketmatch.jpg" />
		  </div> 
</div> --%>
<div class="container1">
	 	<div id="image1" style="left: 0px;">
			<img  src="${pageContext.request.contextPath}/resources/UIAssets/footballmatch.jpeg" />
		</div>
		<div class="image2boundary">
			<div id="image2" style="left: 0px;">
				<img src="${pageContext.request.contextPath}/resources/UIAssets/basketballmatch.jpg" />
			</div>
		</div>
		<div class="image3boundary">
			<div id="image3" style="left: 0px;">
				<img src="${pageContext.request.contextPath}/resources/UIAssets/cricketmatch.jpg" />
			</div>
		</div>
		
</div>
<div class="container2">
	
</div>
<div id="mainDiv" class="maindiv">
	<!-- <div class="colorstrip1"></div> -->
	
	<div class="colorstrip2">
		<b class="allinonebanner">all-in-one</b>
		
		<b class="multisportfantasyleague">multi-sport fantasy league</b>
		
		<div class="signupbuttondiv">
			 <button id="signupButton" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:60px;width:100%;font-size:2em">Sign Up</button>
		</div>
		<div class="loginbuttondiv">
			<button id="loginButton" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:60px;width:100%;font-size:2em">Log In</button>
		</div>
		<div style="position:fixed; color:#ffffff; font-size:1.75em; bottom: 50px; left: 175px;">
			a group 4 project
		</div>
		
		
	</div>
	<div class="duomodal" id="duoPlacementDiv">
			<iframe id="duo_iframe" width="100%" height="800"></iframe>
	</div>
	<%-- <div class="colorstrip21">
		<img class="leaguesimage" src="${pageContext.request.contextPath}/resources/UIAssets/Leagues.png">
	</div> --%>
	<div>
		<%-- <div class="imagestripdiv1">
				<img class="footballimage" src="${pageContext.request.contextPath}/resources/UIAssets/FootballImage1.jpeg">
				
	    		<img class="cricketimage" src="${pageContext.request.contextPath}/resources/UIAssets/CricketImage1.jpg">
		</div> --%>
		<!-- This is the DUO iframe. This must be hidden on load.This must be shown at line 240 in this page -->
		
		<!-- <div class="signupbuttondiv">
			<button id="signupButton" class="signupbanner">Sign Up</button>
		</div>
		<div class="loginbuttondiv">
			<button id="loginButton" class="loginbanner">Log In</button>
		</div> -->
		
		 <!-- <div class="colorstrip4">
			<b class="registerbanner">doesn't matter if you're a new or returning player, let's get right into the action!</b>
			<div class="colorstrip41">	
				<b class="knowmorebanner">Know more</b>
			</div>
			<div class="signupbuttondiv">
			 <button id="signupButton" class="waves-effect waves-light btn" style="background-color:#c50234;height:60px;width:100%;font-size:2em">Sign Up</button>
			</div>
			<a id="signupButton" class="waves-effect waves-light btn" >Sign Up</a>
		<div class="loginbuttondiv">
			<button id="loginButton" class="waves-effect waves-light btn" style="background-color:#c50234;height:60px;width:100%;font-size:2em">Log In</button>
		</div>
		</div>  -->
		
	</div> 
	
<!-- 	<div class="colorstrip5"></div>
	<div class="colorstrip6"></div>
	<div class="colorstrip7"></div>
	<div class="colorstrip8"></div>
	<div class="colorstrip9"></div> -->
	<%-- <div class="infodiv">
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
	</div> --%>
</div>
<div id="loginModal" class="loginmodalcss">
		 	<!-- Modal content -->
		  	<div id="loginModalContent" class="modal-content">
			  	<form name="loginForm"  >
			  		<p class="logincred">Login Details</p>
				    <input type="text" class="username" id="username" name="username" placeholder="User Name..."><br>
				    <input type="password" class="password" id="password" name="password" placeholder="Password..."><br>
				    <input class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width:100%;font-size:2em;text-transform: lowercase;" type="button" value="Submit" onclick="javascript:validateLoginForm()"/>
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
			  	<form name="signupForm" >
			  		<p class="signupcred">Signup Details</p>
			  		<input type="text" class="semail" id="email" name="email" placeholder="Email ID"..."><br>
				    <input type="text" class="susername" id="username" name="username" placeholder="User Name..."><br>
				    <input type="password" class="spassword" id="password" name="password" placeholder="Password..."><br>
				    <input type="password" class="srepassword" id="repassword" name="repassword" placeholder="Reconfirm password..."><br>
				    <input class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width:100%;font-size:2em;text-transform: lowercase;" type="button" value="Submit" onclick="javascript:validateSignUpForm()" />
				</form>
		  	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/Duo-Web-v2.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script>

setInterval(function() {
	var obj1 = document.getElementById("image1");
    var topVal1 = parseInt(obj1.style.left, 10);
    if(topVal1 == -1500){
    	obj1.style.left = 0 + "px";
    } else {
    	obj1.style.left = (topVal1 - 2) + "px";
    }
}, 100);
setInterval(function() {
	var obj2 = document.getElementById("image2");
    var topVal2 = parseInt(obj2.style.left, 10);
    if(topVal2 == -1600){
    	obj2.style.left = 0 + "px";
    } else {
    	obj2.style.left = (topVal2 - 2) + "px";
    }
}, 100);
setInterval(function() {
	var obj3 = document.getElementById("image3");
    var topVal3 = parseInt(obj3.style.left, 10);
    if(topVal3 == -1700){
    	obj3.style.left = 0 + "px";
    } else {
    	obj3.style.left = (topVal3 - 2) + "px";
    }
}, 100); 
</script>
<script type="text/javascript">
$.noConflict();
jQuery(document).ready( function() {
  console.log("i am ready");
  document.getElementById('duo_iframe').hide(); 
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
	jQuery.ajax({
	    url : '/All-In-One-FantasyGame/register',
	    type: 'post',
	    data : {userName:username,passWord:password,emailId:email},
	    success: function(data)
	    {	
	    	signupModal.style.display = "none";
	    	console.log("Came from backend");
		if(data=="Success"){
			alert("Congratulations..! Please Login to fantastic world of sports")
		}
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {	
		alert("Username already in use. Please try a different username")
	    }
	});
}

function validateLoginForm(){
	var userName = document.forms["loginForm"]["username"].value;
	var passWord = document.forms["loginForm"]["password"].value;
	console.log("Came here 1");
	console.log(userName);
	console.log(passWord);
	if(userName == "" || passWord == ""){
		alert("Enter all fields");
		return false;
	}
	jQuery.ajax({
	    url : '/All-In-One-FantasyGame/loginCheck',
	    type: 'post',
	    data : {username:userName,password:passWord},
	    success: function(data)
	    {	
		if(data=="true")
			{
			
			duo(userName);
			
			}
		else{alert("Username/Password doesn't match")}
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {	
		alert("please try again.Contact administrator")
	    }
	});
    return true;
 }

 function duo(userName){
	 console.log("Ready for dual auth");
	 console.log(userName);
	 jQuery.ajax({
		    url : '/All-In-One-FantasyGame/duoSignRequest',
		    type: 'post',
		    data : {username:userName},
		    success: function(data)
		    {	 
				 			 
				 alpha = Duo.init({
					 'host':'api-35d604b9.duosecurity.com',
					 'post_action':'/All-In-One-FantasyGame/duoSignResponse',
					 'sig_request':data
					 
				 });
				 
				 loginModal.style.display = none;
				 mainDiv.classList.remove("blur");
				 document.getElementById('duo_iframe').show();
				// var ifrm=document.createElement('iframe');
				// ifrm.setAttribute('id', 'duo_iframe');
				 //ifrm.setAttribute('width', '620');
				 //ifrm.setAttribute('height', '500');
				 //ifrm.setAttribute('frameborder', '0');
				 //ifrm.setAttribute('allowtransparency', 'true');
				// document.getElementById('duoPlacementDiv').appendChild(ifrm);
				 
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {	
			alert("please try again.Contact administrator")
		    }
		});
 }
 


</script>
</body>
</html>