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

button.accordion {
    background-color: #ffbf03;
    color: #ffffff;
    font-family:"Helvetica Neue"; ;
    font-weight: bold; 
    cursor: pointer;
    height: 50px;
    width: 100%;
    border: none;
    text-align: center;
    outline: none;
    font-size: 30px;
    transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: #c50234; 
}

div.panel {
    display: none;
    background-color: white;
    position: relative;
	text-align: center;
	max-height: 180px;
	overflow-y: auto;
}
div.panel button {
	height: 50px;
	width: 100%;
	color: #ffffff;
    font-family:"Helvetica Neue"; ;
    font-weight: bold; 
    cursor: pointer;
    font-size: 30px;
    background-color: #ffd867;
    border: none;
}
</style>
</head>
<body onload="javascript:sendAllFetch('${userId}')">
	<div class="colorstrip1">
		<button class="allinonebanner">all-in-one</button>
		<div class="aiologo">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/aiologo.pdf" height="35px">
		</div>
			<!--<tr>
				<b>aaaaa</b>
				<b>bbbbb</b>
			</tr>-->
		<div class="higlightsbutton">
			<button id="higlightsButton" class="waves-effect waves-light btn" href="#Highlights" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">highlights</button>
		</div>
		<div class="editprofile">
			<button id="editProfile" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">profile</button>
		</div>
		<div class="logout">
			<button id="logOut" class="waves-effect waves-light btn" style="background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;">logout</button>
		</div>
	</div>
	<div id="mainDiv" class="maindiv">
		<div class="colorstrip2">
			<img src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg" class="userimage">
			<div class="welcomemsg">
				<b>hello, </b>
				<b class="name">${name}</b>
			</div>
			<div class="creatediv">
				<a class='dropdown-button btn' href='#' data-activates='dropdown1' style="width: 300px;height: 50px;padding-top:7px;background-color:#ffbf03;font-size:2.5em;text-transform: lowercase;font-family:'Raleway', sans-serif;">create</a>
				<ul id='dropdown1' class='dropdown-content'>
				    <li><a id="createLeagueButton" style="color:#ffbf03;font-size:2.5em;">league</a></li>
				    <li class="divider"></li>
				    <li><a id="createSportButton" style="color:#ffbf03;font-size:2.5em;">sport</a></li>
				 </ul>
			</div>
			<%-- <img src="${pageContext.request.contextPath}/resources/UIAssets/bannerdesign.png" class="bannerdesign"> --%>
 		</div>
 		<div class="userinfo">
 			<div class="colorstrip21">
	 			<form action="javascript:void(0);">	
	 				<%-- <input id="searchText" class="searchbar" type="text" autocomplete=off onkeyup="javascript:sendFetchLikeReq('searchResultList','searchText','${userId}')"name="search" placeholder="search for leagues"> --%>
	 			<div class="wrap">
				   <div class="search">
				      <input id="searchText" autocomplete=off type="text" onkeyup="javascript:sendFetchLikeReq('searchResultList','searchText','${userId}')"name="search" class="searchTerm" placeholder="search for leagues">
				      <!-- <button type="submit" class="searchButton" style="background-color:#ffbf03;width:100px;">
				        <i class="fa fa-search"></i>
				        <p>search</p>
				     </button> -->
				   </div>
				</div>
	 			</form>
	 			<!-- <b class="searchdisc">search leagues</b> -->
	 		</div>
 			<div id="leagueList" class="leaguelist">
		 		<div class="systemleagueslist">
		 			<div class="colorstrip22">
		 				<b style="font-family:'Raleway', sans-serif;"> leagues </b>
		 			</div>
					<ul class="collapsible" data-collapsible="accordion">
					  <li>
					    <div class="collapsible-header" style="font-size:2em;font-family:'Raleway', sans-serif; ">
					      soccer
					      <span id="systemSoccerLeaguesNumber" class="badge"></span></div> <!-- replace with number of leagues in list -->
					      <div id="systemSoccerLeagues" class="collapsible-body" style="overflow:auto; max-height:500px;">
					      	
						  </div>
					  </li>
					  <li>
					    <div class="collapsible-header" style="font-size:2em;font-family:'Raleway', sans-serif; ">
					      cricket
					      <span id="systemLeaguesNumber" class="badge"></span></div>
					      <div id="systemLeagues" class="collapsible-body" style="overflow:auto; max-height:500px;">
					      	<div class="content">
							  <div class="card" style="height:80px;cursor:pointer;">
							      <div class="profileinfo">
							        <p style="font-size:2em;font-family:'Raleway', sans-serif; ">league 1 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:'Raleway', sans-serif; ">deatils 11  13</p>
							        <div class="aiologo2">
							    		<img src="${pageContext.request.contextPath}/resources/UIAssets/aiologo.pdf" height="55px">
							    	</div>
							      </div>
							    </div>
							  </div>
							</div>
					  </li>
					</ul>
		 		</div>

	 		</div>
	 		<div id="searchResult" class="searchresult">
	 			<div class="searchresultlist">
			 		<div class="colorstrip22">
			 			<b> search results </b>
			 			<button id="closeSearch" class="waves-effect waves-light btn" style="position:absolute; right:10px;background-color:#021A42;height:50px;width: 130px;font-size:0.7em;text-transform: lowercase;padding-top:-25px;margin-top:5px;border-radius:5px;text-align:center;">close</button>
			 		</div>
			 		<div id="searchResultList" class="scrollresult">
			 			<div class="content">
							<div class="card" style="height:80px;">
								<div class="profileinfo">
							        <p style="font-size:2em;">league 1 name</p>
							        <p class="bio" style="font-size: 1.5em;margin-top:-20px;">deatils 11  13</p>
							    </div>
							</div>
						</div>
			 		</div>
			 	</div>
	 		</div>
	 	</div>
 		<div id="Highlights" class="highlights">
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
 		<!-- <div class="colorstrip10"></div>
		<div class="colorstrip11"></div>
		<div class="colorstrip12"></div> -->
		<div class="colorstrip13" style="background-color:#ffbf03">
			<b class="companybanner">a group 4 project ©</b>
		</div>
	</div>
	<div class="bgimage">
		<img src="${pageContext.request.contextPath}/resources/UIAssets/bgimage.jpg">
	</div>
	<div id="profilePageModal" class="profilepagemodalcss">
		 	<!-- Modal content -->
		  	<div id="profilePageContent" class="profilepage-modal-content">
		  		<div class="closebutton">
		  			<button id="closeProfile" class="waves-effect waves-light btn" style="background-color:#021A42;height:50px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;">X</button>
		  		</div>
		  		<div class="profileheader">
		  			<b class="profilebanner">user profile</b>
		  		</div>
		  		<div style="padding-top:20px;">
		  			<img src="${pageContext.request.contextPath}/resources/UIAssets/user1.jpeg" class="profileimage"><br>
		  		
		  			
		  			<div id="userProfileInfo" class="userprofileinfo">

					  <%-- 	<b  class="formfieldname">user name</b><input id="xxx" class="inputform" type="text" placeholder='${name}'><br> --%>
					  	<b  class="formfieldname">first name</b><input id="firstNameUpdate" class="inputform" type="text" style="width: 80%;" value='${firstName}'><br>
					  	<b class="formfieldname">last name</b><input id="lastNameUpdate" class="inputform" type="text" style="width: 80%;" value='${lastName}'><br>
					  	<b class="formfieldname">email</b><input id="emailUpdate" class="inputform" type="text" style="width: 80%;" value='${emailId}'><br>
						<b class="formfieldname">mobile number</b><input id="phoneNumberUpdate" class="inputform" type="tel"  style="width: 80%;" value='${phoneNumber}'><br>
						
					 </div>
					<button id="updateProfileImage" class="waves-effect waves-light btn" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;">update profile image</button><br><br>
		  			<input id="imageUpload" style="margin-left:80px;margin-bottom:20px;" class="file-upload" type="file" onchange="readURL(this);" accept="image/*"/>
		  			<button id="saveProfile" onclick="javascript:sendUpdateProfileReq('${userId}')" class="waves-effect waves-light btn" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;">save profile</button>
				</div>
		  	</div>
	</div>
	<div id="createLeagueModal" class="createleaguemodalcss">
		 	<!-- Modal content -->
		  	<div id="createLeagueContent" class="createleague-modal-content">
		  		<div class="modalcolorstrip1">
		  			<b style="font-family:'Raleway', sans-serif;font-size:2.5em;padding-top:10px;">create league</b>
		  		</div>
		  		<div style="display:block;">
			  		<div style="display:inline-block;margin-top:30px;float:left;margin-left:110px;">
			  			<b style="font-family:'Raleway', sans-serif;font-size:1.5em;">sport : </b>
			  		</div>
			  		<div id="sportOption" class="input-field col s12" style="float:right;width:60%;height:15px;margin-right:20px;margin-top:20px;">
					    <select>
					      <option value="" disabled selected>Choose your option</option>
					      <option value="soccer">soccer</option>
					      <option value="cricket">cricket</option>
					    </select>
					</div>
			  		<div style="display:inline-block;margin-top:100px;float:left;margin-left:-80px;">
			  			<b style="font-family:'Raleway', sans-serif;font-size:1.5em;">roster : </b>
			  		</div>
			  		<div id="rosterOption" class="input-field col s12" style="float:right;width:60%;height:15px;margin-right:20px;margin-top:55px;">
					    <select>
					      <option value="" disabled selected>Choose your option</option>
					      <option value="epl">epl</option>
					      <option value="laliga">la liga</option>
					    </select>
					</div>
			  		<div style="display:inline-block;margin-top:135px;float:left;margin-left:-166px;">
			  			<b style="font-family:'Raleway', sans-serif;font-size:1.5em;">league name : </b>
			  		</div>
			  		<div style="float:right;width:60%;height:15px;margin-right:20px;margin-top:55px;">
			  			<input placeholder="league name" id="userLeagueName" type="text">
			  		</div>
		  		</div>
		  		<div class="cancelbutton1">
					<button id="cancelButton1" class="waves-effect waves-light btn" href="#Highlights" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">cancel</button>
				</div>
				<div class="donebutton1">
					<button id="doneButton1" class="waves-effect waves-light btn" href="#Highlights" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">done</button>
				</div>
		  	</div>
	</div>
	<div id="createSportModal" class="createsportmodalcss">
		 	<!-- Modal content -->
		  	<div id="createSportContent" class="createsport-modal-content">
		  		<div class="modalcolorstrip1">
		  			<b style="font-family:'Raleway', sans-serif;font-size:2.5em;padding-top:10px;">create sport</b>
		  		</div>
		  		<div style="display:block;">
			  		<div style="display:inline-block;margin-top:30px;float:left;margin-left:70px;">
			  			<b style="font-family:'Raleway', sans-serif;font-size:1.5em;">sport name : </b>
			  		</div>
			  		<div style="float:right;width:60%;height:15px;margin-right:20px;margin-top:25px;">
			  			<input placeholder="sport name" id="userSportName" type="text">
			  		</div>
			  		<div style="display:inline-block;margin-top:100px;float:left;margin-left:-144px;">
			  			<b style="font-family:'Raleway', sans-serif;font-size:1.5em;">define roles : </b>
			  		</div>
		  		</div>
		  		<div class="rolesdiv" id="rolesDiv">
				  	<input placeholder="new role" type="text" style="float:left;width:100%;height:30px;">
				</div>
				<div class="addroles">
					<a id="addRoles" class="btn-floating btn-large waves-effect waves-light #ffbf03" style=""><i class="material-icons" style="background-color:#ffbf03">add</i></a>
		  		</div>
		  		<div class="cancelbutton2">
					<button id="cancelButton2" class="waves-effect waves-light btn" href="#Highlights" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">cancel</button>
				</div>
				<div class="nextbutton1">
					<button id="nextButton1" class="waves-effect waves-light btn" href="#Highlights" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">next</button>
				</div>
		  	</div>
	</div>
	<div id="createSportLeagueModal" class="createsportleaguemodalcss">
		 	<!-- Modal content -->
		  	<div id="createSportLeagueContent" class="createsportleague-modal-content">
		  		<div class="modalcolorstrip1">
		  			<b style="font-family:'Raleway', sans-serif;font-size:2.5em;padding-top:10px;">create sport</b>
		  		</div>
		  		<div style="display:block;">
			  		<div style="display:inline-block;margin-top:45px;float:left;margin-left:36px;">
			  			<b style="font-family:'Raleway', sans-serif;font-size:1.5em;">league name : </b>
			  		</div>
			  		<div style="float:right;width:60%;height:15px;margin-right:20px;margin-top:35px;">
			  			<input placeholder="league name" id="userLeagueName" type="text">
			  		</div>
		  		</div>
		  		<div class="downloadbutton">
					<button id="downloadButton" class="waves-effect waves-light btn" href="#Highlights" style="width:100%;background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">download template</button>
				</div>
				<div class="uploadbutton">
					<button id="uploadButton" class="waves-effect waves-light btn" href="#Highlights" style="width:100%;background-color:#ffbf03;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">upload template</button>
				</div>
		  		<div class="cancelbutton3">
					<button id="cancelButton3" class="waves-effect waves-light btn" href="#Highlights" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">cancel</button>
				</div>
				<div class="donebutton2">
					<button id="doneButton2" class="waves-effect waves-light btn" href="#Highlights" style="background-color:#021A42;height:40px;font-size:1.5em;text-transform: lowercase;padding-top:2.5px;font-family:'Raleway', sans-serif;border-radius:5px">done</button>
				</div>
		  	</div>
	</div>
	<div id="createSportLeagueModalLoader" class="createsportleaguemodalloadercss">
		 	<!-- Modal content -->
		  	<div id="createSportLeagueLoaderContent" class="createsportleague-modal-content" style="background-color: rgba(255,255,255,0.7);">
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
     $(document).ready(function() {
        $('select').material_select();
    });
 	</script>
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;
		
		for (i = 0; i < acc.length; i++) {
		    acc[i].onclick = function(){
		        this.classList.toggle("active");
		        var panel = this.nextElementSibling;
		        if (panel.style.display === "block") {
		            panel.style.display = "none";
		        } else {
		            panel.style.display = "block";
		        }
		    }
		}
	</script>
	<script>
	
	var mainDiv = document.getElementById("mainDiv");
	var profileButton = document.getElementById("editProfile");
	var profilePageModal = document.getElementById("profilePageModal");
	var closeProfileButton = document.getElementById("closeProfile");
	var closeSearchButton = document.getElementById("closeSearch");
	var searchResultDiv = document.getElementById("searchResult");
	var leagueListDiv = document.getElementById("leagueList");
	var createLeagueButton = document.getElementById("createLeagueButton");
	var createLeagueModal = document.getElementById("createLeagueModal");
	var createSportButton = document.getElementById("createSportButton");
	var cancelButton1 = document.getElementById("cancelButton1");
	var cancelButton2 = document.getElementById("cancelButton2");
	var cancelButton3 = document.getElementById("cancelButton3");
	var addRoles = document.getElementById("addRoles");
	var rolesDiv = document.getElementById("rolesDiv");
	var createSportContent = document.getElementById("createSportContent");
	var nextButton1 = document.getElementById("nextButton1");
	var createSportLeagueModal = document.getElementById("createSportLeagueModal");
	
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
	
	createLeagueButton.onclick = function() {
		createLeagueModal.style.display = "block";
	    mainDiv.classList.add("blur");
	}
	
	cancelButton1.onclick = function() {
		createLeagueModal.style.display = "none";
		mainDiv.classList.remove("blur");
	}
	
	createSportButton.onclick = function() {
		createSportModal.style.display = "block";
	    mainDiv.classList.add("blur");
	}
	
	cancelButton2.onclick = function() {
		createSportModal.style.display = "none";
		mainDiv.classList.remove("blur");
	}
	closeSearchButton.onclick = function() {
		searchResultDiv.style.display = "none";
		leagueListDiv.style.display = "block";
	}
	
	addRoles.onclick = function() {
		/* rolesDiv.appendChild(contentRolesDiv); */
		rolesDiv.insertAdjacentHTML('BeforeEnd', '<input placeholder="new role" type="text" style="float:left;width:100%;height:30px;">');
	}
	
	
	nextButton1.onclick = function() {
		createSportModal.style.display = "none";
		createSportLeagueModal.style.display = "block";
	}
	
	cancelButton3.onclick = function() {
		createSportLeagueModal.style.display = "none";
		mainDiv.classList.remove("blur");
	}
	
	var updateProfileDiv = document.getElementById("updateProfileImage");
	var fileUploadDiv = document.getElementById("imageUpload");
	

 	updateProfileDiv.onclick = function() {
 		fileUploadDiv.style.display="block";	 
	} 
	
	
	    var readURL = function(input) {
	    	fileUploadDiv.style.display="none";
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();

	            reader.onload = function (e) {
	                $('.profileimage').attr('src', e.target.result);
	            }
	    
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	    

	    /* $(".file-upload").on('change', function(){
	    	
	        readURL(this);
	    });
	     */
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
function sendAllFetch(userId){
	console.log("Success 1");
	sendFetchReq('CRICKET','systemLeagues','dashboard',userId);
	//alert("going next");
	sendFetchReq('SOCCER','systemSoccerLeagues','dashboard',userId);
}
function sendFetchReq(sportName,iD,value,userId){console.log(userId);
	$.ajax({
	    url : '/All-In-One-FantasyGame/fetchLeagues',
	    type: 'post',
	    data : {SPORT_NAME:sportName,VALUE:value},
	    dataType : 'json',
	    success: function(data)
	    {	$('#'+iD).empty();
	    	//alert("Please" + sportName);
	    	
	    	var count = 0;
	    	$(data.League).each(function(index,value){$('#'+iD).append('<div onclick=javascript:redirectLeague(\''+value.id+'\',\''+userId+'\') class="content" style="cursor:pointer;"><div class="card" style="height:80px;"><div class="profileinfo"><p style="font-size:2em;font-family:Raleway, sans-serif; ">'+value.League+'</p><p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:"Raleway", sans-serif; ">Users : '+value.numOfPlayers+'</p></div></div></div>');count++;})
	 		$('#'+iD).append('<div  class="content"><div class="card" style="height:80px;"><div class="profileinfo"><p style="font-size:2em;font-family:"Raleway", sans-serif; ">create league</p><p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:"Raleway", sans-serif; "></div></div></div>');
	    	document.getElementById(iD+"Number").innerHTML=count;
	    	console.log(count);
	    	console.log(Object.keys(value).length);
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	$('#'+iD).empty();
	    	document.getElementById(iD+"Number").innerHTML="0";
	 		$('#'+iD).append('<div  class="content"><div class="card" style="height:80px;"><div class="profileinfo"><p style="font-size:2em;font-family:"Raleway", sans-serif; ">create league</p><p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:Raleway, sans-serif; "></div></div></div>');
	    	
	    }
	});
}
</script>

<script>
function sendFetchLikeReq(iD,value,userId){console.log(userId);
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
	    	
	    	//$(data.League).each(function(index,value){$('#'+iD).append('<div onclick=javascript:redirectLeague(\''+value.id+'\',\''+userId+'\') class="profileinfo"><p style="font-size:2em;font-family:"Raleway", sans-serif; ">'+value.League+'</p><p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:"Raleway", sans-serif; ">Users : '+value.numOfPlayers+'</p></div></div>');})
			$(data.League).each(function(index,value){$('#'+iD).append('<div onclick=javascript:redirectLeague(\''+value.id+'\',\''+userId+'\') class="content" style="cursor:pointer;"><div class="card" style="height:80px;"><div class="profileinfo"><p style="font-size:2em;">'+value.League+'</p><p class="bio" style="font-size: 1.5em;margin-top:-20px;">Users : '+value.numOfPlayers+'</p></div></div></div>');})
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	$('#'+iD).empty();
	 		//$('#'+iD).append('<a class="cricket" href="#" >No Leagues></a>');
			//$('#'+iD).append('<a class="cricket" href="#" style="background-color: #ffbf03">No leagues found with this name ></a>');
	    	$('#'+iD).append('<div  class="content"><div class="card" style="height:80px;"><div class="profileinfo"><p style="font-size:2em;font-family:"Raleway", sans-serif; ">No Leagues found with this name</p><p class="bio" style="font-size: 1.5em;margin-top:-20px;font-family:"Raleway", sans-serif; "></div></div></div>');

	    }
	});
	}
	else{
		$('#'+iD).empty();
	}
}
</script>
<script>
function redirectLeague(valueId,userId){

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
}
</script>

<script>

function sendUpdateProfileReq(userId){
		
		
		var email=document.getElementById('emailUpdate').value;
		var phoneNumber=document.getElementById('phoneNumberUpdate').value;
		var firstName=document.getElementById('firstNameUpdate').value;
		var lastName=document.getElementById('lastNameUpdate').value;
		
		$.ajax({
		    url : '/All-In-One-FantasyGame/updateUser',
		    type: 'post',
		    data : {userId:userId,email:email,phoneNumber:phoneNumber,firstName:firstName,lastName:lastName},
		    
		    success: function(data)
		   
		    {	
		    	alert(data);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("something went wrong.Contact Admin");
		    }
		});
}
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
</body>
</html>