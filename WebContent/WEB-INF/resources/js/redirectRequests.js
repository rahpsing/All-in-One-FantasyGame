function redirectToHomePage(userId){
	var f = document.createElement("form");
	f.setAttribute('method',"post");
	f.setAttribute('action',"/All-In-One-FantasyGame/redirectToHomePage");

	var i = document.createElement("input"); //input element, text
	i.setAttribute('type',"hidden");
	i.setAttribute('name',"userId");
	i.setAttribute('value',userId);
	f.appendChild(i);
	
	document.body.appendChild(f);
	console.log(f);
	f.submit();
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    //alert(cname + "=" + cvalue + ";" + expires + ";path=/");
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie() {
    var user = getCookie("userIdCookie");
    if (user != "") {
       // alert("Welcome again " + user);
    } else {
    	window.location.href = 'http://localhost:8080/All-In-One-FantasyGame/LandingPage1.jsp';
        }
    }
function deleteCookie() {
	document.cookie = "userIdCookie="+"; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	window.location.href = 'http://localhost:8080/All-In-One-FantasyGame/LandingPage1.jsp';
}
