<%@page import="kr.smhrd.entity.Board" %>
<%@page import="java.util.List" %>
<%@page import="kr.smhrd.entity.Member" %>
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
</head>
<body>
<%@ include file="./nav.jsp" %>
<div id="mainImg"></div>

<%
	List<Board> boardList = (List<Board>) request.getAttribute("boardList");
	System.out.println(boardList.size());
	List<Integer> ageList = (List<Integer>) session.getAttribute("ageList");
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
	<div id="reviewTitle">추천 동행자 TOP5</div>
	<div id="travler">
		<% if (loginMember != null) {
			if (profiles.size() >= 5) {
				for (int i = 0; i < 5; i++) {%>
		<div class="travlerCard">
			<img class="travlerCardImg" src="resources/pro_img/<%=profiles.get(i).getMb_proimg() %>">
			<div class="travlerNick"><%=profiles.get(i).getMb_nick() %>
			</div>
			<div class="travlerAge">나이 : <%=ageList.get(i) %>
			</div>
			<button type="button" class="followbtn"
			        onclick="toggleFollow('<%=loginMember.getMb_id() %>','<%=profiles.get(i).getMb_id() %>', this)">팔로우
			</button>
		</div>
		<%
			}
		} else if (profiles.size() == 0) {
		%>
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
		<%
		} else {
			for (int i = 0; i < profiles.size(); i++) {
		%>
		<div class="travlerCard">
			<div><img class="travlerCardImg" src="resources/pro_img/<%=profiles.get(i).getMb_proimg() %>"></div>
			<div class="travlerNick"><%=profiles.get(i).getMb_nick() %>
			</div>
			<div class="travlerAge">나이 : <%=ageList.get(i) %>
			</div>
			<button type="button" class="followbtn"
			        onclick="toggleFollow('<%=loginMember.getMb_id() %>','<%=profiles.get(i).getMb_id() %>', this)">팔로우
			</button>
		</div>
		<%
				}
			}
		%>


		<%} else { %>
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

		<%} %>
	</div>

	<div id="reviewTitle">현재 모집중인 사람들!</div>
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
					<div class="groupCardImg"><img class="groupCardImg" src="resources/images/여행자.png"></div>
					<div class="groupCardText">

						<% if (loginMember != null) { %>
						<a href="getProfil?mb_id=<%=boardList.get(i).getMb_id() %>&mb_age=<%=boardList.get(i).getMb_age() %>">

							<p>닉네임 : <%=boardList.get(i).getMb_nick() %>
							</p>
							<p>나이 : <%=boardList.get(i).getMb_age() %>
							</p>
						</a>
						<%} else {%>
						<p>닉네임 : <%=boardList.get(i).getMb_nick() %>
						</p>
						<p>나이 : <%=boardList.get(i).getMb_age() %>
						</p>
						<%} %>
					</div>
				</div>
				<% if (loginMember != null) { %>
				<div class="groupCardBottom"><a href="goGrcon?comp_idx=<%=boardList.get(i).getComp_idx() %>">
					<div class="groupCount">모집 인원 : <%= boardList.get(i).getComp_members() %>
					</div>
					<div class="groupDesc"><%= boardList.get(i).getComp_content() %>
					</div>
				</a>
					<%} else {%>
					<div class="groupCardBottom">
						<div class="groupCount">모집 인원 : <%= boardList.get(i).getComp_members() %>
						</div>
						<div class="groupDesc"><%= boardList.get(i).getComp_content() %>
						</div>
						<%}%>

						<% if (loginMember != null && !loginMember.getMb_id().equals(boardList.get(i).getMb_id())) { %>
						<a href="chat.action" class="oneChat">1:1대화</a>
						<%}%>

					</div>
				</div>

				<% } %>
			</div>

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
        sendChatRequest(bo_userId);
    });

    function sendChatRequest(userId) {
        let url = 'ws://172.30.1.55:8081/controller/chatserver';
        let ws = new WebSocket(url);

        ws.onopen = () => {
            // userId를 서버로 전송
            ws.send('4#' + userId);
        };

        ws.onerror = (evt) => {
            console.error(evt.data);
        };

        ws.onmessage = (evt) => {
            let message = evt.data;
        };
    }

    function toggleFollow(followerId, followingId, clickedButton) {
        $.ajax({
            url: 'goFollow',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                follower: followerId,
                followee: followingId
            }),
            success: function (response) {
                if (response === 'followed') {
                    // 팔로우 상태로 변경 (클릭된 버튼의 텍스트 변경)
                    clickedButton.innerText = '팔로우 취소';
                } else if (response === 'unfollowed') {
                    // 팔로우 취소 상태로 변경 (클릭된 버튼의 텍스트 변경)
                    clickedButton.innerText = '팔로우';
                }
                getFollowData();
            },
            error: function (xhr, status, error) {
                console.log('팔로우 실패');
            }
        });
    }

</script>
</html>