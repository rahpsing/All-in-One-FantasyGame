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
		<div class="logout">
			<button id="logOut" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">logout</button>
		</div>
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/league1pic.png" class="userimage">
			<div class="welcomemsg" id="teamName">
			<b>team: </b>
			<b id="teamName1" class="name">${teamName}</b>
			</div>
			<%-- <img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign"> --%>
 		</div>
 		<div id="editNameModal" class="editnamecss" style="display:none;">
			  	<form name="loginForm"  >
				    <input type="text" class="teamname" id="teamName" name="teamname" style="color:#ffffff;font-size:2em;" placeholder="Update Team Name..." value='${teamName}'><br>
				    <input class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width:30%;font-size:2em;text-transform: lowercase; top:-60px; left:500px;font-family:'Raleway', sans-serif;" type="button" value="Submit" onclick="javascript:validateLoginForm()"/>
				</form>
		</div>
 		<div class="fixed-action-btn toolbar" >
		    <a class="btn-floating btn-large red" style="height:100px;width: 100px;bottom:50px;">
		      <!-- <i class="large material-icons" style="position:absolute;left:0px;background-color:#ffbf03;height:200px;padding-top:20px;">mode_edit</i> -->
		      <div style="position:absolute;top:-25px;left: -17.5px;background-color:#ffbf03;padding:50px;">
		      	<b>edit</b>
		      </div>
		    </a>
		    <ul>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;font-size:2.5em;"><a id="updateTeamNameButton">update team name</a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;font-size:2.5em;"><a id="editTeamButton">edit team</a></li>
		      <!-- <li class="waves-effect waves-light"  style="background-color:#ffbf03;"><a href="#!"><i class="material-icons">publish</i></a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;"><a href="#!"><i class="material-icons">attach_file</i></a></li> -->
		    </ul>
	  	</div>
 		<div class="teaminfo"> 
	 		<section id="player-lists">
				<div id="user-team" ondrop="dropPlayer(this, event)" ondragenter="return false" ondragover="return false">
			   <p style="color:#ffbf03;height:40px;font-size:3em;text-transform: lowercase;margin-top:-5px;font-family:'Raleway', sans-serif;">team</p>
			    <!--These are all the draggable peices-->
			    		
				</div>
			
				<div id="player-roster" ondrop="dropPlayer1(this, event)" ondragenter="return false" ondragover="return false">
			   	<p style="color:#ffbf03;height:40px;font-size:3em;text-transform: lowercase;margin-top:-5px;font-family:'Raleway', sans-serif;">player roster</p>
			    	<div draggable="true" class="player" id="player1" ondragstart="dragPlayer(this, event)">
			    		<div class="content1" style="margin-top:2px;">
							<div class="card1" style="height:40px;">
							  	<div class="userimage1">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
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
							      <div class="profileinfo1">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 2</p>
							        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
							      </div>
							</div>
						</div>
					</a> 
					<a draggable="true" class="player" id="player3" ondragstart="dragPlayer(this, event)" style="overflow-y:auto;">
						<div class="content1" style="margin-top:2px;">
							<div class="card1" style="height:40px;">
							  	<div class="userimage1">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
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
							      <div class="profileinfo1">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 6</p>
							        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
							      </div>
							</div>
						</div>
					</a> 	
				</div>
				<div class="clear"></div>
			</section>
	 	</div>
 		<div style="position:absolute;display:none;top:500px; right:200px; width: 200px;" id="teamSaveButton">
					<input onclick="javascript:sendPlayerList('${userId}','${leagueId}','${flag}')"class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;width:100%;font-size:2em;text-transform: lowercase; font-family:'Raleway', sans-serif;" type="button" value="save" onclick=""/>
		</div>
 		<!-- <div class="colorstrip10"></div>
		<div class="colorstrip11"></div>
		<div class="colorstrip12"></div> -->
		<div class="colorstrip13">
			<b class="companybanner">a group 4 project ©</b>
		</div>
	</div>
	<script>
	/* New DRAG AND DROP SCRIPT , disregard all of my previous scripts. will edit it out later */
	function dragPlayer(player, event) {
	    event.dataTransfer.setData('Players', player.id);
	    
	}
	function dropPlayer(target, event) {
	    var player = event.dataTransfer.getData('Players');
	   	target.appendChild(document.getElementById(player)); 
		var ind=0;	
		var listOfPlayerIds=[];
		var listItems = $("#user-team").find("p");
		listItems.splice(0,1);
		for ( ind = 0; ind < listItems.length; ind++ ) {
		   // console.log($(listItems[ind]).attr('id'));
		    listOfPlayerIds.push($(listItems[ind]).attr('id'));
		}
		//console.log(listItems[0]);
		//console.log(listOfPlayerIds);
		//console.log(listOfPlayerIds.length+"Here ");
		
		
		if(listOfPlayerIds.length > 11){
			alert("Please select 11 players only")
			
			document.getElementById("player-roster").append(document.getElementById(player));
			//target.removeChild(document.getElementById(player));
			
			
		}
		
		else{
			var ind=0;	
			var rolesList=[];
			var roles = $("#user-team").find("p");
			roles.splice(0,1);
			for ( ind = 0; ind < roles.length; ind++ ) {
			  // console.log($(listItems[ind]).attr('id'));
			    rolesList.push($(roles[ind]).attr('role'));
			}
			console.log(rolesList+"here 1");
			//console.log(rolesList.length);
			var counts = {};
			for (var i = 0; i < rolesList.length; i++) {
    			counts[rolesList[i]] = 1 + (counts[rolesList[i]] || 0);
			}
			console.log(counts);
			for (var key in counts){
				console.log(key);
				if(!key.includes("eeper")){
					if(counts[key]>4){
						alert("Only four "+key);
						document.getElementById("player-roster").append(document.getElementById(player));
					}
					
				}
				else{
					if(counts[key]>2){
						alert("Only two "+ key);
						document.getElementById("player-roster").append(document.getElementById(player));
					}
				}
			}
		}
	}
	function dropPlayer1(target,event){
		var player = event.dataTransfer.getData('Players');
		target.appendChild(document.getElementById(player));
	}
	</script>
	<script>

	var updateTeamNameButton = document.getElementById("updateTeamNameButton");
	var teamNameEditForm = document.getElementById("teamNameEdit");
	var playerRoster = document.getElementById("player-roster");
	var userTeam = document.getElementById("user-team");
	var editNameModal = document.getElementById("editNameModal");
	var teamName = document.getElementById("teamName");	
	var teamSaveButton = document.getElementById("teamSaveButton");
	
	editTeamButton.onclick = function() {
		playerRoster.style.display = "block";
		teamSaveButton.style.display = "block";
	}
	
	updateTeamNameButton.onclick = function(){
		editNameModal.style.display = "block";
		teamName.style.display = "none";
	}
	

	

	
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script type="text/javascript">
   	$( function() {
   	 $( "#sortable1, #sortable2" ).sortable({
   	   connectWith: ".connectedSortable"
   	 }).disableSelection();
  	} );
	function onLoadCalls(leagueId,userId,flag){
		populateTeam(userId,leagueId);
		fetchPlayerList(leagueId,'player-roster',userId);
	}
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
		    	$(data.usersTeam).each(function(index,value){$('#user-team').append('<a draggable="true" class="player" id='+value.id+'+123  ondragstart="dragPlayer(this, event)"><div class="content1" style="margin-top:2px;"><div class="card1" style="height:40px;"><div class="userimage1"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><div  class="profileinfo1"><p id='+value.id+' role = '+value.role+'  style="font-size:2em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">'+value.player+'</p></div></div></div></a>');})
		    	//fetchPlayerList(leagueId,'player-roster',userId);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	//alert("something went wrong.Contact Admin");
		    	//fetchPlayerList(leagueId,'player-roster',userId);
		    }
		});
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
		    	$('#'+iD).append('<p style="color:#ffbf03;height:40px;font-size:3em;text-transform: lowercase;margin-top:-5px;font-family:"Raleway", sans-serif;">player-roster</p>');
		    	$(data.Players).each(function(index,value){$('#'+iD).append('<a draggable="true" class="player" id='+value.id+'+123 ondragstart="dragPlayer(this, event)"><div class="content1" style="margin-top:2px;"><div class="card1" style="height:40px;"><div class="userimage1"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><div  class="profileinfo1"><p id='+value.id+' role = '+value.role+' style="font-size:2em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">'+value.player+'</p></div></div></div></a>');})
		    	
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	$('#'+iD).empty();
		 		
		    }
		});
	} 

	function sendPlayerList(userId,leagueId,flag){
		//var teamName=document.getElementById("teamName").value;
		//var teamName=('#teamName').val();
		//alert(teamName);
		var ind=0;	
		var listOfPlayerIds=[];
		var rolesList=[];
		var listItems = $("#user-team").find("p");
		listItems.splice(0,1);
		for ( ind = 0; ind < listItems.length; ind++ ) {
		    console.log($(listItems[ind]).attr('id'));
		    listOfPlayerIds.push($(listItems[ind]).attr('id'));
		    rolesList.push($(listItems[ind]).attr('role'));
		}
		
		//console.log(rolesList.length);
		var counts = {};
		for (var i = 0; i < rolesList.length; i++) {
			counts[rolesList[i]] = 1 + (counts[rolesList[i]] || 0);
		}
		console.log(Object.keys(counts).length);
		var countOfRoles=Object.keys(counts).length;
		
		if(listOfPlayerIds.length < 11 ){
			alert("Please select atleast 11 players")
		}
		else if(listOfPlayerIds.length > 11){
			alert("Please select 11 players only")
		}
		else if(teamName==""){
			alert("Please Enter Team name.")
		}
		else if(countOfRoles<4){
			alert("Select atleast one of each type")
		}
		else{
			
			listOfPlayerIds=JSON.stringify(listOfPlayerIds);
			console.log("Thanks");
			$.ajax({
			    url : '/All-In-One-FantasyGame/createTeam',
			    type: 'post',
			    data : {userId:userId,leagueId:leagueId,listOfPlayerIds:listOfPlayerIds,flag:flag},
			    
			    success: function(data)
			   
			    {	
			    	if (data=="true")
			    	var f = document.createElement("form");
					f.setAttribute('method',"post");
					f.setAttribute('action',"/All-In-One-FantasyGame/redirectLeague");

					var i = document.createElement("input"); //input element, text
					i.setAttribute('type',"hidden");
					i.setAttribute('name',"redirectValue");
					i.setAttribute('value',leagueId);
					f.appendChild(i);
					var j = document.createElement("input");
					j.setAttribute('type',"hidden");
					j.setAttribute('name',"userId");
					j.setAttribute('value',userId);
					f.appendChild(j);
					var k = document.createElement("input");
					k.setAttribute('type',"hidden");
					k.setAttribute('name',"flag");
					k.setAttribute('value',flag);
					f.appendChild(k);
					document.body.appendChild(f);
					console.log(f);
					f.submit();
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("something went wrong.Contact Admin");
			    }
			});
		}
	}
	
	

	/*	var f = document.createElement("form");
		f.setAttribute('method',"post");
		f.setAttribute('action',"/All-In-One-FantasyGame/redirectLeague");

		var i = document.createElement("input"); //input element, text
		i.setAttribute('type',"hidden");
		i.setAttribute('name',"redirectValue");
		i.setAttribute('value',valueId);
		f.appendChild(i);
		var j = document.createElement("input");
		j.setAttribute('type',"hidden");
		j.setAttribute('name',"userId");
		j.setAttribute('value',userId);
		f.appendChild(j);
		document.body.appendChild(f);
		console.log(f);
		f.submit();*/
		
</script>
</body>
</html>