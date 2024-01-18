<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>리뷰 내용</title>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/d5377ff581.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
            rel="stylesheet"/>
    <link rel="stylesheet" href="resources/assets/css/grcontent.css"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/assets/css/reset.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>
</head>
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
	

</style>
<body>

<%@ include file="./nav.jsp" %>
<div id="mainImg"></div>
<!-- mainImg end -->
<h1 id="title">리뷰</h1>
<div id="del">
    <a href="goRewrmodify"><p><i class="fa-solid fa-pencil"></i>수정</p></a>
    <p data-bs-toggle="modal" data-bs-target="#dele"><i class="fa-solid fa-trash" ></i>삭제</p>
</div>

	<!-- Modal -->
	<div class="modal fade" id="dele" data-bs-backdrop="static"  tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    	<div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h1 class="modal-title fs-5" id="staticBackdropLabel">삭제</h1>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>	      
		        <div class="modal-body" id="del_body">
		         진짜 삭제 하시겠습니까?
	            </div>
	        </div>
        <div class="modal-footer" id = "del_fot">
          <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
          <button type="button" class="btn btn-danger fl_btn del1">예</button>
          <button type="button" class="btn btn-primary fl_btn del2">아니오</button>
    	</div>
  	</div>
  </div>
<!-- 삭제 모달  -->
<script>
    // 삭제 버튼 클릭 시 이벤트 처리
    $('#confirmDeleteBtn').on('click', function() {
        // 여기에 삭제 동작을 수행하는 JavaScript 코드 추가
        // 예를 들어, AJAX를 사용하여 서버에 삭제 요청을 보낼 수 있습니다.
        // 삭제가 완료되면 모달을 닫을 수 있습니다.
        $('#deleteModal').modal('hide');
    });
</script>
<div id="contain">
    <div id="revBox">
        <div id="revTitle">
            <p>리뷰제목</p>
            <div id="revInfo">
                <div>
                    <span id="userImg"></span>
                    <span id="userNick">닉네임</span>
                </div>
                <span>2024.01.17</span>
            </div>
        </div>
        <div id="revContent">
            <div id="revPhoto">
                <img src="resources/upload1/강릉.jpg" alt="">
            </div>
            <div id="revTxt">
                여기 너무 조아요 ~ !!
                여행 너무 재밌었어요 ~ !!
            </div>
            <div id="travelInfo">
                <span>지역 : </span>강릉 <br>
                <span>여행기간 : </span>2024.01.10 ~ 2024.01.13<br>
                <span>동행인원 : </span>4
            </div>
        </div>
        <div id="userAction">
            <div id="like"><i class="fa-regular fa-heart" id="normal-heart"></i><i class="fa-solid fa-heart"
                                                                                    id="full-heart"></i> 300
            </div>
            <div id="comment"><i class="fa-regular fa-comment-dots" id="normal-comments"></i><i
                    class="fa-solid fa-comment-dots"
                    id="full-comments"> </i></div>
        </div>
        <div class="showComment">
            <form action="">
                <textarea rows="3" cols="" placeholder="댓글을 입력해주세요"></textarea>
                <button type="submit">등록</button>
            </form>
        </div>
        <ul class="commentList">
            <li>
                <div class="commentLeft">
                    <div class="commentImg"></div>
                    <div class="commentContent">
                        <p>닉네임</p>
                        <p>commentcommentcommentcommentcommentcommentcomment</p>
                    </div>
                </div>
                <div class="commentDate">2024.01.17</div>
            </li>
            <li>
                <div class="commentLeft">
                    <div class="commentImg"></div>
                    <div class="commentContent">
                        <p>닉네임</p>
                        <p>commentcommentcommentcommentcommentcommentcomment</p>
                    </div>
                </div>
                <div class="commentDate">2024.01.17</div>
            </li>
        </ul>
    </div>
</div>
<!-- contain end -->
<%@ include file="./F_chat.jsp" %>
<footer></footer>

<script type="text/javascript">

    $("#full-heart").hide();
    $("#full-comments").hide();
    $(".showComment").hide();
    $(".commentList").hide();

    $("#normal-heart").click(() => {
        $("#normal-heart").hide();
        $("#full-heart").show();
    })
    $("#full-heart").click(() => {
        $("#normal-heart").show();
        $("#full-heart").hide();
    })
    $("#normal-comments").click(() => {
        $("#normal-comments").hide();
        $("#full-comments").show();
        $(".showComment").show();
        $(".commentList").show();
    })
    $("#full-comments").click(() => {
        $("#normal-comments").show();
        $("#full-comments").hide();
        $(".showComment").hide();
        $(".commentList").hide();
    })
</script>

</body>
</html>
