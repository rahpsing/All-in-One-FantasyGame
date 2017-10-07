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
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip1"></div>
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/FootballImage2.jpeg" class="userimage">
			<div class="welcomemsg">
			<b>hello, </b>
			<b class="name">jason borne</b>
 		</div>
	</div>
</body>
</html>