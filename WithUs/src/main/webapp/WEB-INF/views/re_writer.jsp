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
<title>Write Review</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="resources/assets/css/gr_writer.css" />
  
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
</head>
<body>
	<%@ include file="./nav.jsp" %>
     <div id="mainImg"></div>
    <!-- mainImg end -->
   	
   	
   	
    <div id="contain">
       <h1 id ="m_title">리뷰 글쓰기</h1>
      <form id = "m_content" action="Writereview" method="post" enctype="multipart/form-data">
        <div class="input-group">
          <span class="input-group-text">제목</span>
          <input type="text" name="review_title" aria-label="m_title" class="form-control" autocomplete="off">
        </div>
       		<br>
		 <div class="input-group">
          <span class="input-group-text">내용</span>
          <textarea class="form-control" name="review_content" placeholder="Leave a comment here" autocomplete="off" id="floatingTextarea" rows="15"></textarea>
         	<br>
        </div>
        <br>
        <div class="input-group">
          <span class="input-group-text">지역</span>
          <input type="text" name="review_region" aria-label="m_location" autocomplete="off" class="form-control">
        </div>
        <input type="hidden" name="mb_id" value="<%=loginMember.getMb_id()%>">
        <br>
        <div class="input-group">
          <span class="input-group-text">사진</span>
          <input type="file" name="review_img" aria-label="m_picture" class="form-control">
        </div>
        <br>
       
  
  
   
        <button id = "g_btn"type="submit" class="btn btn-primary">작성</button>
      </form>
    </div>
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

