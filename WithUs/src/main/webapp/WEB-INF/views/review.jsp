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
<title>review</title>
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
    <link rel="stylesheet" href="resources/assets/css/reviews.css" />
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
</head>
<body>
	<%@ include file="./nav.jsp" %>
     <div id="mainImg"></div>
    <!-- mainImg end -->
   
    <% 
    List<reviewBoard> reviewList = (List<reviewBoard>)request.getAttribute("reviewList");
	if(reviewList != null){
		System.out.println(reviewList.size());
	}
  

  %>   

   

   
    <div id="contain">
       <div id="buttons">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="location.href='goGroup'" />
          <label class="btn btn-outline-primary" for="btnradio1">모집</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked onclick="location.href='goReview'"/>
          <label class="btn btn-outline-primary" for="btnradio2">리뷰</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" onclick="location.href='goSeoul'" />
          <label class="btn btn-outline-primary" for="btnradio3">추천 맛집</label>
        </div>
      </div>
      <!-- buttons end -->
      <div id="reviews">
        <div id="writeBtn">
        <% if (loginMember == null){ %>
        <%}else {%>
          <a class="btn btn-primary" href="goRewrite" role="button">글쓰기</a>
          <%} %>
        </div>
         <% 
        
        for(int i=(reviewList.size()-1); i>=0; i--){ %>
        <div class="reviewCard">
          <a href="#">
            <div class="imgBox"> <img src="resources/upload1/<%=reviewList.get(i).getReview_img()%>"></div>
            <div class="textBox">
              <p class="title"><%= reviewList.get(i).getReview_title() %></p>
              <p class="text">
                <%= reviewList.get(i).getReview_content() %>
              </p>
              <p class="date"><%= reviewList.get(i).getReviewed_at() %></p>
            </div>
          </a>   
        </div>
        <%} %>
        
      </div>
      <!-- reviews end -->
      <div id="page">
        <ul class="pagination">
          <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item active" aria-current="page">
            <a class="page-link" href="#">2</a>
          </li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </div>
    </div>
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

