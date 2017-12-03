var sportName;
var rolesArray=[];

function saveSportData() {
	
	jQuery.when(function() { sportName = jQuery("#userSportName").val();
	 jQuery("#rolesDiv").find('input').each(function() {
	     
	      rolesArray.push(jQuery(this).val());
		 
	 })}).then (fetchLeagueTemplate());
	
}
var fileName = "";
function fetchLeagueTemplate() {
	
	var jsonRoles = JSON.stringify(rolesArray);
	jQuery.ajax({
	    url : '/All-In-One-FantasyGame/createTemplate',
	    type: 'POST',
	    beforeSend: function(){
	        jQuery('#createSportLeagueModalLoader').show();
	    },
	    complete: function(){
	    	jQuery('#createSportLeagueModalLoader').hide();
	    },
	    data : {sportName:sportName,sportRoles:jsonRoles},
	    
	    success: function(data) {	
	    	jQuery("#downloadButton").attr('data-filepath',data);
	    	fileName = data;
	    	jQuery('#createSportLeagueModalLoader').hide();
	    	//alert(data);
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("something went wrong.Contact Admin");
	    }
	});
}

function createSportAndLeagueEntry() {
	
	var jsonRoles = JSON.stringify(rolesArray);
	jQuery.ajax({
	    url : '/All-In-One-FantasyGame/createTemplate',
	    type: 'POST',
	    beforeSend: function(){
	        jQuery('#createSportLeagueModalLoader').show();
	    },
	    complete: function(){
	    	jQuery('#createSportLeagueModalLoader').hide();
	    },
	    data : {sportName:sportName,sportRoles:jsonRoles},
	    
	    success: function(data) {	
	    	jQuery("#downloadButton").attr('data-filepath',data);
	    	fileName = data;
	    	jQuery('#createSportLeagueModalLoader').hide();
	    	//alert(data);
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("something went wrong.Contact Admin");
	    }
	});
}



function downloadFile() {
	
    //var filepath = $(this).attr('data-filepath');
    top.location.href = "/All-In-One-FantasyGame/downloadTemplate?fileName="+fileName;
}

function uploadFile() {
 jQuery("#fileupload").click();
}



function submitLeagueData() {
	
	//onclick of done
	var form = document.forms["uploadTemplateForm"];
	var formData = new FormData(form);
	
	jQuery.ajax({
	    url : '/All-In-One-FantasyGame/uploadLeagueData',
	    type: 'POST',
	    beforeSend: function(){
	        jQuery('#createSportLeagueModalLoader').show();
	    },

	    data : formData,
	    complete: function(){
	    	jQuery('#createSportLeagueModalLoader').hide();
	    },
	    success: function(data) {	
	    	
	    		alert(data);
	    	//alert(data);
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	    	alert("something went wrong.Contact Admin");
	    }
	});
}