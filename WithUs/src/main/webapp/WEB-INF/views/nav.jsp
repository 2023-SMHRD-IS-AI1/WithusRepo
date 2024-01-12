<%@page import="kr.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script src="https://kit.fontawesome.com/d5377ff581.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
     <link rel="stylesheet" href="resources/assets/css/nav.css" />
<title>Insert title here</title>
</head>
<body>

	<% Member loginMember = (Member)session.getAttribute("loginMember"); %>

	  <header>
      <div id="logo">
        <a href="goMain"><img src="resources/images/logo.png" alt="" /></a>
      </div>
      <nav>
        <ul id="menu">
          <li><a href="goMain">홈</a></li>
          <li><a href="goGroup">커뮤니티</a></li>
        </ul>
      </nav>
      <ul id="r_nav">

        <% if (loginMember == null){ %>
        <li><a href="goLogin">로그인</a></li>
        <li><a href="goJoin">회원가입</a></li>
        <%}else {%>
        <li>
          <a href="goProfil"><i class="fa-solid fa-user"></i></a>
        </li>
        <li>
          <a href="goDaily"><i class="fa-solid fa-calendar"></i></a>
        </li>
        <li><a href="goLogout">로그아웃</a></li>
        <%} %>
      </ul>
    </header>
</body>
</html>