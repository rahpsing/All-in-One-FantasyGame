<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Dashboard</title>
<!--  ${pageContext.request.contextPath} - gives you path of the project -->
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/jQuery.min.js"></script>
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
			<img src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg" class="userimage">
			<div class="welcomemsg">
			<b>hello, </b>
			<b class="name">${name}</b>
			</div>
			<img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign">
 		</div>
 		<div class="userinfo">
 			<div class="colorstrip21">
	 			<form action="javascript:void(0);">	
	 				<input id="searchText" class="searchbar" type="text" onkeyup="javascript:sendFetchLikeReq('searchResultList','searchText')"name="search" placeholder="search...">
	 			</form>
	 			<b class="searchdisc">find custom leagues</b>
	 		</div>
 			<div id="leagueList" class="leaguelist">
		 		<div class="systemleagueslist">
		 			<div class="colorstrip22">
		 				<b> leagues </b>
		 			</div>
		 			<div class="dropdown">
	  					<button class="dropbtn1" onmouseover="javascript:sendFetchReq('SOCCER','systemSoccerLeagues','dashboard')">Soccer</button>
					 	<div id="systemSoccerLeagues" class="dropdown-content">
						    
					 	</div>
					 </div>
					 <div class="dropdown">
					 	<button class="dropbtn2" onmouseover="javascript:sendFetchReq('CRICKET','systemLeagues','dashboard')">Cricket</button>
					 	<div id="systemLeagues" class="dropdown-content">
						   
					 	</div>
					</div>
		 		</div>
		 		<div class="userleagueslist">
		 			<div class="dropdown">
	  					<button class="dropbtn">
	  						<b>Cricket</b>
	  					</button>
					 	<div class="dropdown-content">
						    <a href="#">League 1</a>
						    <a href="#">League 2</a>
						    <a href="#">League 3</a>
					 	</div>
					 </div>
					 <div class="dropdown">
					 	<button class="dropbtn">User sport 2</button>
					 	<div class="dropdown-content">
						    <a href="#">League 1</a>
						    <a href="#">League 2</a>
						    <a href="#">League 3</a>
					 	</div>
					</div>
		 		</div>
	 		</div>
	 		<div id="searchResult" class="searchresult">
	 			<div class="searchresultlist">
			 		<div class="colorstrip22">
			 			<b> search results </b>
			 			<button id="closeSearch" class="closesearch">x</button>
			 		</div>
			 		<div id="searchResultList" class="scrollresult">
			 			
			 		</div>
			 	</div>
	 		</div>
 			<div class="usermenu">
	 			<button id="editProfile" class="editprofile">profile</button>
	 			<button id="createLeague" class="createleague">create league</button>
	 			<button id="Stats" class="stats">statistics</button>
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
		 				<b class="footballhbanner">soccer</b>
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
	<div id="profilePageModal" class="profilepagemodalcss">
		 	<!-- Modal content -->
		  	<div id="profilePageContent" class="profilepage-modal-content">
		  		<div style="padding-top:100px;">
		  			<img src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg" class="profileimage"><br>
		  		
		  			
		  			<div id="userProfileInfo" class="userprofileinfo">

					  	<b>user Name:         </b><b>${name}</b><br>
					  	<b>email:			  </b><b>${emailID}</b><br>

					 </div>
					 <button id="updateProfileImage" class="updateprofileimage">update profile image</button><br><br>
		  				<input id="imageUpload" class="file-upload" type="file" accept="image/*"/>
				  	<button id="closeProfile" class="closeprofilebutton">close profile</button>
				</div>
		  	</div>
	</div>
	<script>
	var mainDiv = document.getElementById("mainDiv");
	var profileButton = document.getElementById("editProfile");
	var profilePageModal = document.getElementById("profilePageModal");
	var closeProfileButton = document.getElementById("closeProfile");
	var closeSearchButton = document.getElementById("closeSearch");
	var searchResultDiv = document.getElementById("searchResult");
	var leagueListDiv = document.getElementById("leagueList");
	
	/* window.onclick = function(event) {
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
	} */
	
	profileButton.onclick = function() {
	    profilePageModal.style.display = "block";
	    mainDiv.classList.add("blur");
	}
	
	closeProfileButton.onclick = function() {
		profilePageModal.style.display = "none";
	    mainDiv.classList.remove("blur");
	}
	
	closeSearchButton.onclick = function() {
		searchResultDiv.style.display = "none";
		leagueListDiv.style.display = "block";
	}
	
	var updateProfileDiv = document.getElementById("updateProfileImage");
	var fileUploadDiv = document.getElementById("imageUpload");
	

	updateProfileDiv.onclick = function() {
		 readURL(fileUploadDiv);
	}
	
	
	    var readURL = function(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();

	            reader.onload = function (e) {
	                $('.uploadprofileimage').attr('src', e.target.result);
	            }
	    
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	    

	    $(".file-upload").on('change', function(){
	        readURL(this);
	    });
	    
	    $(".updateprofileimage").on('click', function() {
	       $(".fileUpload").click();
	       readURL(this);
	    });


	function fetchLeagues() {
		jQuery.ajax({
			
		    url : "All-In-OneFantasyGame/fetchLeagues",
		    type: "POST",
		    data : {},
		    success: function(data, textStatus, jqXHR)
		    {
		        //data - response from server
		        jQuery("#selectedRestaurants").html(data);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		 		console.log(errorThrown);
		    }
		});
		}
	
	</script>
	
<script>
function sendFetchReq(sportName,iD,value){
	$.ajax({
	    url : '/All-In-One-FantasyGame/fetchLeagues',
	    type: 'post',
	    data : {SPORT_NAME:sportName,VALUE:value},
	    dataType : 'json',
	    success: function(data)
	    {	$('#'+iD).empty();
	    	$(data.League).each(function(index,value){$('#'+iD).append('<a onclick=javascript:redirectLeague(\''+value.id+'\') >'+value.League+'</a>');})
	    	$('#'+iD).append('<a href="#" style="background-color: #ffbf03">create a new private league ></a>');
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	$('#'+iD).empty();
	 		$('#'+iD).append('<a href="#" >No Leagues></a>');
			$('#'+iD).append('<a href="#" style="background-color: #ffbf03">create a new private league ></a>');
	    }
	});
}
</script>

<script>
function sendFetchLikeReq(iD,value){
	searchResultDiv.style.display = "block";
	leagueListDiv.style.display = "none";
	var searchTxt=document.getElementById('searchText').value;
	if(searchTxt.length>0){
		console.log(searchTxt.length);
	$.ajax({
	    url : '/All-In-One-FantasyGame/fetchLeagues',
	    type: 'post',
	    data : {SPORT_NAME:searchTxt,VALUE:value},
	    dataType : 'json',
	    success: function(data)
	   
	    {	
	    	$('#'+iD).empty();
	    	$(data.League).each(function(index,value){$('#'+iD).append('<a onclick=javascript:redirectLeague(\''+value.id+'\') >'+value.League+'</a>');})
	    	
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	$('#'+iD).empty();
	 		$('#'+iD).append('<a href="#" >No Leagues></a>');
			$('#'+iD).append('<a href="#" style="background-color: #ffbf03">No leagues found with this name ></a>');
	    }
	});
	}
	else{
		$('#'+iD).empty();
	}
}
</script>
<script>
function redirectLeague(valueId){
console.log("Came here1" +valueId );
var f = document.createElement("form");
f.setAttribute('method',"post");
f.setAttribute('action',"/All-In-One-FantasyGame/redirectLeague");

var i = document.createElement("input"); //input element, text
i.setAttribute('type',"hidden");
i.setAttribute('name',"SEARCH_TEXT");
i.setAttribute('value',valueId);
f.appendChild(i);
document.body.appendChild(f);
f.submit();
}
</script>

</body>
</html>