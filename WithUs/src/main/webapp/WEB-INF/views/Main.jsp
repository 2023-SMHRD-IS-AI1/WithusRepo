<%@page import="kr.smhrd.entity.reviewBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>With us</title>
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
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"  href="resources/assets/css/Main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

 
   <%@ include file="./nav.jsp" %>
   
      <% 
    List<reviewBoard> reviewList = (List<reviewBoard>)request.getAttribute("reviewList");

  %>   
    <div id="main">
      <div id="main1"></div>
      <div id="main2"></div>
      <div id="mainText">
        <p>함께하는 여행의 즐거움</p>
        <p>With Us!</p>
      </div>
    </div>

   
   
      

    <!-- mainImg end -->
    <div id="contain">


                <%@ include file="./Frequency.jsp" %>

      <div id="reviewTitle">With Us와 함께하는 여행자들의 생생한 후기</div>
      <div id="writeBtn">
        <a class="btn btn-primary" href="goReview" role="button">더보기</a>
      </div>
   
   
      <div id="reviews">
      <%if(reviewList != null && reviewList.size() > 6){ %>
      <%for(int i =0; i<6;i++){ %>
        <div class="reviewCard">
          <a href="goRecon?review_idx=<%=reviewList.get(i).getReview_idx() %>">
            <div class="imgBox"><img class="uim" src="resources/upload1/<%=reviewList.get(i).getReview_img()%>"></div>
            <div class="textBox">
              <p class="title"><%=reviewList.get(i).getReview_title() %></p>
              <p class="text">
                <%=reviewList.get(i).getReview_content() %>
              </p>
              <p class="date"><%=reviewList.get(i).getReviewed_at() %></p>
            </div>
          </a>
        </div>
        <%} 
      }else if(reviewList != null && reviewList.size() > 0){ %>
         <%for(int i =0; i<reviewList.size();i++){ %>
        <div class="reviewCard">
          <a href="#">
            <div class="imgBox"><img class="uim" src="resources/upload1/<%=reviewList.get(i).getReview_img() %>"></div>
            <div class="textBox">
              <p class="title"><%=reviewList.get(i).getReview_title() %></p>
              <p class="text">
                <%=reviewList.get(i).getReview_content() %>
              </p>
              <p class="date"><%=reviewList.get(i).getReviewed_at() %></p>
            </div>
          </a>
        </div>
      <%}
      }
      %>
      
      </div>
      <div id="reviewTitle">지역별 추천 맛집 List</div>
      <div id="writeBtn">
       
      </div>
      <div id="places">
        <div class="placeCard">
          <a href="goSeoul">
            <div class="imgBox"><div class="textBox">서울</div></div>
          </a>
        </div>
        <div class="placeCard">
          <a href="goGr">
            <div class="imgBox"><div class="textBox">강릉</div></div>
          </a>
        </div>
        <div class="placeCard">
          <a href="goJj">
            <div class="imgBox"><div class="textBox">제주</div></div>
          </a>
        </div>
        <div class="placeCard">
          <a href="goBusan">
            <div class="imgBox"><div class="textBox">부산</div></div>
          </a>
        </div>
      </div>
      <!-- reviews end -->
    </div>
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
       <script>
        window.onload = function() {
            <% if (loginMember != null && session.getAttribute("reportWarning") != null) { %>
                alert('<%= session.getAttribute("reportWarning") %>');
                <% session.removeAttribute("reportWarning"); %>
            <% } %>
        };
    </script>
   

    
    
</body>
</html>