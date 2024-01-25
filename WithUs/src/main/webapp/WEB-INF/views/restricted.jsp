<%@page import="kr.smhrd.entity.reviewBoard"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>서비스 이용 불가</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/d5377ff581.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/assets/css/reset.css" />
<link rel="stylesheet" href="resources/assets/css/Main.css" />
<link rel="stylesheet" href="resources/assets/css/nav.css" />

<style type="text/css">
h1 {
	font-size: 35px;
	font-weight: bold;
}
</style>


</head>


<body>
	<!--경고페이지  -->
	<!--  네비바 -->
	<header>
	<div id="logo">
		<a href="#"><img
			src="${pageContext.request.contextPath}/resources/images/logo.png"
			alt="" /></a>
	</div>
	<nav>
	<ul id="menu">
		<li><a href="#">홈</a></li>
		<li><a href="#">커뮤니티</a></li>
	</ul>
	</nav>
	<ul id="r_nav">

		<li><a data-bs-toggle="modal" data-bs-target="#mypmodal"
			onclick="openMyPmodal()"><i class="fa-solid fa-user"></i></a></li>
		<li><a href="#"><i class="fa fa-cog" aria-hidden="true"></i></a>
		</li>
		<li><a href="#"><i class="fa-solid fa-calendar"></i></a></li>
		<li><a href="goLogout">로그아웃</a></li>


	</ul>
	</header>
	<!--네비바 끝  -->

	<div id="main">

		<div id="main1"></div>
		<div id="main2"></div>
		<div id="mainText">
			<p>함께하는 여행의 즐거움</p>
			<p>With Us!</p>
			<h1>관리자에게 문의하세요 010-0000-0000</h1>

		</div>

	</div>

	<script>
        window.onload = function() {
            
                alert('<%=session.getAttribute("reportWarning")%>
		')
	<%session.removeAttribute("reportWarning");%>
		};
	</script>




</body>
</html>
