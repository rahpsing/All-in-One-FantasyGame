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
			<img src="${pageContext.request.contextPath}/resources/UIAssets/FootballImage2.jpeg" class="userimage">
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
 			<div class="usermenu">
	 			<button id="editProfile" class="editprofile">profile</button>
	 			<button id="createLeague" class="createleague">create league</button>
	 			<button id="stats" class="stats">statistics</button>
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
</body>
</html>