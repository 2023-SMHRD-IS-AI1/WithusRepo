<%@page import="kr.smhrd.entity.Board"%>
<%@ page import="kr.smhrd.entity.Comment"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Group Contents</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/d5377ff581.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/assets/css/grcontent.css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/assets/css/reset.css" />

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>	
<style>
#dele {
	height: 220px;
}

#del_fot {
	position: relative;
	bottom: 170px;
}

#del_body {
	text-align: center;
	position: relative;
	top: 10px;
	left: 5px;
}

#p_bodays {
	height: 540px;
}

#updateCompForm {
	position: relative;
	left: 100px;
}

#deleteComp{

	position: relative;
	left:20px;


}

.updateCommentBtn {
	background-color: transparent;
	border: none;
	color: blue;
	cursor: pointer;
	margin-right: 10px; /* 수정 버튼 간격 조절 */
}

.deleteCommentBtn {
	background-color: transparent;
	border: none;
	color: red;
	cursor: pointer;
}

#p_bodays {
	height: 530px;
}

#f_btn2 {
	position: relative;
	left: 140px;
}

#updateCompForm{

	position: relative;
	left: 100px;

}


#updateGrCommentForm{
	
	position: relative;
	left: 100px;

}

#g_btn_co{
	
	position: relative;
	left: 170px;
	top:20px;
}

.s_btn{
	width:60px;
	height: 40px;
	position: relative;
	top:2px;

}
</style>

<body>

	<%
	Board board = (Board) request.getAttribute("board");

	if (board != null) {
		request.setAttribute("board", board);
	}
	%>


	<%
	if (session.getAttribute("loginMember") == null) {
		response.sendRedirect("Main"); // 메인 페이지로 리디렉션
		return; // 이후의 코드 실행 방지
	}
	%>


	<%@ include file="./nav.jsp"%>
	<div id="mainImg"></div>
	<!-- mainImg end -->

	<div id="del">
		<%-- 리뷰 수정 및 삭제 버튼 --%>
		<%
		if (loginMember != null && loginMember.getMb_id() != null && loginMember.getMb_id().equals(board.getMb_id())) {
		%>
		<!-- 리뷰 수정 링크 -->
		<%-- <a href="${pageContext.request.contextPath}/gorewrModify/${review.getReview_idx()}"> --%>
		<p data-bs-toggle="modal" data-bs-target="#updateCompModal">
			<i class="fa-solid fa-pencil"></i>수정
		</p>
		<!--  </a> -->
		<!-- 리뷰 삭제 모달 -->
		<p data-bs-toggle="modal" data-bs-target="#dele">
			<i class="fa-solid fa-trash"></i>삭제
		</p>
		<%
		}
		%>
	</div>
	<!-- 수정 폼 모달 -->
	<div class="modal fade" id="updateCompModal" tabindex="-1"
		aria-labelledby="updateCompModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updateCompModalLabel">리뷰 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="p_bodays">
					<!-- 수정 폼 내용 -->
					<form id="updateCompForm"
						action="${pageContext.request.contextPath}/updateComp"
						method="post">
						<input type="hidden" name="comp_idx"
							value="${board.getComp_idx()}" />
						<div class="mb-3">
							<label for="updatedTitle" class="form-label">제목</label> <input
								type="text" class="form-control" id="updatedCompTitle"
								name="comp_title" value="${board.getComp_title()}" required />
						</div>
						<div class="mb-3">
							<label for="updatedContent" class="form-label">내용</label>
							<textarea class="form-control" id="updatedCompContent"
								name="comp_content" rows="5" required>${board.getComp_content()}</textarea>
						</div>
						<div class="mb-3">
							<label for="updatedRegion" class="form-label">지역</label>
							<textarea class="form-control" id="updatedComptourplace"
								name="comp_tourplace" required>${board.getComp_tourplace()}</textarea>
						</div>
						<div class="mb-3">
							<label for="updatedRegion" class="form-label">모집인원</label>
							<textarea class="form-control" id="updatedCompmembers"
								name="comp_members" required>${board.getComp_members()}</textarea>
						</div>
						<div id="f_btn2">
							<button type="button" class="btn btn-primary"
								onclick="submitUpdateComp()">수정 완료</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function submitUpdateComp() {
			// 리뷰 수정 폼을 서버로 제출
			var comp_idx = "${board.getComp_idx()}";
			var updatedCompTitle = $("#updatedCompTitle").val();
			var updatedCompContent = $("#updatedCompContent").val();
			var updatedComptourplace = $("#updatedComptourplace").val();
			var updatedCompmembers = $("#updatedCompmembers").val();

			// AJAX를 사용하여 비동기적으로 수정 내용을 서버로 전송
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/updateComp",
				data : {
					comp_idx : comp_idx,
					comp_title : updatedCompTitle,
					comp_content : updatedCompContent,
					comp_tourplace : updatedComptourplace,
					comp_members : updatedCompmembers
				},
				success : function(response) {
					// 서버에서 성공적으로 응답이 오면
					// 새로운 리뷰 내용을 화면에 즉시 반영
					// 이 부분은 필요에 따라서 페이지 전체를 다시 로드하거나, 특정 부분만 업데이트할 수 있습니다.
					location.reload(); // 페이지 전체 다시 로드
				},
				error : function(xhr, status, error) {
					console.error("Error updating comp:", error);
				}
			});
		}
	</script>



	<!-- 삭제 Modal -->
	<div class="modal fade" id="dele" data-bs-backdrop="static"
		tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: red">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">삭제</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="del_body">진짜 삭제 하시겠습니까?</div>
				<div class="modal-footer" id="del_fot">
					<form action="${pageContext.request.contextPath}/deleteComp"
						method="post" id="deleteComp">
						<input type="hidden" name="comp_idx"
							value="${board.getComp_idx()}" />
						<button type="button" class="btn btn-danger fl_btn delete"
							onclick="confirmDelete()">예</button>
						<button type="button" class="btn btn-primary fl_btn del2"
							data-bs-dismiss="modal">아니오</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		function confirmDelete() {
			document.getElementById('deleteComp').submit();
		}
	</script>








	<div id="contain">
		<div id="revBox">
			<div id="revTitle">
				<p>${board.comp_title}</p>
				<div id="revInfo">
					<div>
						<span id="userImg"></span>
					
							<span id="userId">${board.mb_id}</span>
							
						
					</div>
					<span>${board.created_at.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"))}</span>
				</div>
			</div>
			<div id="revContent">
				<div id="revPhoto">
					<img src="resources/upload1/${board.comp_img}" alt="">
				</div>
				<div id="revTxt">${board.comp_content}</div>
				<div id="travelInfo">
					<span>지역 : </span>${board.comp_tourplace} <br> <span>모집인원
						: </span>${board.comp_members} <br> <span>날짜 : </span>
					${board.comp_start}</span>~<span>${board.comp_end} <br>
				</div>
			</div>
			<div id="userAction">

				<div id="comment">
					<i class="fa-regular fa-comment-dots" id="normal-comments"></i>
				</div>
			</div>

			<div class="showComment">
				<form action="${pageContext.request.contextPath}/addGrComment"
					method="post">
					<input type="hidden" name="comp_idx"
						value="<%=board.getComp_idx()%>" />
					<textarea name="commentContent" rows="3" cols=""
						placeholder="댓글을 입력해주세요"></textarea>
					<button type="submit">등록</button>
				</form>
			</div>



			<%
			if (loginMember != null && board != null && board.getComments() != null && !board.getComments().isEmpty()) {
			%>
			<ul class="commentList">
				<%
				for (Comment comment : board.getComments()) {
				%>
				<li>
					<div class="commentLeft">
						<div class="commentImg"></div>
						<div class="commentContent">
							<p><%=comment.getMb_id()%></p>
							<p><%=comment.getCmt_content()%></p>
						</div>
					</div>
					<div class="commentDate">
						<%-- 댓글 작성자일 경우에만 수정 및 삭제 버튼 표시 --%>
						<%
						if (loginMember.getMb_id().equals(comment.getMb_id())) {
						%>
						<button class="updateCommentBtn" data-bs-toggle="modal"
							data-bs-target="#updateGrCommentModal"
							onclick="showUpdateGrCommentForm(<%=comment.getCmt_idx()%>)">수정</button>
						<form action="${pageContext.request.contextPath}/deleteGrComment"
							method="post">
							<input type="hidden" name="cmt_idx"
								value="<%=comment.getCmt_idx()%>" /> <input type="hidden"
								name="comp_idx" value="${board.getComp_idx()}" />
							<button type="submit" class="deleteCommentBtn">삭제</button>
						</form>
						<%
						}
						%>
						<%=comment.getCreated_at().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))%>
					</div>
				</li>
				<%
				}
				%>
			</ul>
			<%
			} else {
			%>
			<p>댓글이 없습니다.</p>
			<%
			}
			%>
		</div>
	</div>
	
	<!-- 수정 폼 모달 -->
	<div class="modal fade" id="updateGrCommentModal" tabindex="-1"
		aria-labelledby="updateGrCommentModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updateCommentGrModalLabel">댓글 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 수정 폼 내용 -->
					<form id="updateGrCommentForm"
						action="${pageContext.request.contextPath}/updateGrComment"
						method="post">
						<input type="hidden" id="cmt_idx_input" name="cmt_idx" /> <input
							type="hidden" name="comp_idx" value="${board.getComp_idx()}" />
						<div class="mb-3">
							<label for="updatedGrContent" class="form-label">댓글 내용</label>
							<textarea class="form-control" id="updatedGrContent"
								name="updatedGrContent" rows="3"></textarea>
						</div>
						<div id="g_btn_co">
						<button class="updateGrCommentBtn btn-primary s_btn" onclick="submitUpdateGrComment()">수정</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/assets/js/jquery.min.js"></script>
	<script type="text/javascript">

        $(document).ready(function () {
            // 좋아요 및 댓글 표시 여부 설정
            $("#full-heart").hide();
            $("#full-comments").hide();            

       
            // 댓글 등록 후 입력 필드 초기화
            $("#commentForm").on("submit", function () {
                $("#commentContent").val("");
            });
        });

        function showUpdateGrCommentForm(cmt_idx, existingContent) {
            console.log("cmt_idx: ", cmt_idx);
            console.log("existingContent: ", existingContent)
            $("#cmt_idx_input").val(cmt_idx);
            $("#updatedGrContent").val(existingContent);
            $("#comp_idx_input").val(comp_idx); // 리뷰 인덱스 추가
            $("#updateGrCommentModal").modal("show");
        }

        function submitUpdateGrComment() {
            // 댓글 수정 폼을 서버로 제출
            var updatedContent = $("#updatedGrContent").val();
            var cmt_idx = $("#cmt_idx_input").val();
            var comp_idx = $("#comp_idx_input").val(); // 리뷰 인덱스 가져오기

            // AJAX를 사용하여 비동기적으로 수정 내용을 서버로 전송
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/updateGrComment",
                data: {
                    cmt_idx: cmt_idx,
                    comp_idx: comp_idx,
                    updatedGrContent: updatedContent // 변수명 수정
                },
                success: function (response) {
                    // 서버에서 성공적으로 응답이 오면
                    // 새로운 댓글 내용을 화면에 즉시 반영
                    var commentElement = $("#comment_" + cmt_idx);
                    commentElement.find(".commentContent p:last-child").text(updatedContent);

                    // 모달 닫기
                    $("#updateGrCommentModal").modal("hide");
                },
                error: function (xhr, status, error) {
                    console.error("Error updating comment:", error);
                }
            });
        }
        
    </script>
	
	<!-- contain end -->
	<%@ include file="./F_chat.jsp"%>
	<footer></footer>
</body>
</html>
