<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css"/>
        <script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>

<style type="text/css">

#chat,#chat:after,.chatbox{transition:all .4s ease-in-out}
#chat,#close-chat,.minim-button,.maxi-button,.chat-text{font-weight:700;cursor:pointer;font-family:Arial,sans-serif;text-align:center;height:20px;line-height:20px}
#chat,#close-chat,.chatbox{border:1px solid #A8A8A8}
#chat:after,#chat:before{position:absolute;border-style:solid;content:""}
.chatbox{position:fixed;bottom:0;left:80%;margin:0 0 -1500px;background:#fff;border-bottom:none;padding:28px 10px 10px;z-index:100000}
#close-chat{position:absolute;top:2px;right:2px;font-size:24px;border:1px solid #dedede;width:20px;background:#fefefe;z-index:2}
#minim-chat,#maxi-chat{position:absolute;top:0;left:0;width:100%;height:20px;line-height:20px;cursor:pointer;z-index:1}
.minim-button{position:absolute;top:2px;right:26px;font-size:24px;border:1px solid #dedede;width:20px;background:#fefefe}
.maxi-button{position:absolute;top:2px;right:26px;font-size:24px;border:1px solid #dedede;width:20px;background:#fefefe;}
.chat-text{position:absolute;top:5px;left:10px;font-size:16px;}
#chat{width:40px;border-radius:3px;padding:2px 8px;font-size:12px;background:#fff;-webkit-transform:translateZ(0);transform:translateZ(0)}
#chat:before{border-width:10px 11px 0 0;border-color:#A8A8A8 transparent transparent;left:7px;bottom:-10px}
#chat:after{border-width:9px 8px 0 0;border-color:#fff transparent transparent;left:8px;bottom:-8px}
#chat:hover{background:#ddd;-webkit-animation-name:hvr-pulse-grow;animation-name:hvr-pulse-grow;-webkit-animation-duration:.3s;animation-duration:.3s;-webkit-animation-timing-function:linear;animation-timing-function:linear;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;-webkit-animation-direction:alternate;animation-direction:alternate}
#chat:hover:after{border-color:#ddd transparent transparent!important}
.animated-chat{-webkit-animation-duration:1s;animation-duration:1s;-webkit-animation-fill-mode:both;animation-fill-mode:both;-webkit-animation-timing-function:ease-in;animation-timing-function:ease-in}
@-webkit-keyframes tada{0%{-webkit-transform:scale(1)}
10%,20%{-webkit-transform:scale(.9)rotate(-3deg)}
30%,50%,70%,90%{-webkit-transform:scale(1.1)rotate(3deg)}
40%,60%,80%{-webkit-transform:scale(1.1)rotate(-3deg)}
100%{-webkit-transform:scale(1)rotate(0)}
}
@keyframes tada{0%{transform:scale(1)}
10%,20%{transform:scale(.9)rotate(-3deg)}
30%,50%,70%,90%{transform:scale(1.1)rotate(3deg)}
40%,60%,80%{transform:scale(1.1)rotate(-3deg)}
100%{transform:scale(1)rotate(0)}
}
.tada{-webkit-animation-name:tada;animation-name:tada}
@-webkit-keyframes hvr-pulse-grow{to{-webkit-transform:scale(1.1);transform:scale(1.1)}
}
@keyframes hvr-pulse-grow{to{-webkit-transform:scale(1.1);transform:scale(1.1)}
}





<!--
body { 
 padding:0;
 margin:0;
}
-->
</style>
</head>
    <body onload="javascript:connect()" onunload="disconnect();">
        <h1> Chat Room </h1>
       <!--  <textarea id="messages" class="panel message-area"></textarea>
        <div class="panel input-area">
            <input id="userName" class="text-field" type="text"/>
            <input id="messageInput" class="text-field" type="text" 
                   onkeydown="if (event.keyCode == 13) sendMessage();" />
            <input class="button" type="submit" value="Send" onclick="sendMessage();" />
        </div> -->
        
        
        		<!-- <div id="chat" class="animated-chat tada" onclick="loadChatbox()">Chat</div> -->
		<div class="chatbox" id="chatbox" style="margin: 0 0 -460px 0">
		<span class="chat-text">Chatting Yuk!</span>
		<div id="smartchatbox_img901621879" style="width: 280px; height: 450px; overflow: hidden; margin: auto; padding: 0;">
		<div id="smartchatbox901621879" style="width: 280px; height: 450px; overflow: hidden; margin: auto; padding: 0; border:0; ">
		
		<textarea id="messages" class="panel message-area"></textarea>
        <div class="panel input-area">
            <input id="userName" class="text-field" type="text"/>
            <input id="messageInput" class="text-field" type="text" 
                   onkeydown="if (event.keyCode == 13) sendMessage();" />
            <input class="button" type="submit" value="Send" onclick="sendMessage();" />
        </div>
		
		</div></div>
		<!-- <script>
//<![CDATA[
document.write('<div id="smartchatbox_img901621879" style="width: 280px; height: 450px; overflow: hidden; margin: auto; padding: 0;">');
document.write('<div id="smartchatbox901621879" style="width: 280px; height: 450px; overflow: hidden; margin: auto; padding: 0; border:0; ">');
document.write('<iframe src="https://www3.smartchatbox.com/shoutbox/sb.php?key=901621879" scrolling="no" frameborder="0" width="280px" height="450px" style="border:0; margin:0; padding: 0;">');
document.write('</iframe></div></div>');
//]]>
</script> -->
		<div id="close-chat" onclick="closeChatbox()">&times;</div>
	<div id="minim-chat" onclick="minimChatbox()" style="display:none;"><span class="minim-button">&minus;</span></div>
	<div id="maxi-chat" onclick="loadChatbox()" style="display:block;"><span class="maxi-button">&plus;</span></div>
	</div>
    </body>
</html>


