
	
	var teamNameEditForm = document.getElementById("teamNameEdit");
	var playerRoster = document.getElementById("player-roster");
	var userTeam = document.getElementById("user-team");
	var initialUserTeam=[];
	var revisedUserTeam=[];
	var swapsOrig;
	var swapsLeft;
	var score;
	var saveButton = document.getElementById("saveButton");
	var playerData="";
	var globalleagueId;
	var globaluserId;
   	
	function updatedTeamName(){
		
		var updatedName=document.getElementById("updateTeamName").value;
		
		$.ajax({
			url : '/All-In-One-FantasyGame/updateTeamName',
		    type: 'post',
		    data : {leagueId:globalleagueId,userId:globaluserId,updateTeamName:updatedName},
		    
		    success: function(data){
		    	
		    	if(data=="true"){
		    		alert("Team Name Updated");
		    			}
		    	else{
		    		alert("Please try again");
		    	}
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	
		    	alert("Team name not updated.Please try again ");
		    }
		});
		
	}
	
	function dragPlayer(player, event) {
	    event.dataTransfer.setData('Players', player.id);
	    
	}
	function dropPlayer1(target,event){
		var player = event.dataTransfer.getData('Players');
		target.appendChild(document.getElementById(player));
		countRoles();
	}
	function dropPlayer(target, event,flag) {
	    var player = event.dataTransfer.getData('Players');
	   	target.appendChild(document.getElementById(player)); 
		var ind=0;	
		var swapsUsed;
		var listOfPlayerIds=[];
		var listItems = $("#user-team").find("p");
		console.log(listItems);
		listItems.splice(0,1);
		for ( ind = 0; ind < listItems.length; ind++ ) {
		   // console.log($(listItems[ind]).attr('id'));
		    listOfPlayerIds.push($(listItems[ind]).attr('id'));
		   
		}
		
		
		if(listOfPlayerIds.length > 11){
			alert("Please select 11 players only")
			
			document.getElementById("rosterList").append(document.getElementById(player));
			//target.removeChild(document.getElementById(player));
			
			
		}
		if(flag=="edit")
		{
		swapsUsed=diffInUserTeams();
		}
		else{
			swapsUsed=0;
		}
		
		swapsLeft=swapsOrig-swapsUsed;
		//alert(swapsLeft);
		
		countRoles();
	}
		function countRoles(){
			var ind=0;	
			var rolesList=[];
			var roles = $("#user-team").find("p");
			roles.splice(0,1);
			for ( ind = 0; ind < roles.length; ind++ ) {
			  
			    rolesList.push($(roles[ind]).attr('role'));
			}
			
			var counts = {};
			for (var i = 0; i < rolesList.length; i++) {
    			counts[rolesList[i]] = 1 + (counts[rolesList[i]] || 0);
			}
			console.log(counts);
			return counts;
		}
	$( function() {
   	 $( "#sortable1, #sortable2" ).sortable({
   	   connectWith: ".connectedSortable"
   	 }).disableSelection();
  	} );
	function onLoadCalls(leagueId,userId,flag){
		globalleagueId=leagueId;
		globaluserId=userId;
		populateTeam(userId,leagueId);
		onloadEditUserTeamName(leagueId,userId,flag);
		fetchPlayerList(leagueId,'rosterList',userId);
		fetchRules(leagueId);
		fetchSwapsAndScore(leagueId,userId,flag);
	}
	function fetchSwapsAndScore(leagueId,userId,flag){
		if(flag=="create"){
			swapsOrig=50;
			score=50;
		}
		else
			{
			$.ajax({
				url : '/All-In-One-FantasyGame/fetchSwapsAndScores',
			    type: 'post',
			    data : {leagueId:leagueId,userId:userId},
			    dataType : 'json',
			    success: function(data){
			    	
			    	$(data.teamDetails).each(function(index,value){
			    		swapsOrig=value.swaps;
						score=value.scores;
						
			    	});
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	populateRules("");
					console.log("Error while fetching scores and swaps");
			    }
			});
			}
	}
	var rulesMap="";
	function fetchRules(leagueId){
		$.ajax({
			url : '/All-In-One-FantasyGame/rulesMap',
		    type: 'post',
		    data : {leagueId:leagueId},
		    dataType : 'json',
		    success: function(data){
		    	console.log(data);
		    	populateRules(data);
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	populateRules("");
				console.log("Error while fetching rules");
		    }
		});
	}
	function populateRules(rules){
		rulesMap=rules;
		console.log(rulesMap);
	}

	function rulesCheck(counts,leagueId,userId,listOfPlayerIds,flag,updatedName){
	
		var flag=Boolean(1==1)
		var missedRules=""
		$(rulesMap.rulesMap).each(function(index,value){
			console.log(value.role);
			if(counts.hasOwnProperty(value.role)){
				if(counts[value.role]>=parseInt(value.number)){
				console.log("Success");
				}else{
					missedRules+=" Please select atleast " + value.number +" " + value.role+"\n"
					flag=Boolean(1>1)
				}
			}
			else{
				missedRules+=" Please select atleast " + value.number +" " + value.role+"\n";
				
				flag=Boolean(1>1)
			}
			
		});
		if(flag){
		listOfPlayerIds=JSON.stringify(listOfPlayerIds);
		
		callFormSubmit(leagueId,userId,listOfPlayerIds,flag,updatedName);
		}
		else{
			alert(missedRules);
		}
	}
	function diffInUserTeams(){
		revisedUserTeam=[]
		var usedSwaps=0;
		var listItems = $("#user-team").find("p");
		listItems.splice(0,1);
		for ( var ind = 0; ind < listItems.length; ind++ ) {
		    
		    revisedUserTeam.push($(listItems[ind]).attr('id'));
		    
		}
		
		for (var i=0;i<initialUserTeam.length;i++){
			if(!revisedUserTeam.includes(initialUserTeam[i])){
				usedSwaps++;
				//alert("Swap used")
			}
		}
		return usedSwaps;
	}
	function sendPlayerList(userId,leagueId,flag){
		//var teamName=document.getElementById("teamName").value;
		//var teamName=('#teamName').val();
		//alert(teamName);
		var ind=0;	
		var listOfPlayerIds=[];
		var rolesList=[];
		var updatedName=document.getElementById("updateTeamName").value;
		alert(updatedName);
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
			alert("Please select atleast 11 players");
			return;
		}
		else if(listOfPlayerIds.length > 11){
			alert("Please select 11 players only");
			return;
		}
		else if(updatedName==""){
			alert("Please Enter Team name.");
			return;
		}
		rulesCheck(counts,leagueId,userId,listOfPlayerIds,flag,updatedName);
			
		
		
	}
	var playerType="";
	function playerTypeSearch(type){
		playerType=type;
		if(playerType.includes("ALL")){
			playerType="";
		}
		searchPlayerList();
	}
	

	function callFormSubmit(leagueId,userId,listOfPlayerIds,flag,updatedName){
		$.ajax({
		    url : '/All-In-One-FantasyGame/createTeam',
		    type: 'post',
		    data : {userId:userId,leagueId:leagueId,listOfPlayerIds:listOfPlayerIds,flag:flag,updateTeamName:updatedName},
		    
		    success: function(data)
		   
		    {	alert(updatedName);
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
				var l = document.createElement("input");
				l.setAttribute('type',"hidden");
				l.setAttribute('name',"updateTeamName");
				l.setAttribute('value',updatedName);
				f.appendChild(l);
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
	
	