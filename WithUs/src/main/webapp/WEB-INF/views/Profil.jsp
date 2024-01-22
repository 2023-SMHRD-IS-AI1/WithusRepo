<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/d5377ff581.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/assets/css/profil.css" />

<title>프로필상세</title>
</head>
<body>
	<%@ include file="./nav.jsp"%>
	
	<% 
		Member memPro = (Member)session.getAttribute("memPro");
		// System.out.println(memPro);
		String mb_age = (String)session.getAttribute("mb_age");
		
	
	%>
	
	
	
	<div id="mainImg"></div>
	<!-- mainImg end -->
	<div id="contain">
		<div id="profileBox">
			<div id="boxL">
				<div id="boxL_top">
					<div id="proImg"><img class="uim" src="./resources/pro_img/<%=memPro.getMb_proimg()%>"></div>
				</div>
				<% if (loginMember == null) {%>
					<!-- 로그인 안한 상태 -->
				<%}else if(loginMember.getMb_id().equals(memPro.getMb_id())){ %>
					<!-- 로그인한 사람과 프로필 사람이 동일할 때 --> 
				<%}else{ %>
					<!-- 팔로우 버튼 -->
					<button type="button" id="followbtn" onclick="toggleFollow('<%=loginMember.getMb_id() %>','<%=memPro.getMb_id() %>')">팔로우</button>
					
					

				<%} %>

				<ul id="proDesc">
				
							<% if (memPro != null) { %>
					    <li><span>닉네임</span><%=memPro.getMb_nick() %></li>
					    <li><span>나이</span>${mb_age }</li>
					    <li><span>MBTI</span><%=memPro.getMb_mbti() %>
						<% } %>
					
					
				</ul>
			</div>
			<div id="boxR">
				<div id="boxR_top">
					<div id="follow">
						<span>팔로우</span><span class="followingCount"></span>
					</div>
					<div id="following">
						<span>팔로잉</span><span class="followerCount"></span>
					</div>
				</div>
				<div id="boxR">
				

				<!-- 신고 버튼 -->
					<form id="reportForm">
					    <input type="hidden" id="reporter" name="reporter" value="<%=loginMember.getMb_id() %>">
					    <input type="hidden" id="reportee" name="reportee" value="<%=memPro.getMb_id() %>">
					    <textarea id="report_content" name="report_content" placeholder="신고 내용을 입력해주세요."></textarea>
				    <button type="button" onclick="submitReport()">신고하기</button>
					</form>

				
				</div>
			</div>
		</div>
	</div>
	<footer></footer>
	 <script src="resources/assets/js/jquery.min.js"></script>
         

    <script type="text/javascript">
    function toggleFollow(followerId, followingId) {
        $.ajax({
            url: 'goFollow', 
            type: 'POST',
            contentType: 'application/json', // JSON 형식으로 데이터를 전송하겠다고 서버에 알림
            data: JSON.stringify({ 
                follower: followerId, 
                followee: followingId 
            }),
            success: function(response) {
            	if (response === 'followed') {
                    // 팔로우 상태로 변경 (예: 버튼 텍스트 변경)
                    document.getElementById('followbtn').innerText = '팔로우 취소';
                    console.log('팔로우 성공');
                } else if (response === 'unfollowed') {
                    // 팔로우 취소 상태로 변경
                    document.getElementById('followbtn').innerText = '팔로우';
                    console.log('팔로우 취소 성공');
                }
            	getFollowData();
            },
            error: function(xhr, status, error) {
                console.log('팔로우 실패');

            }
        });
    }
    
    $(document).ready(function() {
        // 페이지 로드 완료 시 getFollowData 함수 실행
        getFollowData();
    });

    function getFollowData() {
        // 현재 보고 있는 프로필의 사용자 ID
        var userId = '<%= memPro.getMb_id() %>';

        // 팔로워 정보 가져오기
        $.ajax({
            url: 'getFollowers/' + userId,
            type: 'GET',
            success: function(followerData) {
                // 팔로워 정보 처리
                document.getElementsByClassName('followerCount')[0].innerText = followerData.count;
            },
            error: function(error) {
            	console.log(userId);
                console.error('팔로워 정보 가져오기 실패:', error);
            }
        });

        // 팔로잉 정보 가져오기
        $.ajax({
            url: 'getFollowings/' + userId,
            type: 'GET',
            success: function(followingData) {
                // 팔로잉 정보 처리
                document.getElementsByClassName('followingCount')[0].innerText = followingData.count;
            },
            error: function(error) {
                console.error('팔로잉 정보 가져오기 실패:', error);
            }
        });
    }
    
	// 신고 기능
	function submitReport() {

	    var formData = {
	        reporter: document.getElementById('reporter').value,
	        reportee: document.getElementById('reportee').value,
	        report_content: document.getElementById('report_content').value
	    };
		
	    $.ajax({
	        type: "POST",
	        url: "report",
	        contentType: "application/json",
	        data: JSON.stringify(formData),
	        success: function(response) {
	        	if (typeof response === 'number') {
	                // 신고 횟수 처리
	                console.log("신고 횟수: " + response);
	            } else {
	            }
	            alert("신고가 접수되었습니다.");
	        },
	        error: function(error) {
	            alert("이미 신고한 회원은 신고가 불가능합니다.");
	        }
	    });
	}

    
    
    
    
    
</script>
	
</body>
</html>
