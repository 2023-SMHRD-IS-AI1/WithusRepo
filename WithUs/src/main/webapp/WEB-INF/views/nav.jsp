<%@page import="kr.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
     <link rel="stylesheet" href="resources/assets/css/nav.css" />
     <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<style>
  
    #p_img{
        border-radius: 500px;
        width: 150px;
        height: 150px;
        position: relative;
        left: 35px;
        top:40px;
    }

     #p_con{
        position: relative;
        left: 210px;
        bottom: 105px;
    }

    .modal-header{
        background-color: lightskyblue;
       
    }

    .modal-title{
        align-items: center;

    }

    .modal-body{
        height: 235px;
        font-weight: bold;
    }

    .fl_btn{
        position: relative;
        right: 200px;
    }

    .all{
        position: relative;
        bottom:15px;
    }
    .modal-title{
        font-weight: bold;
        position: relative;
        left: 205px;
        
    }

 



</style>
<body>

	<% Member loginMember = (Member)session.getAttribute("loginMember"); %>

	  <header>
      <div id="logo">
        <a href="goMain"><img src="resources/images/logo.png" alt="" /></a>
      </div>
      <nav>
        <ul id="menu">
          <li><a href="goMain">홈</a></li>
          <li><a href="goGroup">커뮤니티</a></li>
        </ul>
      </nav>
      <ul id="r_nav">

        <% if (loginMember == null){ %>
        <li><a href="goLogin">로그인</a></li>
        <li><a href="goJoin">회원가입</a></li>
        <%}else {%>
        <li>
          <a data-bs-toggle="modal" data-bs-target="#mypmodal" onclick="openMyPmodal()"><i class="fa-solid fa-user"></i></a>
        </li>
        <li>
        	<a href="goUserinfo"><i class="fa fa-cog" aria-hidden="true"></i></a>
        </li>
        <li>
          <a href="goDaily"><i class="fa-solid fa-calendar"></i></a>
        </li>
        <li><a href="goLogout">로그아웃</a></li>
        
        <%} %>
      </ul>
    </header>
    
    <!-- Modal -->
    <div class="modal fade" id="mypmodal" data-bs-backdrop="static"  tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 외부 JSP 파일이 들어오는 부분 -->
                  <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="staticBackdropLabel">프로필</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
      
        <div class="modal-body">
            <div class="all">
          <img src="resources/images/user.png" id="p_img">
            <div id="p_con">
                <p>팔로우 : <span>200</span> &nbsp;&nbsp; 팔로잉 : <span>10</span></p>
                <br>
                <p>닉네임  : <span>닉네임</span></p>
                <br>
                <p>나이  : <span>24</span></p>
                <br>
                <p>MBTI  : <span>MBTI</span></p>

            </div>
        </div>
        </div>
      
      </div>
            </div>
        </div>
    </div>
    
   <script>
   
   	function openMyPmodal() {
		$('#mypmodal .modal-content').load("mypmodal.jsp")
		$('#mypmodal').modal('show')
	}
   
   </script>
    
</body>
</html>