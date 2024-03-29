<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Write Recruit</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap"/>
	<link
					href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
					rel="stylesheet"
					integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
					crossorigin="anonymous"
	/>
	<script src="https://kit.fontawesome.com/d5377ff581.js" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com"/>
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
	      rel="stylesheet"/>
	<link rel="stylesheet" href="resources/assets/css/gr_writer.css"/>
	<link rel="stylesheet" href="resources/assets/css/reset.css"/>
</head>
<body>


<%@ include file="./nav.jsp" %>
<div id="mainImg"></div>

<% int mb_age = (int) session.getAttribute("mb_age");
	if (mb_age == 0) {
	}
%>

<div id="contain">
	<h1 id="m_title">모집 글쓰기</h1>
	<form id="m_content" action="boardWirte" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mb_id" value="<%=loginMember.getMb_id()%>">
		<input type="hidden" name="mb_nick" value="<%=loginMember.getMb_nick()%>">

		<div class="input-group">
			<span class="input-group-text">제목</span>
			<input type="text" name="comp_title" aria-label="m_title" class="form-control" autocomplete="off">
			<input type="hidden" name="mb_age" value=${mb_age }>
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-text">모집인원</span>
			<input type="number" name="comp_members" aria-label="m_person" class="form-control" placeholder="ex) 1"
			       autocomplete="off">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-text">내용</span>
			<textarea name="comp_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea"
			          rows="15" autocomplete="off"></textarea>
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-text">지역</span>
			<input type="text" name="comp_tourplace" aria-label="m_location" class="form-control" autocomplete="off">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-text">날짜</span>
			<input type="date" name="comp_start" aria-label="m_start" class="form-control" placeholder="출발날짜">
			<span class="input-group-text">~</span>
			<input type="date" name="comp_end" aria-label="m_end" class="form-control" placeholder="끝날 날짜">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-text">사진</span>
			<input type="file" name="comp_img" aria-label="m_picture" class="form-control">
		</div>
		<br>


		<button id="g_btn" type="submit" class="btn btn-primary">작성</button>
	</form>
</div>
<!-- contain end -->
<%@ include file="./F_chat.jsp" %>
<footer></footer>
</body>
</html>

