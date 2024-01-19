<%@ page import="kr.smhrd.entity.reviewBoard" %>
<%@ page import="kr.smhrd.entity.Comment" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>리뷰 내용</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/d5377ff581.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="resources/assets/css/grcontent.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
     
	
<style>


	#dele{
	
		height: 220px;
		
	}
	
	#del_fot{
	
	position: relative;
	bottom: 170px;
	
	
	}
	
	#del_body{
	
	text-align: center;
	position: relative;
	top: 10px;
	
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
        
        #p_bodays{
        
        	height: 490px;
        
        }
        
        #f_btn2{
        	position: relative;
        	left: 140px;
        }
</style>
<body>
	
	<%
        // 'review' 객체를 가져오는 코드
        reviewBoard review = (reviewBoard) request.getAttribute("review");
        if (review != null) {
            request.setAttribute("review", review); // review 속성을 설정하여 JSP 페이지로 전달
        }
    %>
    
<%@ include file="./nav.jsp" %>
<div id="mainImg"></div>
<!-- mainImg end -->
<h1 id="title">리뷰</h1>

<div id="del">
  <%-- 리뷰 수정 및 삭제 버튼 --%>
<%
    if (loginMember != null && loginMember.getMb_id() != null && loginMember.getMb_id().equals(review.getMb_id())) {
%>
    <!-- 리뷰 수정 링크 -->
   <%-- <a href="${pageContext.request.contextPath}/gorewrModify/${review.getReview_idx()}"> --%>
                <p data-bs-toggle="modal" data-bs-target="#updateReviewModal"><i class="fa-solid fa-pencil"></i>수정</p>
           <!--  </a> -->
    <!-- 리뷰 삭제 모달 -->
    <p  data-bs-toggle="modal" data-bs-target="#dele"><i class="fa-solid fa-trash"></i>삭제</p>
<%
    }
%>
</div>
	<!-- 수정 폼 모달 -->
<div class="modal fade" id="updateReviewModal" tabindex="-1" aria-labelledby="updateReviewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateReviewModalLabel">리뷰 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="p_bodays">
                <!-- 수정 폼 내용 -->
                <form id="updateReviewForm" action="${pageContext.request.contextPath}/updateReview" method="post">
                    <input type="hidden" name="review_idx" value="${review.getReview_idx()}" />
                    <div class="mb-3">
                        <label for="updatedTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" id="updatedTitle" name="review_title"
                               value="${review.getReview_title()}" required />
                    </div>
                    <div class="mb-3">
                        <label for="updatedContent" class="form-label">내용</label>
                        <textarea class="form-control" id="updatedContent" name="review_content"
                                  rows="5" required>${review.getReview_content()}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="updatedRegion" class="form-label">지역</label>
                        <textarea class="form-control" id="updatedRegion" name="review_region"
                                  rows="5" required>${review.getReview_region()}</textarea>
                    </div>
                    <div id="f_btn2">
                    <button type="button" class="btn btn-primary" onclick="submitUpdateReview()">수정 완료</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                	</div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function submitUpdateReview() {
        // 리뷰 수정 폼을 서버로 제출
        var review_idx = "${review.getReview_idx()}";
        var updatedTitle = $("#updatedTitle").val();
        var updatedContent = $("#updatedContent").val();
        var updatedRegion = $("#updatedRegion").val();

        // AJAX를 사용하여 비동기적으로 수정 내용을 서버로 전송
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/updateReview",
            data: {
                review_idx: review_idx,
                review_title: updatedTitle,
                review_content: updatedContent,
                review_region: updatedRegion
            },
            success: function (response) {
                // 서버에서 성공적으로 응답이 오면
                // 새로운 리뷰 내용을 화면에 즉시 반영
                // 이 부분은 필요에 따라서 페이지 전체를 다시 로드하거나, 특정 부분만 업데이트할 수 있습니다.
                location.reload(); // 페이지 전체 다시 로드
            },
            error: function (xhr, status, error) {
                console.error("Error updating review:", error);
            }
        });
    }
</script>
	
	
	
<!-- 삭제 Modal -->
<div class="modal fade" id="dele" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">삭제</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="del_body">
                진짜 삭제 하시겠습니까?
            </div>
            <div class="modal-footer" id="del_fot">
             <form action="${pageContext.request.contextPath}/deleteReview" method="post" id="deleteForm">
    <input type="hidden" name="review_idx" value="${review.getReview_idx()}" />
    <button type="button" class="btn btn-danger fl_btn delete" onclick="confirmDelete()">예</button>
    <button type="button" class="btn btn-primary fl_btn del2" data-bs-dismiss="modal">아니오</button>
</form>
            </div>
        </div>
    </div>
</div>

<script>
    function confirmDelete() {
        document.getElementById('deleteForm').submit();
    }
</script>
<div id="contain">
        <div id="revBox">
            <div id="revTitle">
                <p>${review.review_title}</p>
                <div id="revInfo">
                    <div>
                        <span id="userImg"></span>
                        <span id="userNick">${review.mb_id}</span>
                    </div>
                    <span>${review.reviewed_at.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"))}</span>
                </div>
            </div>
            <div id="revContent">
                <div id="revPhoto">
                    <img src="resources/upload1/${review.review_img}" alt="">
                </div>
                <div id="revTxt">
                    ${review.review_content}
                </div>
                <div id="travelInfo">
                    <span>지역 : </span>${review.review_region} <br>
                </div>
            </div>
            <div id="userAction">
                <div id="like"><i class="fa-regular fa-heart" id="normal-heart"></i><i class="fa-solid fa-heart"
                        id="full-heart"></i>
                         <span id="likeCount">0</span>
                         </div>
                <div id="comment"><i class="fa-regular fa-comment-dots" id="normal-comments"></i><i
                        class="fa-solid fa-comment-dots" id="full-comments"> </i></div>
            </div>
            
       <div class="showComment">
                <form action="${pageContext.request.contextPath}/addComment" method="post">
                    <input type="hidden" name="review_idx" value="<%= review.getReview_idx() %>" />
                    <textarea name="commentContent" rows="3" cols="" placeholder="댓글을 입력해주세요"></textarea>
                    <button type="submit">등록</button>
                </form>
            </div>

            <%
                if (loginMember != null && review != null && review.getComments() != null && !review.getComments().isEmpty()) {
            %>
                <ul class="commentList">
                    <%
                        for (Comment comment : review.getComments()) {
                    %>
                        <li>
                            <div class="commentLeft">
                                <div class="commentImg"></div>
                                <div class="commentContent">
                                    <p><%= comment.getMb_id() %></p>
                                    <p><%= comment.getCmt_content() %></p>
                                </div>
                            </div>
                            <div class="commentDate">
                                <%-- 댓글 작성자일 경우에만 수정 및 삭제 버튼 표시 --%>
                                <% if (loginMember.getMb_id().equals(comment.getMb_id())) { %>
                                    <button class="updateCommentBtn" data-bs-toggle="modal" data-bs-target="#updateCommentModal" onclick="showUpdateCommentForm(<%= comment.getCmt_idx()%>)">수정</button>
                                    <form action="${pageContext.request.contextPath}/deleteComment" method="post">
                                        <input type="hidden" name="cmt_idx" value="<%= comment.getCmt_idx()%>" />
                                        <input type="hidden" name="review_idx" value="${review.getReview_idx()}" />
                                        <button type="submit" class="deleteCommentBtn">삭제</button>
                                    </form>
                                <% } %>
                                <%= comment.getCreated_at().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %>
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
    <div class="modal fade" id="updateCommentModal" tabindex="-1" aria-labelledby="updateCommentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateCommentModalLabel">댓글 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 수정 폼 내용 -->
                    <form id="updateCommentForm" action="${pageContext.request.contextPath}/updateComment" method="post">
                        <input type="hidden" id="cmt_idx_input" name="cmt_idx" />
                        <input type="hidden" name="review_idx" value="${review.getReview_idx()}" />
                        <div class="mb-3">
                            <label for="updatedContent" class="form-label">댓글 내용</label>
                            <textarea class="form-control" id="updatedContent" name="updatedContent" rows="3"></textarea>
                        </div>
                        <button class="updateCommentBtn"  onclick="submitUpdateComment()">수정</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    





  <script type="text/javascript">
  </script>
 <script src="resources/assets/js/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            // 좋아요 및 댓글 표시 여부 설정
            $("#full-heart").hide();
            $("#full-comments").hide();


            // 좋아요 버튼 클릭 시

           
            <% if (review != null && loginMember != null) { %>
            var review_idx = <%= review.getReview_idx() %>;
            var mb_id = <%= loginMember.getMb_id() %>;
        <% } else { %>
				
        <% } %>
        function updateLikeCount(review_idx) {
            $.ajax({
                url: 'reviewLike/count',
                type: 'GET',
                data: { review_idx: review_idx },
                success: function(likeCount) {
                	console.log("좋아요 개수" + likeCount);
                    $("#likeCount").text(likeCount);
                },
                error: function(xhr, status, error) {
                    console.error('좋아요 개수 조회 실패:', error);
                }
            });
        }
/*             // 좋아요 버튼 클릭 시

            $("#normal-heart").click(() => {
                $("#normal-heart").hide();
                $("#full-heart").show();
            });

            // 좋아요 취소 버튼 클릭 시
            $("#full-heart").click(() => {
                $("#normal-heart").show();
                $("#full-heart").hide();
            }); */
        	  // 좋아요 버튼 클릭 시
            $("#normal-heart").click(() => {
            	
                console.log(mb_id);
                console.log(review_idx);
                $.ajax({
                    url: 'reviewLike/add',
                    type: 'POST',
                    data: { review_idx: review_idx, mb_id: mb_id },
                    success: function(response) {
                    	let Likecount = updateLikeCount(review_idx)
                        $("#normal-heart").hide();
                        $("#full-heart").show();
                        $("#likeCount").text(Likecount);
                        
                    },
                    error: function(xhr, status, error) {
                        console.error('좋아요 추가 실패:', error);
                    }
                });
            });


            // 좋아요 취소 버튼 클릭 시
            $("#full-heart").click(() => {

                $.ajax({
                    url: 'reviewLike/delete',
                    type: 'POST',
                    data: { review_idx: review_idx, mb_id: mb_id },
                    success: function(response) {
                    	let Likecount = updateLikeCount(review_idx)
                        $("#normal-heart").show();
                        $("#full-heart").hide();
                        $("#likeCount").text(Likecount);
                        
                    },
                    error: function(xhr, status, error) {
                        console.error('좋아요 삭제 실패:', error);
                    }
                });
            });
               
            // 댓글 보기 버튼 클릭 시
            $("#normal-comments").click(() => {
                $("#normal-comments").hide();
                $("#full-comments").show();
                $(".showComment").show();
                $(".commentList").show();
            });

        


            // 댓글 등록 후 입력 필드 초기화
            $("#commentForm").on("submit", function () {
                $("#commentContent").val("");
            });
        });

        // 댓글 수정을 위한 JavaScript 코드
        function showUpdateCommentForm(cmt_idx, existingContent) {
        	console.log("cmt_idx: ", cmt_idx);
            console.log("existingContent: ", existingContent)
            $("#cmt_idx_input").val(cmt_idx);
            $("#updatedContent").val(existingContent);
            $("#review_idx_input").val(review_idx); // 리뷰 인덱스 추가
            $("#updateCommentModal").modal("show");
        }

        function submitUpdateComment() {
            // 댓글 수정 폼을 서버로 제출
            var updatedContent = $("#updatedContent").val();
            var cmt_idx = $("#cmt_idx_input").val();
            var review_idx = $("#review_idx_input").val(); // 리뷰 인덱스 가져오기

            // AJAX를 사용하여 비동기적으로 수정 내용을 서버로 전송
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/updateComment",
                data: {
                    cmt_idx: cmt_idx,
                    review_idx: review_idx,
                    updatedContent: updatedContent
                },
                success: function (response) {
                    // 서버에서 성공적으로 응답이 오면
                    // 새로운 댓글 내용을 화면에 즉시 반영
                    var commentElement = $("#comment_" + cmt_idx);
                    commentElement.find(".commentContent p:last-child").text(updatedContent);
                    
                    // 모달 닫기
                    $("#updateCommentModal").modal("hide");
                },
                error: function (xhr, status, error) {
                    console.error("Error updating comment:", error);
                }
            });
        }
        
    </script>

    <%@ include file="./F_chat.jsp" %>
    <footer></footer>

</body>
</html>
