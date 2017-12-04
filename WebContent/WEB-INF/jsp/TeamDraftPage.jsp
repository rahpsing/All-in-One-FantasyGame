<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team Dashboard</title>
<!--  ${pageContext.request.contextPath} - gives you path of the project -->
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/jQuery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/teamDraftPage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/redirectRequests.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/TeamDraftPage.css" media="screen" />
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
  #sortable1{
    border-bottom: 1px solid #000000;
    width: 300px;
    min-height: 50px;
    max-height: 700px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
  }
  #sortable2 {
    width: 300px;
    min-height: 20px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
  }
  #sortable1 li {
    margin: 0 5px 5px 0;
    padding-top: 5px;
    font-size: 1.5em;
    width: 300px;
    color: #000000;
	background-color: #ffffff;
  }
  #sortable2 li {
    margin: 0 5px 5px 0;
    padding: 5px;
    font-size: 2em;
    width: 300px;
    color: #000000;
    background-color: #ffffff;
  }
</style>
</head>
<body onload="javascript:onLoadCalls('${leagueId}','${userId}','${flag}')">
	<div class="colorstrip1">
		<div class="aiologo">
			<%-- <img src="${pageContext.request.contextPath}/resources/UIAssets/aiologo.svg" height="35px"> --%>
			<object type="image/svg+xml" data="${pageContext.request.contextPath}/resources/UIAssets/aiologo.svg" height="35px;"></object>
		</div>
		<button onclick="javascript:redirectToHomePage('${userId}')" class="allinonebanner">all-in-one</button>
		<div class="logout">
			<button onclick="javascript:deleteCookie()" id="logOut" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">logout</button>
		</div>
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/league1pic.png" class="userimage">
			<div class="welcomemsg" id="teamName">
				<b>team: </b>
				<b id="teamName1" class="name">${teamName}</b>
				<a class="btn-floating btn-large waves-effect waves-light" id="updateTeamNameButton" style="height:30px;width:30px;margin-top:-25px;background:rgba(255,255,255,0.1);">
					<div style="margin-top:-12px;">
						<i class="material-icons">edit</i>
					</div>
				</a>
			</div>
			<%-- <img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign"> --%>
 		</div>
 		<div id="editNameModal" class="editnamecss" style="display:none;">
			  	<form id="editNameButton" name="loginForm"  >
				    <input type="text" class="teamname" id="updateTeamName" name="teamname" style="color:#ffffff;font-size:2em;" placeholder="Enter your Team Name..." value='${teamName}'><br>
				    <!-- JS line 256<input class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width:30%;font-size:2em;text-transform: lowercase; top:-60px; left:500px;padding-top:5px;font-family:Raleway, sans-serif;" type="button" value="Submit" onclick="javascript:updatedTeamName()"/> -->
				</form>
		</div>
 		<!-- <div class="fixed-action-btn toolbar" >
		    <a class="btn-floating btn-large red" style="height:100px;width: 100px;bottom:50px;">
		      <i class="large material-icons" style="position:absolute;left:0px;background-color:#ffbf03;height:200px;padding-top:20px;">mode_edit</i>
		      <div style="position:absolute;top:-25px;left: -17.5px;background-color:#ffbf03;padding:50px;">
		      	<b>edit</b>
		      </div>
		    </a>
		    <ul>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;font-size:2.5em;"><a id="updateTeamNameButton">update team name</a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;font-size:2.5em;"><a id="editTeamButton">edit team</a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;"><a href="#!"><i class="material-icons">publish</i></a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;"><a href="#!"><i class="material-icons">attach_file</i></a></li>
		    </ul>
	  	</div> -->
 		<div class="teaminfo"> 
 			<div class="userteamoverlay" id="userTeamOverlay">
 				<div class="editbutton" style="width:80px;">
 					<button id="editTeamButton" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:2em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px;">edit team</button>
 				</div>
 			</div>
	 		<section id="player-lists">
				<div id="user-team" ondrop="dropPlayer(this, event,'${flag}')" ondragenter="return false" ondragover="return false">
			   <p style="color:#ffbf03;height:40px;font-size:3em;text-transform: lowercase;margin-top:-5px;font-family:'Raleway', sans-serif;">team</p>
			    <!--These are all the draggable peices-->
			    		
				</div>
			
				<div id="player-roster" ondrop="dropPlayer1(this, event)" ondragenter="return false" ondragover="return false" style="float:right;overflow-y:auto;">
			   		<p style="color:#ffbf03;height:40px;font-size:3em;text-transform: lowercase;margin-top:-5px;font-family:'Raleway', sans-serif;">player roster</p>
			   		<div class="search">
			   			<div style="float:left;width:295px;">
				      		<input id="searchText" autocomplete=off type="text" onkeyup="javascript:searchPlayerList()" name="search" class="searchTerm" style="width:100%;"placeholder="search for players">
				   		</div>
				   		<button class="clearsearch"><i class="material-icons center">close</i></button>
				   		<a class='dropdown-button btn' href='#' data-activates='dropdown1' style="position:absolute;color:#ffbf03;background-color:#ffffff;width:80px;margin-top:5px;margin-bottom:30px;margin-left:-37px;"><i class="material-icons center">edit</i> </a>
				    	<ul id='dropdown1' class='dropdown-content' style="text-align:center;margin-left:-20px;">
						    <li><a href="#!" style="color:#ffbf03;">forward</a></li>
						    <li class="divider"></li>
						    <li><a href="#!" style="color:#ffbf03;">midfielder</a></li>
						    <li class="divider"></li>
						    <li><a href="#!" style="color:#ffbf03;">defender</a></li>
						    <li class="divider"></li>
						    <li><a href="#!" style="color:#ffbf03;">goalie</a></li>
					 	 </ul>
			    	</div>
			    	<div id="rosterList" style="margin-top:80px;">
				    	<div draggable="true" class="player" id="player1" ondragstart="dragPlayer(this, event)">
				    		<div class="content1" style="margin-top:2px;">
								<div class="card1" style="height:40px;">
								  	<div class="userimage1">
								     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
								 	</div>
								 	<div class="playpositionindicator" style="background-color:#DC4444">
								 	</div>
								      <div class="profileinfo1">
								        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 1</p>
								        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
								      </div>
								</div>
						</div>
				    	</div>
						<a draggable="true" class="player" id="player2" ondragstart="dragPlayer(this, event)">
							<div class="content1" style="margin-top:2px;">
								<div class="card1" style="height:40px;">
								  	<div class="userimage1">
								     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
								 	</div>
								 	<div class="playpositionindicator" style="background-color:#A1EAFB">
								 	</div>
								      <div class="profileinfo1">
								        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 2</p>
								        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
								      </div>
								</div>
							</div>
						</a> 
						<a draggable="true" class="player" id="player3" ondragstart="dragPlayer(this, event)">
							<div class="content1" style="margin-top:2px;">
								<div class="card1" style="height:40px;">
								  	<div class="userimage1">
								     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
								 	</div>
								 	<div class="playpositionindicator" style="background-color:#CBF078">
								 	</div>
								      <div class="profileinfo1">
								        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 3</p>
								        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
								      </div>
								</div>
							</div>
						</a> 
						<a draggable="true" class="player" id="player4" ondragstart="dragPlayer(this, event)">
							<div class="content1" style="margin-top:2px;">
								<div class="card1" style="height:40px;">
								  	<div class="userimage1">
								     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
								 	</div>
								 	<div class="playpositionindicator" style="background-color:#F1BBF5">
								 	</div>
								      <div class="profileinfo1">
								        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 4</p>
								        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
								      </div>
								</div>
							</div>
						</a> 
						<a draggable="true" class="player" id="player5" ondragstart="dragPlayer(this, event)">
							<div class="content1" style="margin-top:2px;">
								<div class="card1" style="height:40px;">
								  	<div class="userimage1">
								     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
								 	</div>
								 	<div class="playpositionindicator" style="background-color:#5782BB">
								 	</div>
								      <div class="profileinfo1">
								        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 5</p>
								        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
								      </div>
								</div>
							</div>
						</a> 
						<a draggable="true" class="player" id="player6" ondragstart="dragPlayer(this, event)">
							<div class="content1" style="margin-top:2px;">
								<div class="card1" style="height:40px;">
								  	<div class="userimage1">
								     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
								 	</div>
								 	<div class="playpositionindicator" style="background-color:#FF8F56">
								 	</div>
								      <div class="profileinfo1">
								        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 6</p>
								        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
								      </div>
								</div>
							</div>
						</a> 	
					</div>
				</div>
				<div class="clear"></div>
			</section>
	 	</div>
 		<div style="position:absolute;display:none;top:307px; left:616px; width: 110px;" id="teamSaveButton">
					<input id="saveButton" onclick="javascript:sendPlayerList('${userId}','${leagueId}','${flag}')"class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width:100%;font-size:2em;text-transform: lowercase; padding-top:5px;font-family:'Raleway', sans-serif;" type="button" value="save" onclick=""/>				
		</div>
		<div class="teamlegends" style="font-size:15px;font-family:'Raleway', sans-serif;">
			<div class="legendtitle">team mix</div>
			<div id="legendCards">
				<div class="card1" style="height:40px;margin:5px;">
					<div class="playpositionindicator" style="background-color:#DC4444"></div>
					<div class="profileinfo1" style="margin-top:5px;display:inline-block;">
						<div style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player position 1</div>
						<div style="position:absolute;top:3px;font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;right:10px;">:    15</div>
					</div>
				</div>
				<div class="card1" style="height:40px;margin:5px;">
					<div class="playpositionindicator" style="background-color:#A1EAFB"></div>
					<div class="profileinfo1" style="margin-top:5px;display:inline-block;">
						<div style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player position 2</div>
						<div style="position:absolute;top:3px;font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;right:10px;">:    5</div>
					</div>
				</div>
				<div class="card1" style="height:40px;margin:5px;">
					<div class="playpositionindicator" style="background-color:#CBF078"></div>
					<div class="profileinfo1" style="margin-top:5px;display:inline-block;">
						<div style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player position 3</div>
						<div style="position:absolute;top:3px;font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;right:10px;">:    15</div>
					</div>
				</div>
				<div class="card1" style="height:40px;margin:5px;">
					<div class="playpositionindicator" style="background-color:#F1BBF5"></div>
					<div class="profileinfo1" style="margin-top:5px;display:inline-block;">
						<div style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player position 4</div>
						<div style="position:absolute;top:3px;font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;right:10px;">:    5</div>
					</div>
				</div>
				<div class="card1" style="height:40px;margin:5px;">
					<div class="playpositionindicator" style="background-color:#5782BB"></div>
					<div class="profileinfo1" style="margin-top:5px;display:inline-block;">
						<div style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player position 5</div>
						<div style="position:absolute;top:3px;font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;right:10px;">:    15</div>
					</div>
				</div>
				<div class="card1" style="height:40px;margin:5px;">
					<div class="playpositionindicator" style="background-color:#FF8F56"></div>
					<div class="profileinfo1" style="margin-top:5px;display:inline-block;">
						<div style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player position 6</div>
						<div style="position:absolute;top:3px;font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;right:10px;">:    5</div>
					</div>
				</div>
			</div>
			<div id="swapsLeftId" class="card1" style="height:40px;margin:5px;">
				<div class="profileinfo1" style="margin-top:5px;display:inline-block;">
					<div style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">swaps left</div>
					<div style="position:absolute;top:3px;font-size:1em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;right:10px;">:    15</div>
				</div>
			</div>
			<!-- <div id="position" style="margin-top:10px;margin-left:20px;width:200px;">
				<div>position 1 : 5</div>
				<div>position 2 : 4</div>
				<div>position 3 : 3</div>
				<div>position 4 : 1</div>
			</div>
			<div id="swapsLeft" class="swapsleft">
				<div>swaps left:1000</div>
			</div> -->
		</div>
 		<!-- <div class="colorstrip10"></div>
		<div class="colorstrip11"></div>
		<div class="colorstrip12"></div> -->
		<div class="colorstrip13">
			<b class="companybanner">a group 4 project ©</b>
		</div>
	</div>
	<div class="bgimage">
		<img src="${pageContext.request.contextPath}/resources/UIAssets/bgimage.jpg">
	</div>
	<script>
	/* New DRAG AND DROP SCRIPT , disregard all of my previous scripts. will edit it out later */
	var teamSaveButton = document.getElementById("teamSaveButton");
	var userTeamOverlay = document.getElementById("userTeamOverlay");
	var editNameModal = document.getElementById("editNameModal");
	var teamName = document.getElementById("teamName");	
	var editNameButton=document.getElementById("editNameButton");

	editTeamButton.onclick = function() {
		userTeamOverlay.style.display = "none";
		teamSaveButton.style.display = "block";
	}
	
	updateTeamNameButton.onclick = function(){
		editNameModal.style.display = "block";
		teamName.style.display = "none";
	}
	function onloadEditUserTeamName(leagueId,userId,flag){
		if(flag=="create"){
		editNameModal.style.display = "block";
		teamName.style.display = "none";
		}
		
		else{
			$('#editNameButton').append('<input class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width:30%;font-size:2em;text-transform: lowercase; top:-60px; left:500px;padding-top:5px;font-family:Raleway, sans-serif;" type="button" value="Submit" onclick="javascript:updatedTeamName()"/>');
			
		}
		
	}
	
	</script>
	<script>

	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script type="text/javascript">
	function populateTeam(userId,leagueId)
	{
		$.ajax({
			url : '/All-In-One-FantasyGame/userTeamList',
		    type: 'post',
		    data : {leagueId:leagueId,userId:userId},
		    dataType : 'json',
		    success: function(data){
		    	console.log(data);
		    	$('#user-team').empty();
		    	$('#user-team').append('<p style="color:#ffbf03;height:40px;font-size:3em;text-transform: lowercase;margin-top:-5px;font-family:"Raleway", sans-serif;">team</p>');
		    	$(data.usersTeam).each(function(index,value){
		    		var color=colorMap[value.role];
		    		$('#user-team').append('<a draggable="true" class="player" id='+value.id+'+123  ondragstart="dragPlayer(this, event)"><div class="content1" style="margin-top:2px;"><div class="card1" style="height:40px;"><div class="userimage1"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><div  class="profileinfo1"><div class="playpositionindicator" style="background-color:'+color+'"></div><p id='+value.id+' role = '+value.role+'  style="font-size:2em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">'+value.player+'</p></div></div></div></a>');
		    			initialUserTeam.push(value.id);})
		    	//fetchPlayerList(leagueId,'rosterList',userId);
		    			fetchCountsMap();
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	//alert("something went wrong.Contact Admin");
		    	//fetchPlayerList(leagueId,'rosterList',userId);
		    }
		});
		
		}
	function searchPlayerList(){
		var searchText=document.getElementById("searchText").value;
		$('#rosterList').empty();
		$(playerData.Players).each(
				function(index,value){var color=colorMap[value.role];
					if(value.role.toLowerCase().includes(playerType.toLowerCase())){
					if(value.player.toLowerCase().includes(searchText.toLowerCase())){
						$('#rosterList').append('<a draggable="true" class="player" id='+value.id+'+123 ondragstart="dragPlayer(this, event)"><div class="content1" style="margin-top:2px;"><div class="card1" style="height:40px;"><div class="userimage1"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><div  class="profileinfo1"><div class="playpositionindicator" style="background-color:'+color+'"></div><p id='+value.id+' role = '+value.role+' style="font-size:2em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">'+value.player+'</p></div></div></div></a>');
					}}
				})
		
	}
	function fetchPlayerList(leagueId,iD,userId){
		$.ajax({
		    url : '/All-In-One-FantasyGame/playerList',
		    type: 'post',
		    data : {leagueId:leagueId,userId:userId},
		    dataType : 'json',
		    success: function(data)
		    {	
		    	console.log(data);
		    	$('#'+iD).empty();
		    	//$('#'+iD).append('<p style="color:#ffbf03;height:40px;font-size:3em;text-transform: lowercase;margin-top:-5px;font-family:"Raleway", sans-serif;">player-roster</p>');
		    	$(data.Players).each(function(index,value){
		    		var color=colorMap[value.role];
		    		//console.log(color);
		    		$('#'+iD).append('<a draggable="true" class="player" id='+value.id+'+123 ondragstart="dragPlayer(this, event)"><div class="content1" style="margin-top:2px;"><div class="card1" style="height:40px;"><div class="userimage1"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><div class="playpositionindicator" style="background-color:'+color+'"></div><div  class="profileinfo1"><p id='+value.id+' role = '+value.role+' style="font-size:2em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">'+value.player+'</p></div></div></div></a>');})
		    	//console.log(JSON.stringify(data));
		    	passPlayerList(data);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	$('#'+iD).empty();
		 		
		    }
		});
	} 
	
	function passPlayerList(data){
		
		playerData=data;
		populateRoles(data);
		
	}
	
	function fillRulesandSwap(){
		$('#legendCards').empty();
		$('#swapsLeftId').empty();
		
		for (var key in modifiedCountsMap){
			color=colorMap[key];
			$('#legendCards').append('<div class="card1" style="height:40px;margin:5px;">'+
					'<div class="playpositionindicator" style="background-color:'+color+'"></div>'+
					'<div class="profileinfo1" style="margin-top:5px;display:inline-block;">'+
					'<div style="font-size:1em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">'+key+'</div>'+
					'<div style="position:absolute;top:3px;font-size:1em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;right:10px;">:    '+modifiedCountsMap[key]+'</div>'+
					'</div>'+
					'</div>');
		}
		$('#swapsLeftId').append('<div class="profileinfo1" style="margin-top:5px;display:inline-block;">'+
				'<div style="font-size:1em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">swaps left</div>'+
				'<div style="position:absolute;top:3px;font-size:1em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;right:10px;">:    '+swapsLeft+'</div>'+
				'</div>');
	}
	function populateRoles(data){
		$(playerData.Players).each(
				function(index,value){
					$('#dropdown1').empty();
					$('#dropdown1').append('<li><a onclick=javascript:playerTypeSearch("ALL") style="color:#ffbf03;">ALL</a></li><li class="divider"></li>');
					var ind=0;	
					var rolesList=[];
					var roles = $("#rosterList").find("p");
					
					for ( ind = 0; ind < roles.length; ind++ ) {
					  
					    rolesList.push($(roles[ind]).attr('role'));
					}
					
					var counts = {};
					for (var i = 0; i < rolesList.length; i++) {
		    			counts[rolesList[i]] = 1 + (counts[rolesList[i]] || 0);
					}
					for (var key in counts){
						$('#dropdown1').append('<li><a onclick=javascript:playerTypeSearch("'+key+'") style="color:#ffbf03;">'+key+'</a></li><li class="divider"></li>');
					}
				})
	}
		
</script>
</body>
</html>