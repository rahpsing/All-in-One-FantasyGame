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
			<b>league: </b>
			<b class="name">${name}</b>
			</div>
			<img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign">
 		</div>
 		<div class="leagueinfo">
 			<div class="players">
 				<div class="colorstrip22">
 					<b>players</b>
 					<div class="playerlist">
 						<a>user 1</a>
 						<a>user 2</a>
 						<a>user 3</a>
 						<a>user 4</a>
 						<a>user 5</a>
 						<a>user 6</a>
 						<a>user 7</a>
 						<a>user 8</a>
 						<a>user 9</a>
 						<a>user 10</a>
 						<a>user 11</a>
 						<a>user 12</a>
 						<a>user 13</a>
 						<a>user 14</a>
 					</div>
 				</div>
 			</div> 
 			<div class="leaderboard">
 				<div class="colorstrip23">
 					<b>top players</b>
 					<div class="leaderboardlist">
 						<a>user 1</a>
 						<a>user 2</a>
 						<a>user 3</a>
 					</div>
 				</div>
 			</div> 
 			<div class="upcominggames">
 				<div class="colorstrip23">
 					<b>upcoming matches</b>
 					<div class="upcominggameslist">
 						<a>team 1 v team 2</a>
 						<a>team 2 v team 3</a>
 						<a>team 3 v team 1</a>
 						<a>team 1 v team 2</a>
 						<a>team 2 v team 3</a>
 						<a>team 3 v team 1</a>
 						<a>team 1 v team 2</a>
 						<a>team 2 v team 3</a>
 						<a>team 3 v team 1</a>
 						<a>team 1 v team 2</a>
 						<a>team 2 v team 3</a>
 						<a>team 3 v team 1</a>
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
	


	
	
	</script>

</body>
</html>