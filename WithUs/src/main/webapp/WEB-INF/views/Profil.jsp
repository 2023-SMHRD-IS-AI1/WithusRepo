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
<link rel="stylesheet" href="resources/assets/css/reset.css" />

<title>프로필상세</title>
</head>
<body>
   <%@ include file="./nav.jsp"%>

   <%
   Member memPro = (Member) session.getAttribute("memPro");
   // System.out.println(memPro);
   String mb_age = (String) session.getAttribute("mb_age");
   %>



   <div id="mainImg"></div>
   <!-- mainImg end -->
   <div id="contain">

     <div class="container m-auto mt-4 p-5 p-md-1 ">
        <div class="profile--container row shadow-sm p-5 p-md-2 mb-5 bg-body rounded flex-md-row align-items-md-center">
            <div class="profile row align-items-end col-md-7">
                <div class="avatar  col-4 col-md-3 rounded-circle align-self-center">
                    <img src="resources/pro_img/<%=memPro.getMb_proimg() %>">
                </div>
                <div class="name col-8">
                    <h2 class="mb-0 fs-2">닉네임</h2><%=memPro.getMb_nick() %>
                 
                    <!-- <i class="fas fa-map-marker-alt fontjordyblue"></i><span class="fontjordyblue"> 대구 수성구</span> -->
                    <br>
                    <button type="button" class="btn text-white btn-danger" data-bs-target="#reportModal">신고</button>
                    <button type="button" id="followbtn" class="btn text-white btn-primary" onclick="toggleFollow('<%=loginMember.getMb_id() %>','<%=memPro.getMb_id() %>')">팔로우</button>
                    
                </div>
            </div>
            
            
                 <!-- "신고" (Report) Modal -->
        <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: red">
                        <h5 class="modal-title" id="reportModalLabel">신고하기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="reportForm">
                            <div class="mb-3">
                                <label for="reportContent" class="form-label">신고 내용:</label>
                                <textarea class="form-control" id="report_content" rows="3"></textarea>
                            </div>
                            <!-- 추가: 신고 대상 정보를 hidden input으로 전달 -->
                            <input type="hidden" id="reporter" value="<%=memPro.getMb_id()%>" />
                            <input type="hidden" id="reportee" value="<%=memPro.getMb_id() %>" /> <!-- 대상 사용자 ID를 여기에 입력 -->
                            <button type="button" class="btn btn-danger" onclick="submitReport()">신고하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

            
            
            
            
            
            <div class="verticaLline col-lg-1 border-start"></div>
            <div class="information row mt-5 mt-md-3 pt-4 pt-md-0 mb-2 col-md-4 vr-4 border-md-start">
                <h4 class="col-4 col-md-5 mb-4 mb-md-3">나이</h4>
                <h4 class="col-8 col-md-7">${mb_age }</h4>
                <h4 class="col-4 col-md-5 mb-4 mb-md-3">MBTI</h4>
                <h4 class="col-8 col-md-7"><%=memPro.getMb_mbti() %></h4>
                <h4 class="col-4 col-md-5 mb-4 mb-md-3">팔로우</h4>
                <h4 class="col-8 col-md-7"><span class="followingCount"></span></h4>
                <h4 class="col-4 col-md-5 mb-4 mb-md-3">팔로잉</h4>
                <h4 class="col-8 col-md-7"><span class="followerCount"></span></h4>
 
            </div>
        </div>
        <div class="menubar mb-5">
            <div><span class="menubar__Profile fontjordyblue">Profile</span></div>
            <div class="progress" style="height: 2px; ">
                <div class="progress-bar backjordyblue" role="progressbar" style="width: 120px" aria-valuenow="50"
                    aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
        <div class="bottomContainer">
            <div class="works shadow-sm p-5 mb-5 bg-body rounded">
                <h3>자기소개</h3>
                <p><%=memPro.getMb_comment() %>
              </p>
            </div>
        </div>

    </div>
</div>
   <footer></footer>
   <script src="resources/assets/js/jquery.min.js"></script>


   <script type="text/javascript">
   $(document).ready(function() {
       // 페이지 로드 완료 시 getFollowData 함수 실행
       getFollowData();
   });

   
   
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
    

    function getFollowData() {
        // 현재 보고 있는 프로필의 사용자 ID
        var userId = "<%=memPro.getMb_id()%>";
      

         // 팔로워 정보 가져오기
         $
               .ajax({
                  url : 'getFollowers/' + userId,
                  type : 'GET',
                  success : function(followerData) {
                     // 팔로워 정보 처리
                     document.getElementsByClassName('followerCount')[0].innerText = followerData.count;
                  },
                  error : function(error) {
                     console.log(userId);
                     console.error('팔로워 정보 가져오기 실패:', error);
                  }
               });

         // 팔로잉 정보 가져오기
         $
               .ajax({
                  url : 'getFollowings/' + userId,
                  type : 'GET',
                  success : function(followingData) {
                     // 팔로잉 정보 처리
                     document.getElementsByClassName('followingCount')[0].innerText = followingData.count;
                  },
                  error : function(error) {
                     console.error('팔로잉 정보 가져오기 실패:', error);
                  }
               });
      }

       // 모달 초기화
        var reportModal = new bootstrap.Modal(document.getElementById('reportModal'));

        // "신고" 버튼 클릭 시 모달 열기
        function openReportModal() {
            reportModal.show();
        }

        // 기존 "신고" 버튼 클릭 이벤트 수정하여 모달 열기
        document.querySelector('.btn-danger').addEventListener('click', openReportModal);
      
       function submitReport() {

         var formData = {
            reporter : document.getElementById('reporter').value,
            reportee : document.getElementById('reportee').value,
            report_content : document.getElementById('report_content').value
         };

         $.ajax({
            type : "POST",
            url : "report",
            contentType : "application/json",
            data : JSON.stringify(formData),
            success : function(response) {
               if (typeof response === 'number') {
                  // 신고 횟수 처리
                  console.log("신고 횟수: " + response);
               } else {
               }
               alert("신고가 접수되었습니다.");
            },
            error : function(error) {
               alert("이미 신고한 회원은 신고가 불가능합니다.");
            }
         });
      }
        
      
   
   </script>

</body>
</html>