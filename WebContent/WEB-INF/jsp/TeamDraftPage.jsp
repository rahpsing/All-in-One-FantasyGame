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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/TeamDraftPage.css" media="screen" />
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
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/league1pic.png" class="userimage">
			<div class="welcomemsg">
			<b>team: </b>
			<b class="name">${name}</b>
			</div>
			<img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign">
 		</div>
 		<div class="teaminfo">
			<div class="teamfield">
				<div class="position1">
					<div id="position1table" class="position1table">
						<!-- <b>position 1</b> -->
						<b1> </b1>
						<b id="teamplayer1" ondrop="drop(event)" ondragover="allowDrop(event)">player 1</b>
						<b1> </b1>
						<b id="teamplayer2" ondrop="drop(event)" ondragover="allowDrop(event)">player 2</b>
						<b1> </b1>
						<b id="teamplayer3" ondrop="drop(event)" ondragover="allowDrop(event)">player 3</b>
						<b1> </b1>
						<b id="teamplayer4" ondrop="drop(event)" ondragover="allowDrop(event)">player 4</b>
						<b1> </b1>
						<b id="teamplayer5" ondrop="drop(event)" ondragover="allowDrop(event)">player 5</b>
						<b1> </b1>
						<b id="teamplayer6" ondrop="drop(event)" ondragover="allowDrop(event)">player 6</b>
						<b1> </b1>
						<b id="teamplayer7" ondrop="drop(event)" ondragover="allowDrop(event)">player 7</b>
						<b1> </b1>
						<b id="teamplayer8" ondrop="drop(event)" ondragover="allowDrop(event)">player 8</b>
						<b1> </b1>
						<b id="teamplayer9" ondrop="drop(event)" ondragover="allowDrop(event)">player 9</b>
						<b1> </b1>
						<b id="teamplayer10" ondrop="drop(event)" ondragover="allowDrop(event)">player 10</b>
						<b1> </b1>
						<b id="teamplayer11" ondrop="drop(event)" ondragover="allowDrop(event)">player 11</b>
						<b1> </b1>
					</div>
				</div>
				<!-- <div class="position2">
					<div id="position2table" class="position2table">
						<b>position 2</b>
						<b>player 5</b>
						<b>player 6</b>
						<b>player 7</b>
						<b>player 8</b>
					</div>
				</div>-->
				<!-- <div class=position3>
					<div id="position3table" class="position3table">
						<b>position 3</b>
						<b>player 9</b>
						<b>player 10</b>
						<b>player 11</b>
						<b>player 12</b>
					</div>
				</div> -->
				<div class="editteam">
					<button id="editTeamButton" class="editteambutton">edit team</button>
				</div>
				<div class="saveteam">
					<button id="saveTeamButton" class="saveteambutton">save team</button>
				</div>
			</div>
			<div class="playerroster">
				<div class="playerrosterlist">
						<b id="player1" draggable="true" ondragstart="drag(event)">player a1</b>
						<b id="player2" draggable="true" ondragstart="drag(event)">player a2</b>
						<b id="player3" draggable="true" ondragstart="drag(event)">player a3</b>
						<b id="player4" draggable="true" ondragstart="drag(event)">player a4</b>
						<b id="player5" draggable="true" ondragstart="drag(event)">player a5</b>
						<b id="player6" draggable="true" ondragstart="drag(event)">player a6</b>
						<b id="player7" draggable="true" ondragstart="drag(event)">player a7</b>
						<b id="player8" draggable="true" ondragstart="drag(event)">player a8</b>
						<b id="player9" draggable="true" ondragstart="drag(event)">player a9</b>
						<b id="player10" draggable="true" ondragstart="drag(event)">player a10</b>
						<b id="player11" draggable="true" ondragstart="drag(event)">player a11</b>
						<b id="player12" draggable="true" ondragstart="drag(event)">player a12</b>
						<b id="player13" draggable="true" ondragstart="drag(event)">player a13</b>
						<b id="player14" draggable="true" ondragstart="drag(event)">player a14</b>
						<b id="player15" draggable="true" ondragstart="drag(event)">player a15</b>
						<b id="player16" draggable="true" ondragstart="drag(event)">player a16</b>
						<b id="player17" draggable="true" ondragstart="drag(event)">player a17</b>
						<b id="player18" draggable="true" ondragstart="drag(event)">player a18</b>
						<b id="player19" draggable="true" ondragstart="drag(event)">player a19</b>
						<b id="player20" draggable="true" ondragstart="drag(event)">player a20</b>
						<b id="player21" draggable="true" ondragstart="drag(event)">player a21</b>
						<b id="player22" draggable="true" ondragstart="drag(event)">player a22</b>
						<b id="player23" draggable="true" ondragstart="drag(event)">player a23</b>
						<b id="player24" draggable="true" ondragstart="drag(event)">player a24</b>		
				</div>
			</div>
			<div id="playerRosterOverlay" class="playerrosteroverlay"></div>
	
 			<!-- <p id="p1" draggable="true" ondragstart="dragstart_handler(event);">This element is draggable.</p>
 			
 			<div id="target" ondrop="drop_handler(event);" ondragover="dragover_handler(event);">Drop Zone</div> -->
			<div class="playerlist">
				
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
	var editTeamButton = document.getElementById("editTeamButton");
	
	editTeamButton.onclick = function() {
	    playerRosterOverlay.style.display = "none";
	    editTeamButton.style.display = "none";
	    saveTeamButton.style.display = "block";
	    $('#mydiv').children('b').each(function () {
	        alert(this.value); // "this" is the current element in the loop
	    });
	}
	
	saveTeamButton.onclick = function() {
		playerRosterOverlay.style.display = "block";
	    editTeamButton.style.display = "block";
	    saveTeamButton.style.display = "none";
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
	}

	

	
	</script>
</body>
</html>