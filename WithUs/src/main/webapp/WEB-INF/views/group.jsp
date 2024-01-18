<%@page import="java.beans.beancontext.BeanContextMembershipListener" %>
<%@page import="kr.smhrd.entity.Board" %>
<%@page import="org.springframework.ui.Model" %>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject" %>
<%@page import="kr.smhrd.entity.Message" %>
<%@page import="java.util.List" %>
<%@page import="kr.smhrd.entity.Member" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
				 pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int currentPage = (Integer) request.getAttribute("currentPage");
	int totalPages = (Integer) request.getAttribute("totalPages");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Find Group</title>
	<meta charset="utf-8"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<link rel="stylesheet" href="resources/assets/css/reset.css"/>
	<link rel="stylesheet" href="resources/assets/css/groups.css"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
					crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<style>
      #p_img {
          border-radius: 500px;
          width: 150px;
          height: 150px;
          position: relative;
          left: 35px;
          top: 40px;
      }

      #p_con {
          position: relative;
          left: 210px;
          bottom: 95px;
      }

      .modal-header {
          background-color: lightskyblue;

      }

      .modal-title {
          align-items: center;

      }

      .modal-body {
          height: 235px;
          font-weight: bold;
      }

      .fl_btn {
          position: relative;
          right: 200px;
      }

      .all {
          position: relative;
          bottom: 15px;
      }

      .modal-title {
          font-weight: bold;
          position: relative;
          left: 205px;

      }
	</style>
</head>
<body>
<%@ include file="./nav.jsp" %>
<div id="mainImg"></div>
<!-- mainImg end -->

<%
	List<Board> boardList = (List<Board>) request.getAttribute("boardList");
	if (boardList != null) {
		System.out.println(boardList.size());
	}

%>


<div id="contain">
	<div id="buttons">
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off"
						 onclick="location.href='goGroup'"/>
			<label class="btn btn-outline-primary active" for="btnradio1">모집</label>

			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"
						 onclick="location.href='goReview'"/>
			<label class="btn btn-outline-primary " for="btnradio2">리뷰</label>

			<input type="radio" class="btn-check " name="btnradio" id="btnradio3" autocomplete="off"
						 onclick="location.href='goSeoul'"/>
			<label class="btn btn-outline-primary " for="btnradio3">추천 맛집</label>
		</div>
	</div>
	<!-- buttons end -->
	<div class="reviewTitle">추천 동행자 TOP5</div>
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
	<div class="reviewTitle">현재 모집중인 사람들!</div>
	<div id="reviews">
		<div id="writeBtn">
			<% if (loginMember == null) { %>

			<%} else { %>
			<a class="btn btn-primary" href="goGrwriter" role="button">글쓰기</a>
			<%} %>
		</div>

		<div class="group">


			<% for (int i = (boardList.size() - 1); i >= 0; i--) { %>
			<div class="groupCard">
				<div class="groupCardTop">
					<div class="groupCardImg"></div>
					<div class="groupCardText">
						<a <%-- href="getProfil?mb_id=<%=boardList.get(i).getMb_id() %>&mb_age=<%=boardList.get(i).getMb_age() %>  --%>
										data-bs-toggle="modal" data-bs-target="#profil">
							<p>닉네임 : <%=boardList.get(i).getMb_nick() %>
							</p>
							<p>나이 : <%=boardList.get(i).getMb_age() %>
							</p>
							<span><%= boardList.get(i).getMb_id() %></span>
						</a>
					</div>
				</div>
				<div class="groupCardBottom">
					<div class="groupCount">모집 인원 : <%= boardList.get(i).getComp_members() %>
					</div>
					<div class="groupDesc"><%= boardList.get(i).getComp_content() %>
					</div>
					<button type="button">신청</button>
          <% if (loginMember != null) { %>
          <a href="chat.action" class="oneChat">1:1대화</a>
          <%}%>
				</div>
			</div>
			<% } %>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="profil" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel"
				 aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">프로필</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<div class="all">
							<img src="resources/images/profil.png" id="p_img">
							<div id="p_con">
								<p>팔로우 : <span>200</span> &nbsp;&nbsp; 팔로잉 : <span>10</span></p>
								<br>
								<p>닉네임 : <span>닉네임</span></p>
								<br>
								<p>나이 : <span>24</span></p>
								<br>
								<p>MBTI : <span>MBTI</span></p>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
						<button type="button" class="btn btn-primary fl_btn">팔로우</button>
					</div>
				</div>
			</div>
		</div>


		<!-- reviews end -->

	</div>
	<div class="d-flex justify-content-center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li class="page-item <%= (currentPage == 0) ? "disabled" : "" %>">
					<c:if test="${currentPage > 0}">
						<a class="page-link" href="<c:url value='/goGroup'/>?page=<%= currentPage - 1 %>" tabindex="-1"
							 aria-disabled="true">&laquo;</a>
					</c:if>
				</li>

				<% for (int pageNum = 1; pageNum <= totalPages; pageNum++) { %>
				<li class="page-item <%= (pageNum - 1 == currentPage) ? "active" : "" %>">
					<a class="page-link" href="<c:url value='/goGroup'/>?page=<%= pageNum - 1 %>"><%= pageNum %>
					</a>
				</li>
				<% } %>

				<li class="page-item <%= (currentPage == totalPages - 1) ? "disabled" : "" %>">
					<c:if test="${currentPage < totalPages - 1}">
						<a class="page-link" href="<c:url value='/goGroup'/>?page=<%= currentPage + 1 %>">&raquo;</a>
					</c:if>
				</li>
			</ul>
		</nav>
	</div>
</div>

<%@ include file="./F_chat.jsp" %>
<footer></footer>
</body>
<script>
    $(document).on("click", ".oneChat", () => {
        let bo_userId = $(this).closest('.groupCard').find('.groupCardText a span').text();
        console.log(bo_userId);
        sendChatRequest(bo_userId);
    });
    function sendChatRequest(userId) {
        let url = 'ws://172.30.1.55:8081/controller/chatserver';
        let ws = new WebSocket(url);

        ws.onopen = () => {
            console.log('WebSocket 연결 성공');
            // userId를 서버로 전송
            ws.send('4#' + userId);
        };

        ws.onerror = (evt) => {
            console.error(evt.data);
        };

        ws.onmessage = (evt) => {
            let message = evt.data;
            // 서버로부터의 응답 처리
            handleServerResponse(message);
        };
    }

    function handleServerResponse(message) {
        // 서버로부터의 응답을 처리하는 로직 작성
        console.log('서버 응답:', message);
    }
</script>
</html>

