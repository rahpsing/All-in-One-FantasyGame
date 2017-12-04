
	
	var teamNameEditForm = document.getElementById("teamNameEdit");
	var playerRoster = document.getElementById("player-roster");
	var userTeam = document.getElementById("user-team");
	var initialUserTeam=[];
	var revisedUserTeam=[];
	var swapsOrig;
	var swapsLeft=0;
	var score;
	var saveButton = document.getElementById("saveButton");
	var playerData="";
	var globalleagueId;
	var globaluserId;
   	var colorArray=["#A1EAFB","#CBF078","#F1BBF5","#5782BB","#FF8F56","#DC4444"];
   	var colorMap={};
   	var countsMap={};
   	var modifiedCountsMap={};
function onLoadCalls(leagueId,userId,flag){
		
		//fetchRules(leagueId);
		
		jQuery.when(fetchRules(leagueId)).then(function(){
			globalleagueId=leagueId;
			globaluserId=userId;
			
			onloadEditUserTeamName(leagueId,userId,flag);
			
			fetchSwapsAndScore(leagueId,userId,flag);
			fetchPlayerList(leagueId,'rosterList',userId)
			populateTeam(userId,leagueId);
			/*jQuery.when(populateTeam(userId,leagueId)).then(function(){
				fetchCountsMap();
			})*/
		})
	}
function fetchCountsMap(){
	
	var ind=0;	
	var listOfPlayerIds=[];
	var rolesList=[];
	
	//alert(updatedName);
	var listItems = $("#user-team").find("p");
	listItems.splice(0,1);
	console.log(listItems.length);
	for ( ind = 0; ind < listItems.length; ind++ ) {
	    //console.log($(listItems[ind]).attr('id'));
	    //listOfPlayerIds.push($(listItems[ind]).attr('id'));
	    rolesList.push($(listItems[ind]).attr('role'));
	}
	for (var i = 0; i < rolesList.length; i++) {
		countsMap[rolesList[i]] = 1 + (countsMap[rolesList[i]] || 0);
	}
	
	console.log(countsMap);
	diffInCounts(countsMap);
}

function diffInCounts(counts){
	len=Object.keys(counts).length;
	$(rulesMap.rulesMap).each(function(index,value){
		//console.log(counts[value.role])
		console.log(value.role);
		if(counts.hasOwnProperty(value.role)){
		if((parseInt(value.number)-counts[value.role])>0){
			modifiedCountsMap[value.role]=(parseInt(value.number)-counts[value.role]);
		}
		else
			{
			modifiedCountsMap[value.role]=0;
			}
	}
	else{
		modifiedCountsMap[value.role]=parseInt(value.number)
	}
	});
	console.log(modifiedCountsMap);
	fillRulesandSwap();
}


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
		counts=countRoles();
		diffInCounts(counts);
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
		counts=countRoles();
		diffInCounts(counts);
		
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
	
	function fetchSwapsAndScore(leagueId,userId,flag){
		if(flag=="create"){
			swapsOrig=50;
			score=50;
			swapsLeft=swapsOrig;
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
						swapsLeft=swapsOrig;
						
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
	var mapOfRulesMap={};
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
		$(rulesMap.rulesMap).each(function(index,value){
			colorMap[value.role]=colorArray.pop();
		});
		console.log(colorMap);
	}

	function rulesCheck(counts,leagueId,userId,listOfPlayerIds,flag,updatedName){
	
		var rulesflag=Boolean(1==1)
		var missedRules=""
		$(rulesMap.rulesMap).each(function(index,value){
			console.log(value.role);
			if(counts.hasOwnProperty(value.role)){
				if(counts[value.role]>=parseInt(value.number)){
				console.log("Success");
				}else{
					missedRules+=" Please select atleast " + value.number +" " + value.role+"\n"
					rulesflag=Boolean(1>1)
				}
			}
			else{
				missedRules+=" Please select atleast " + value.number +" " + value.role+"\n";
				
				rulesflag=Boolean(1>1)
			}
			
		});
		if(rulesflag){
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
		//alert(updatedName);
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
		    data : {userId:userId,leagueId:leagueId,listOfPlayerIds:listOfPlayerIds,flag:flag,updateTeamName:updatedName,swapsLeft:swapsLeft,score:score},
		    
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
				var l = document.createElement("input");
				l.setAttribute('type',"hidden");
				l.setAttribute('name',"updateTeamName");
				l.setAttribute('value',updatedName);
				f.appendChild(l);
				
				var m = document.createElement("input");
				m.setAttribute('type',"hidden");
				m.setAttribute('name',"score");
				m.setAttribute('value',score);
				f.appendChild(m);
				
				var n = document.createElement("input");
				n.setAttribute('type',"hidden");
				n.setAttribute('name',"swapsLeft");
				n.setAttribute('value',swapsLeft);
				f.appendChild(n);
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
	
	