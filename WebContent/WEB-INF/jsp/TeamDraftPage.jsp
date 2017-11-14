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
<body onload="javascript:fetchPlayerList('${leagueId}','sortable2')">
	<div class="colorstrip1">
		<div class="logout">
			<button id="logOut" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">logout</button>
		</div>
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/league1pic.png" class="userimage">
			<div class="welcomemsg">
			<b>team: </b>
			<b class="name">${name}</b>
			</div>
			<%-- <img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign"> --%>
 		</div>
 		<div class="fixed-action-btn toolbar" >
		    <a class="btn-floating btn-large red" style="height:100px;width: 100px;bottom:50px;">
		      <i class="large material-icons" style="position:absolute;top:20px;left:0px;">mode_edit</i>
		    </a>
		    <ul>
		      <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">insert_chart</i></a></li>
		      <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">format_quote</i></a></li>
		      <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">publish</i></a></li>
		      <li class="waves-effect waves-light"><a href="#!"><i class="material-icons">attach_file</i></a></li>
		    </ul>
	  	</div>
 		<div class="teaminfo"> 
	 		<section id="player-lists">
				<div id="user-team" ondrop="dropPlayer(this, event)" ondragenter="return false" ondragover="return false">
			    <p>team</p>
			    <!--These are all the draggable peices-->
			    		
				</div>
			
				<div id="player-roster" ondrop="dropPlayer(this, event)" ondragenter="return false" ondragover="return false">
			    <p>player roster</p>
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
					<a draggable="true" class="player" id="player3" ondragstart="dragPlayer(this, event)">
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
	}
	</script>
	<script>

	var editTeamButton = document.getElementById("editTeamButton");
	var teamNameEditForm = document.getElementById("teamNameEdit");
	/*var teamInfoBanner = document.getElementById("teamInfoBanner");*/
	
	editTeamButton.onclick = function() {
	    /* playerRosterOverlay.style.display = "none"; */
	    editTeamButton.style.display = "none";
	    saveTeamButton.style.display = "block";
	    teamNameEditForm.style.display = "block";
	    /*teamInfoBanner.style.display = "block";*/
	    playerRoaster.style.display = "block";
		position1table.sortable();
		position1table.disableSelection();
		
	}
	
	function saveTeamButtonOnClick(leagueId,userId) {
		/* playerRosterOverlay.style.display = "block"; */
	    editTeamButton.style.display = "block";
	    saveTeamButton.style.display = "none";
	    teamNameEditForm.style.display = "none";
	    /*teamInfoBanner.style.display = "none";*/
	    /*playerRoaster.style.display = "none";*/
	    console.log("Hi Prash  " + leagueId);
	    console.log("Hi Prash " + userId);
	    sendPlayerList(userId,leagueId);
	}
	
	function allowDrop(ev) {
	    ev.preventDefault();
	}

	function drag(ev) {
	    ev.dataTransfer.setData("newPlayerName", ev.target.id);
	}

	function drop(ev) {
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("newPlayerName");
	    ev.target.removeChild(ev.target.childNodes[0]);
	    ev.target.appendChild(document.getElementById(data));
	    ev.targert.draggable( 'disable' );
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

	function fetchPlayerList(leagueId,iD){
		$.ajax({
		    url : '/All-In-One-FantasyGame/playerList',
		    type: 'post',
		    data : {LEAGUE_ID:leagueId},
		    dataType : 'json',
		    success: function(data)
		    {	
		    	console.log(data);
		    	$('#'+iD).empty();
		    	$(data.Players).each(function(index,value){$('#'+iD).append('<li id='+value.id+'   class="ui-state-highlight">'+value.player+'</a>');})
		    	
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	$('#'+iD).empty();
		 		
		    }
		});
	}

	function sendPlayerList(userId,leagueId){
		var ind=0;	
		var listOfPlayerIds=[];
		var listItems = $("#sortable1").find("li");
		for ( ind = 0; ind < listItems.length; ind++ ) {
		    console.log($(listItems[ind]).attr('id'));
		    listOfPlayerIds.push($(listItems[ind]).attr('id'));
		}
		console.log(listOfPlayerIds);
		console.log(listOfPlayerIds.length);
		if(listOfPlayerIds.length < 11 ){
			alert("Please select atleast 11 players")
		}
		else if(listOfPlayerIds.length > 11){
			alert("Please select 11 players only")
		}
		else{
			listOfPlayerIds=JSON.stringify(listOfPlayerIds);
			console.log("Thanks");
			$.ajax({
			    url : '/All-In-One-FantasyGame/createTeam',
			    type: 'post',
			    data : {userId:userId,leagueId:leagueId,listOfPlayerIds:listOfPlayerIds},
			    
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
	
	

		var f = document.createElement("form");
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
		f.submit();
		
</script>
</body>
</html>