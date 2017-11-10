<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>League Dashboard</title>
<!--  ${pageContext.request.contextPath} - gives you path of the project -->
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/jQuery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/LeagueInfoPage.css" media="screen" />
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
<body onload="javascript:checkJoinButton('${leagueId}','${userId}')">
	<div class="colorstrip1">
		<div class="logout">
			<button id="logOut" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">logout</button>
		</div>
		<div class="joinleague">
			<button id="joinLeague" onclick="javascript:createTeam('${leagueId}','${userId}')" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width: 400px; font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">join league</button>
		</div>
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/league1pic.png" class="leagueimage">
			<div class="welcomemsg">
			<b></b>
			<b class="name">testname${name}</b>
			</div>
			<%-- <img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign"> --%>
<%-- 			<button id="joinLeague" onclick="javascript:createTeam('${leagueId}','${userId}')" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:70px;width: 200px;font-size:2em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif; position:absolute; right: 600px; ">join league</button> --%>
 		</div>
 		<div class="leagueinfo">
 			<div class="players">
 				<div class="colorstrip22">
 					<b>players</b>
 				</div>
 					<div class="playerlist">
 						<div class="content">
							  <div class="card" style="height:80px;">
							  	<div class="userimage">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;">user 1 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							      </div>
							      
							 </div>
						</div>
						<div class="content">
							  <div class="card" style="height:80px;">
							  	<div class="userimage">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;">user 2 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							      </div>
							 </div>
						</div>
						<div class="content">
							  <div class="card" style="height:80px;">
							  	<div class="userimage">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;">user 3 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							      </div>
							 </div>
						</div>
						<div class="content">
							  <div class="card" style="height:80px;">
							  	<div class="userimage">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;">user 4 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							      </div>
							 </div>
						</div>
						<div class="content">
							  <div class="card" style="height:80px;">
							  	<div class="userimage">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;">user 5 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							      </div>
							 </div>
						</div>
						<div class="content">
							  <div class="card" style="height:80px;">
							  	<div class="userimage">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;">user 6 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							      </div>
							 </div>
						</div>	
 					</div>
 				
 			</div> 
 			
 			<div class="previousgames">
 				<div class="colorstrip23">
 					<b>previous matches</b>
 						
 				</div>
 			</div> 
 			<div class="upcominggames">
 				<div class="colorstrip23">
 					<b>upcoming matches</b>
 						
 				</div>
 			</div> 			
	 	</div>
 		
 		<!-- <div class="colorstrip10"></div>
		<div class="colorstrip11"></div>
		<div class="colorstrip12"></div> -->
		<div class="colorstrip13">
			<b class="companybanner">a group 4 project ©</b>
		</div>
	</div>

	<script>
	$(document).ready(function(){
	      $('.carousel').carousel();
	    });
	
	$('.carousel.carousel-slider').carousel({fullWidth: true});
	
function checkJoinButton(leagueId,userId){
	$.ajax({
	    url : '/All-In-One-FantasyGame/checkLeagueMembership',
	    type: 'post',
	    data : {userId:userId,leagueId:leagueId},
	    
	    success: function(data)
	   
	    {	
	    	
	    	if(data == "true"){
	    	$('#joinLeague').hide();
	    	}
	    	
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("something went wrong.Contact Admin");
	    }
	});
}


function createTeam(leagueId,userId){
	
	var f = document.createElement("form");
	f.setAttribute('method',"post");
	f.setAttribute('action',"/All-In-One-FantasyGame/redirectToTeam");

	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"hidden");
	i.setAttribute('name',"leagueId");
	i.setAttribute('value',leagueId);
	f.appendChild(i);
	var j = document.createElement("input");
	j.setAttribute('type',"hidden");
	j.setAttribute('name',"userId");
	j.setAttribute('value',userId);
	f.appendChild(j);
	document.body.appendChild(f);
	console.log(f);
	f.submit();
	}
	
	</script>

</body>
</html>