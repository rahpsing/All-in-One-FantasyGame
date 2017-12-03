<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css"/>
        <script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>

</head>
    <body onload="javascript:connect()" onunload="disconnect();">
        <h1> Chat Room </h1>
        <textarea id="messages" class="panel message-area"></textarea>
        <div class="panel input-area">
            <input id="userName" class="text-field" type="text"/>
            <input id="messageInput" class="text-field" type="text" 
                   onkeydown="if (event.keyCode == 13) sendMessage();" />
            <input class="button" type="submit" value="Send" onclick="sendMessage();" />
        </div>
    </body>
</html>


