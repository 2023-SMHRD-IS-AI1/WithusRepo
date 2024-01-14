<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<link rel="stylesheet" href="resources/assets/css/profil.css" />
<link rel="stylesheet" href="resources/assets/css/profil.css" />
<title>프로필상세</title>
</head>
<body>
	<%@ include file="./nav.jsp"%>
	<div id="mainImg"></div>
	<!-- mainImg end -->
	<div id="contain">
		<div id="profileBox">
			<div id="boxL">
				<div id="boxL_top">
					<div id="proImg"></div>
				</div>
				<button type="button">팔로우</button>
				<ul id="proDesc">
					<li><span>닉네임</span>닉네임</li>
					<li><span>나이</span>20</li>
					<li><span>MBTI</span>ENFP</li>
				</ul>
			</div>
			<div id="boxR">
				<div id="boxR_top">
					<div id="follow">
						<span>팔로우</span><span>100</span>
					</div>
					<div id="following">
						<span>팔로우</span><span>100</span>
					</div>
				</div>
				<div id="boxR_Mid">
					<div class="btn-group" role="group"
						aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="btnradio"
							id="btnradio1" autocomplete="off" checked /> <label
							class="btn btn-outline-primary" for="btnradio1">팔로우</label> <input
							type="radio" class="btn-check" name="btnradio" id="btnradio2"
							autocomplete="off" /> <label class="btn btn-outline-primary"
							for="btnradio2">팔로잉 </label>
					</div>
				</div>
				<div id="boxR_bottom">
					<ul id="list">
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>
						<li>
							<div id="listImg"></div>
							<div id="listNick">닉네임</div>
							<button type="button">팔로우</button>
						</li>


					</ul>
				</div>
			</div>
		</div>
	</div>
	<footer></footer>
</body>
</html>
