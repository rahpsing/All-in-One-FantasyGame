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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<body onload="javascript:onLoadCalls('${leagueId}','${userId}')">
	<div class="colorstrip1">
		<button class="allinonebanner">all-in-one</button>
		<div class="logout">
			<button id="logOut" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">logout</button>
		</div>
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="ticker-wrap">
			<div class="ticker">
			  <div class="ticker__item" style="background-color:rgba(255,191,3,0.5);height:100%;width:250px;text-align:center;"><br><br><br><br><br><p>previous matches : </p><br></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> MUN</p><p  style="text-align:center;">05</p></div>
			  <div class="ticker__item" style="width:50px;text-align:center;"><p>vs.</p><br><p  style="text-align:center;">13</p></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> LIV</p><p  style="text-align:center;">2017</p></div>
			  <div class="ticker__item" style="background-color:#021A42;height:100%;width:10px;text-align:center;"><br><br><br><br><br><br><br><br><br><br><br></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> MUN</p><p  style="text-align:center;">06</p></div>
			  <div class="ticker__item" style="width:50px;text-align:center;"><p>vs.</p><br><p  style="text-align:center;">30</p></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> LIV</p><p  style="text-align:center;">2017</p></div>
			  <div class="ticker__item" style="background-color:#021A42;height:100%;width:10px;text-align:center;"><br><br><br><br><br><br><br><br><br><br><br></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> MUN</p><p  style="text-align:center;">07</p></div>
			  <div class="ticker__item" style="width:50px;text-align:center;"><p>vs.</p><br><p  style="text-align:center;">20</p></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> LIV</p><p  style="text-align:center;">2017</p></div>
			  <div class="ticker__item" style="background-color:rgba(255,191,3,0.5);height:100%;width:250px;text-align:center;"><br><br><br><br><br><p>current match : </p><br></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> MUN</p><p  style="text-align:center;">11</p></div>
			  <div class="ticker__item" style="width:50px;text-align:center;"><p>vs.</p><br><p  style="text-align:center;">25</p></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> LIV</p><p  style="text-align:center;">2017</p></div>
			  <div class="ticker__item" style="background-color:rgba(255,191,3,0.5);height:100%;width:250px;text-align:center;"><br><br><br><br><br><p>next matches : </p><br></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> MUN</p><p  style="text-align:center;">12</p></div>
			  <div class="ticker__item" style="width:50px;text-align:center;"><p>vs.</p><br><p  style="text-align:center;">24</p></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> LIV</p><p  style="text-align:center;">2017</p></div>
			  <div class="ticker__item" style="background-color:#021A42;height:100%;width:10px;text-align:center;"><br><br><br><br><br><br><br><br><br><br><br></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> MUN</p><p  style="text-align:center;">12</p></div>
			  <div class="ticker__item" style="width:50px;text-align:center;"><p>vs.</p><br><p  style="text-align:center;">29</p></div>
			  <div class="ticker__item" style="width:50px;"><br><div class="teamimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><br><p style="text-align:center;"> LIV</p><p  style="text-align:center;">2017</p></div>	  	
			</div>
		</div>
		<div class="colorstrip2">
			<div class="welcomemsg">
				<b></b>
				<b class="name">testname${name}</b>
			</div>
			<div id="updateGameScores" style="float:right;">
				<button id="updateGameScoresButton" onclick="" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:45px;font-size:2em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:300px;positon:absolute;top:15px;right:175px;border-radius:10px;padding-right:20px;">update game points</button>
			</div>
		</div>
 		<div class="leagueinfo">
 			<div class="players">
 				<div class="colorstrip22">
 					<div class="joinleague" id="joinLeagueDiv">
 						<b style="margin-left:10px;">players</b>
						<button id="joinLeague" onclick="javascript:createTeam('${leagueId}','${userId}','create')" class="waves-effect waves-light btn" style="border-radius:10px;background-color:#021A42;height:50px;width: 200px; font-size:0.5em;text-transform: lowercase;margin-top:-7px;margin-left:425px;font-family:'Raleway', sans-serif;">join league</button>
					</div>
 				</div>
 					<div id="populateUserList" class="playerlist">
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
							  	<div class="userimage" style="right:160px;">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;">user 1 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							      </div>
							      <div id="removeUserDiv" style="float:right;">
									<button id="removeUserButton" onclick="" class="waves-effect waves-light btn" style="background-color:#c50234;height:45px;font-size:2em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-70px;right:0px;border-radius:10px;padding-right:105px;">remove</button>
								</div>
							 </div>
						</div>
						
						
							
 					</div>
 				
 			</div> 
 			<div id="myTeamId" class="myteam">
 				<div class="colorstrip23">
 					<b style="margin-left:10px;">my team</b>
 					<div class="editteam" id="editTeamDiv">
						<button id="editTeam" onclick="javascript:createTeam('${leagueId}','${userId}','edit')" class="waves-effect waves-light btn" style="background-color:#021A42;height:40px;font-size:0.4em;text-transform: lowercase;padding-bottom:10px;font-family:'Raleway', sans-serif;width:90px;positon:absolute;top:-50px;left:290px;border-radius:10px">edit</button>
					</div>
 				</div>
 				<div id = "populateUserTeam" class="content1" style="margin-top:2px;">
						  <!-- Changes must be done on line 154<div class="card1" style="height:40px;">
							  	<div class="userimage1">
							     	<img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/>
							 	</div>
							      <div class="profileinfo1">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; color:#000000;margin-top:3px;">player 1</p>-->
							        <!-- <p class="bio1" style="font-size: 1em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p> -->
							      <!-- </div>
						</div> -->
						
						
					</div>
 			</div> 	
 			<!-- <div class="fixed-action-btn">
    			<a class="btn-floating btn-large red ">
			      <i class="large material-icons" style="position:absolute;left:0px;background-color:#ffbf03;height:200px;">mode_edit</i>
			    </a>
			    <ul>
			      <li><a class="btn-floating yellow darken-1" href="#"><i class="material-icons">format_quote</i></a><p style="color:#ffffff;position:absolute;top:0px;left:-100px;">edit league members</p></li>
			      <li><a class="btn-floating green" href="#"><i class="material-icons">publish</i></a><p style="color:#ffffff;position:absolute;top:60px;left:-100px;">update weekly points</p></li>
			      <li><a class="btn-floating blue" href="#"><i class="material-icons">attach_file</i></a><p style="color:#ffffff;position:absolute;top:110px;left:-98px;">edit your team</p></li>
			    </ul>
  			</div> -->	
  			<!-- <div class="fixed-action-btn toolbar" >
		    <a class="btn-floating btn-large red" style="height:100px;width: 100px;bottom:50px;">
		      <i class="large material-icons" style="position:absolute;left:0px;background-color:#ffbf03;height:200px;padding-top:20px;">mode_edit</i>
		      <div style="position:absolute;top:-25px;left: -17.5px;background-color:#ffbf03;padding:50px;">
		      	<b>edit</b>
		      </div>
		    </a>
		    <ul>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;font-size:2.5em;"><a href="#!">edit league members</a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;font-size:2.5em;"><a href="#!">upload weekly points</a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;font-size:2.5em;"><a href="#!">edit your team</a></li>
		      <li class="waves-effect waves-light"  style="background-color:#ffbf03;"><a href="#!"><i class="material-icons">attach_file</i></a></li>
		    </ul>
	  	</div>	 -->
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
	<div id="uploadPlayerImageModal" class="uploadplayerimagemodalcss">
		 	<!-- Modal content -->
		  	<div id="uploadPlayerImageContent" class="uploadplayerimage-modal-content">
		  		<div class="modalcolorstrip1">
		  			<b style="font-family:'Raleway', sans-serif;font-size:2.5em;padding-top:10px;">upload player images</b>
		  		</div>
		  		<div style="display:inline-block;height:600px;overflow-y:auto;margin-top:20px;width:80%;">
			  		<div class="content" style="width:100%;">
						<div class="card" style="height:50px;text-align:left;margin-left:20px;">
							<div class="profileinfo">
							    <p style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;">player 1 name</p>
							    <div id="uploadDPDiv">
									<button id="uploadDPButton" onclick="" class="waves-effect waves-light btn" style="background-color:#021A42;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-45px;left:390px;border-radius:10px;padding-right:80px;">upload</button>
								</div>
							</div>		      
						</div>
					</div>
					<div class="content" style="width:100%;">
						<div class="card" style="height:50px;text-align:left;margin-left:20px;">
							<div class="profileinfo">
							    <p style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;">player 2 name</p>
							    <div id="uploadDPDiv">
									<button id="uploadDPButton" onclick="" class="waves-effect waves-light btn" style="background-color:#021A42;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-45px;left:390px;border-radius:10px;padding-right:80px;">upload</button>
								</div>
							</div>		      
						</div>
					</div>
		  		</div>
		  	</div>
	</div>
	<div id="uploadGameScoreModal" class="uploadgamescoremodalcss">
		 	<!-- Modal content -->
		  	<div id="uploadGameScoreContent" class="uploadgamescore-modal-content">
		  		<div class="modalcolorstrip1">
		  			<b style="font-family:'Raleway', sans-serif;font-size:2.5em;padding-top:10px;">upload game points</b>
		  		</div>
		  		<div style="display:inline-block;height:270px;overflow-y:auto;margin-top:20px;width:95%;">
			  		<div class="content" style="width:100%;">
						<div class="card" style="height:50px;text-align:left;margin-left:20px;">
							<div class="profileinfo">
							    <p style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;">MUN vs. LIV</p>
							    <div id="downloadTemplateDiv">
									<button id="downloadTemplateButton" onclick="" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:325px;positon:absolute;top:-45px;left:250px;border-radius:10px;padding-right:20px;">download match template</button>
								</div>
							    <div id="uploadScoreDiv">
									<button id="uploadScoreButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-80px;left:582.5px;border-radius:10px;padding-right:80px;">upload</button>
								</div>
								<div id="abandonMatchDiv">
									<button id="abandonMatchButton" onclick="" class="waves-effect waves-light btn" style="background-color:#c50234;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:120px;positon:absolute;top:-115px;left:700px;border-radius:10px;padding-right:50px;">abandon match</button>
								</div>
							</div>		      
						</div>
					</div>
					<div class="content" style="width:100%;">
						<div class="card" style="height:50px;text-align:left;margin-left:20px;">
							<div class="profileinfo">
							    <p style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;">MUN vs. CHE</p>
							    <div id="downloadTemplateDiv">
									<button id="downloadTemplateButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:325px;positon:absolute;top:-45px;left:250px;border-radius:10px;padding-right:20px;">download match template</button>
								</div>
							    <div id="uploadScoreDiv">
									<button id="uploadScoreButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-80px;left:582.5px;border-radius:10px;padding-right:80px;">upload</button>
								</div>
								<div id="abandonMatchDiv">
									<button id="abandonMatchButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#c50234;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:120px;positon:absolute;top:-115px;left:700px;border-radius:10px;padding-right:50px;">abandon match</button>
								</div>
							</div>		      
						</div>
					</div>
					<div class="content" style="width:100%;">
						<div class="card" style="height:50px;text-align:left;margin-left:20px;">
							<div class="profileinfo">
							    <p style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;">MUN vs. ARS</p>
							    <div id="downloadTemplateDiv">
									<button id="downloadTemplateButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:325px;positon:absolute;top:-45px;left:250px;border-radius:10px;padding-right:20px;">download match template</button>
								</div>
							    <div id="uploadScoreDiv">
									<button id="uploadScoreButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-80px;left:582.5px;border-radius:10px;padding-right:80px;">upload</button>
								</div>
								<div id="abandonMatchDiv">
									<button id="abandonMatchButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#c50234;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:120px;positon:absolute;top:-115px;left:700px;border-radius:10px;padding-right:50px;">abandon match</button>
								</div>
							</div>		      
						</div>
					</div>
					<div class="content" style="width:100%;">
						<div class="card" style="height:50px;text-align:left;margin-left:20px;">
							<div class="profileinfo">
							    <p style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;">MUN vs. MNC</p>
							    <div id="downloadTemplateDiv">
									<button id="downloadTemplateButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:325px;positon:absolute;top:-45px;left:250px;border-radius:10px;padding-right:20px;">download match template</button>
								</div>
							    <div id="uploadScoreDiv">
									<button id="uploadScoreButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-80px;left:582.5px;border-radius:10px;padding-right:80px;">upload</button>
								</div>
								<div id="abandonMatchDiv">
									<button id="abandonMatchButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#c50234;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:120px;positon:absolute;top:-115px;left:700px;border-radius:10px;padding-right:50px;">abandon match</button>
								</div>
							</div>		      
						</div>
					</div>
					<div class="content" style="width:100%;">
						<div class="card" style="height:50px;text-align:left;margin-left:20px;">
							<div class="profileinfo">
							    <p style="font-size:1em;font-family:'Raleway', sans-serif; color:#000000;">MUN vs. EVE</p>
							    <div id="downloadTemplateDiv">
									<button id="downloadTemplateButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:325px;positon:absolute;top:-45px;left:250px;border-radius:10px;padding-right:20px;">download match template</button>
								</div>
							    <div id="uploadScoreDiv">
									<button id="uploadScoreButton1" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#ffbf03;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:100px;positon:absolute;top:-80px;left:582.5px;border-radius:10px;padding-right:80px;">upload</button>
								</div>
								<div id="abandonMatchDiv">
									<button id="abandonMatchButton" onclick="" class="waves-effect waves-light btn disabled" style="background-color:#c50234;height:35px;font-size:1em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:120px;positon:absolute;top:-115px;left:700px;border-radius:10px;padding-right:50px;">abandon match</button>
								</div>
							</div>		      
						</div>
					</div>
		  		</div>
		  		<div id="doneButton" class="donebuttondiv">
					<button  onclick="" class="waves-effect waves-light btn" style="background-color:#021A42;height:35px;font-size:1.5em;text-transform: lowercase;font-family:'Raleway', sans-serif;width:120px;positon:absolute;bottom:-10px;right:-370px;border-radius:10px;padding-right:30px;">done</button>
				</div>
		  	</div>
	</div>
	<div id="uploadGameScoreModalLoader" class="uploadgamescoremodalloadercss">
		 	<!-- Modal content -->
		  	<div id="uploadGameScoreLoaderContent" class="uploadgamescore-modal-content" style="background-color: rgba(255,255,255,0.7);">
		  		<div class="preloader-wrapper big active" style="margin-top:150px;">
			      <div class="spinner-layer spinner-blue">
			        <div class="circle-clipper left">
			          <div class="circle"></div>
			        </div><div class="gap-patch">
			          <div class="circle"></div>
			        </div><div class="circle-clipper right">
			          <div class="circle"></div>
			        </div>
			      </div>
			
			      <div class="spinner-layer spinner-red">
			        <div class="circle-clipper left">
			          <div class="circle"></div>
			        </div><div class="gap-patch">
			          <div class="circle"></div>
			        </div><div class="circle-clipper right">
			          <div class="circle"></div>
			        </div>
			      </div>
			
			      <div class="spinner-layer spinner-yellow">
			        <div class="circle-clipper left">
			          <div class="circle"></div>
			        </div><div class="gap-patch">
			          <div class="circle"></div>
			        </div><div class="circle-clipper right">
			          <div class="circle"></div>
			        </div>
			      </div>
			
			      <div class="spinner-layer spinner-green">
			        <div class="circle-clipper left">
			          <div class="circle"></div>
			        </div><div class="gap-patch">
			          <div class="circle"></div>
			        </div><div class="circle-clipper right">
			          <div class="circle"></div>
			        </div>
			      </div>
   				</div>
		  	</div>
	</div>
	<script>
	var updateGameScoresButton = document.getElementById("updateGameScoresButton");
	var uploadGameScoreModal = document.getElementById("uploadGameScoreModal");
	var doneButton = document.getElementById("doneButton");
	
	updateGameScoresButton.onclick = function(){
		uploadGameScoreModal.style.display = "block";
	    mainDiv.classList.add("blur");
	}
	
	doneButton.onclick = function(){
		uploadGameScoreModal.style.display = "none";
	    mainDiv.classList.remove("blur");
	}
function onLoadCalls(leagueId,userId){
	checkJoinButton(leagueId,userId);
	populateUserTeams(leagueId,userId);
	fetchGames(leagueId);
}

function fetchGames(leagueId){
	
}
function populateUserTeams(leagueId,userId){
	$.ajax({
		url : '/All-In-One-FantasyGame/fetchUserTeams',
	    type: 'post',
	    data : {leagueId:leagueId},
	    dataType : 'json',
	    success: function(data){
	    	//alert(data);
	    	$('#populateUserList').empty();
	    	console.log("done1");
	    	console.log(data);	
	    	$(data.userTeam).each(function(index,value){$('#populateUserList').append('<div class="content"><div class="card" style="height:80px;"><div class="userimage"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><div class="profileinfo"><p style="font-size:2em;font-family:Raleway, sans-serif; color:#000000;">'+value.userName+'</p><p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:"Raleway", sans-serif; ">points : '+value.points+'</p></div></div></div>');})
	    	console.log("done2");
	    	populateTeam(userId,leagueId);
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("something went wrong.Contact Admin");
	    }
	});
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
	    	$('#populateUserTeam').empty();
	    	$(data.usersTeam).each(function(index,value){$('#populateUserTeam').append('<div class="card1" style="height:40px;"><div class="userimage1"><img class="circle responsive-img" src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg"/></div><div class="profileinfo1"><p style="font-size:2em;font-family:Raleway, sans-serif; color:#000000;margin-top:3px;">'+value.player+'</p></div></div>');})

	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("something went wrong.Contact Admin");
	    }
	});
	}
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
	    	else
	    		{
	    		$('#myTeamId').hide();
	    		}
	    	
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("something went wrong.Contact Admin");
	    }
	});
}


function createTeam(leagueId,userId,flag){
	
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
	var k = document.createElement("input");
	k.setAttribute('type',"hidden");
	k.setAttribute('name',"flag");
	k.setAttribute('value',flag);
	f.appendChild(k);
	document.body.appendChild(f);
	console.log(f);
	f.submit();
	}
	
	</script>

</body>
</html>