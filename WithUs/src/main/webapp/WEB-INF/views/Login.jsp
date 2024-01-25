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
<title>Log in</title>
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
<link rel="stylesheet" href="resources/assets/css/Login.css" />

</head>
<body>
	<%@ include file="./nav.jsp"%>
	<!--네비바 끝  -->
	<div id="main">
		<div class="login">
			<form action="memberSelect" method="post">
				<img class="log-img-icon" alt="" src="resources/images/login_im.png" />
				<!--로그인 이미지  -->
				<b class="log-title"> 로그인 </b> <input class="idinput" name="mb_id"
					placeholder="ID를 입력해주세요" type="text" /> <input class="pwinput"
					name="mb_pw" placeholder="PW를 입력해주세요" type="password" />

				<div class="l-btn">
					<a href="#" style="width: 330px;">
						<button class="base-button">
							<b class="button-base">로그인</b>
						</button>
					</a>
				</div>
			</form>

			<div class="login-text">회원이 아니신가요?</div>
			<button class="j-btn">
				<div class="button">
					<a href="goJoin" style="width: 330px;">
						<div class="base-button1">
							<b class="b1">회원가입</b>
						</div>
					</a>
				</div>

			</button>

		</div>
		<!-- reviews end -->
	</div>
	<!-- contain end -->
	<footer></footer>
</body>
</html>

