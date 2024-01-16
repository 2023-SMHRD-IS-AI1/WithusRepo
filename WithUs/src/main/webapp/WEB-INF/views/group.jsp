<%@page import="java.beans.beancontext.BeanContextMembershipListener"%>
<%@page import="kr.smhrd.entity.Board"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Find Group</title>
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
<link rel="stylesheet"  href="resources/assets/css/groups.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<%@ include file="./nav.jsp" %>
     <div id="mainImg"></div>
    <!-- mainImg end -->
   
  <% 
  	List<Board> boardList = (List<Board>)request.getAttribute("boardList");
	if(boardList != null){
		System.out.println(boardList.size());
	}
  
  %> 
   
   
    <div id="contain">
  <div id="buttons">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group" >
          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="location.href='goGroup'"  />
          <label   class="btn btn-outline-primary active" for="btnradio1">모집</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="location.href='goReview'"  />
          <label   class="btn btn-outline-primary " for="btnradio2">리뷰</label>

          <input type="radio" class="btn-check " name="btnradio" id="btnradio3" autocomplete="off" onclick="location.href='goSeoul'"  />
          <label class="btn btn-outline-primary " for="btnradio3">추천 맛집</label>
        </div>
      </div>
      <!-- buttons end -->
      <div id="reviewTitle">추천 동행자 TOP5</div>
      <div id="travler">
        <div class="travlerCard">
          <div class="travlerCardImg"></div>
          <div class="travlerNick">USER</div>
          <div class="travlerAge">20대</div>
          <button type="button">팔로우</button>
        </div>
        <div class="travlerCard">
          <div class="travlerCardImg"></div>
          <div class="travlerNick">USER</div>
          <div class="travlerAge">20대</div>
          <button type="button">팔로우</button>
        </div>
        <div class="travlerCard">
          <div class="travlerCardImg"></div>
          <div class="travlerNick">USER</div>
          <div class="travlerAge">20대</div>
          <button type="button">팔로우</button>
        </div>
        <div class="travlerCard">
          <div class="travlerCardImg"></div>
          <div class="travlerNick">USER</div>
          <div class="travlerAge">20대</div>
          <button type="button">팔로우</button>
        </div>
        <div class="travlerCard">
          <div class="travlerCardImg"></div>
          <div class="travlerNick">USER</div>
          <div class="travlerAge">20대</div>
          <button type="button">팔로우</button>
        </div>
      </div>
      <div id="reviewTitle">현재 모집중인 사람들!</div>
      <div id="reviews">
        <div id="writeBtn">
        	<% if (loginMember == null){ %>
        	
        	<%}else{ %>
          <a class="btn btn-primary" href="goGrwriter" role="button">글쓰기</a>
          <%} %>
        </div>
		
	<div class="group">

		

		<%  for(int i =(boardList.size()-1); i>=0 ;i--){ %>
			
        	
			
          <div class="groupCard">
            <div class="groupCardTop">
              <div class="groupCardImg"></div>
              <div class="groupCardText">
              <a href="getProfil?mb_id=<%=boardList.get(i).getMb_id() %>&mb_age=<%=boardList.get(i).getMb_age() %>">
              <p>닉네임 : <%=boardList.get(i).getMb_nick() %></p>
                <p>나이 : <%=boardList.get(i).getMb_age() %></p>
              </a>

              </div>	
            </div>
            <div class="groupCardBottom">
              <div class="groupCount">모집 인원 : <%= boardList.get(i).getComp_members() %></div>
              <div class="groupDesc"><%= boardList.get(i).getComp_content() %></div>
              <button type="button">신청</button>
            </div>
         </div>
             
            <% } %>
          </div>
 	
      <!-- reviews end -->
      
    </div>
        <div id="page">
            <ul class="pagination">
                <li class="page-item <%= (currentPage == 0) ? "disabled" : "" %>">
                    <a class="page-link" href="goGroup?page=<%= currentPage - 1 %>" tabindex="-1" aria-disabled="true">Previous</a>
                </li>
                <!-- 페이지 번호를 동적으로 생성 -->
                <% for (int pageNum = 1; pageNum <= totalPages; pageNum++) { %>
                    <li class="page-item <%= (pageNum - 1 == currentPage) ? "active" : "" %>">
                        <a class="page-link" href="goGroup?page=<%= pageNum - 1 %>"><%= pageNum %></a>
                    </li>
                <% } %>
                <li class="page-item <%= (currentPage == totalPages - 1) ? "disabled" : "" %>">
                    <a class="page-link" href="goGroup?page=<%= currentPage + 1 %>">Next</a>
                </li>
            </ul>
        </div>
    </div>

    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

