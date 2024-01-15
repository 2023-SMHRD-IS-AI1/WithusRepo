<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/assets/css/F_chat.css" />
<title>Insert title here</title>
</head>

<body>
	
	<% if (loginMember != null){ %>
	<a href="chat.action" id="chat"><img src="resources/images/chat.png" alt="" /></a>
	 <%}else {%>
	 
	 <%} %>
</body>
</html>