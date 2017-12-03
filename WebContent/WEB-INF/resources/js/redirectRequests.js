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