<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>UserproInfo</title>
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
<link rel="stylesheet"  href="resources/assets/css/userProfileInfo.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<%@ include file="./nav.jsp" %>

  	
     <div id="contain">
      <div id="mainImg">
        <p><a href="goUserinfo">계정 관리</a></p>
        <p><a href="goUserproinfo">회원 정보 변경</a></p>
      </div>
      
      <form action="updateProfil" method="get" enctype="multipart/form-data">
        <div id="profileImg">

			<img src="resources/pro_img/<%= loginMember.getMb_proimg() %>">


        </div>
        
        <div class="input">
       <input type="hidden" name="mb_id" value= "<%=loginMember.getMb_id()%>">
       <input type="hidden" class="form-control" id="exampleFormControlInput1" name="mb_pw" value="<%=loginMember.getMb_pw() %>" />
       <input type="hidden" class="form-control" id="exampleFormControlInput1" name="mb_name" value="<%=loginMember.getMb_name() %>" />
       <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="<%=loginMember.getMb_nick() %>" readonly="readonly"/>
          <input type="hidden" class="form-control" id="exampleFormControlInput1" name="mb_birthdate" value="<%=loginMember.getMb_birthdate() %>" />
          <input type="hidden" class="form-control" id="exampleFormControlInput1" name="mb_gender" value="<%=loginMember.getMb_gender() %>" />
          <input type="hidden" class="form-control" id="exampleFormControlInput1" name="mb_phone" value="<%=loginMember.getMb_phone() %>" />
          <input type="hidden" class="form-control" id="exampleFormControlInput1" name="mb_img" value="<%=loginMember.getMb_img() %>" />
         <i class="fa-solid fa-camera"></i>프로필 이미지 변경 :<input type="file" name="mb_proimg">
          	
          
        </div>
        <div class="input">
          <i class="fa-solid fa-pencil"></i>
          <label for="exampleFormControlTextarea1" class="form-label"></label>
          <textarea id="textarea" class="form-control" name="mb_comment" id="exampleFormControlTextarea1" rows="3" placeholder="자기소개"></textarea>
        </div>
        <div class="input">
          <i class="fa-solid fa-pencil"></i>
          
          <input id="text" class="form-control" name="mb_mbti" id="exampleFormControlInput1" placeholder="MBTI" />
        </div>
        <input id="submit" class="btn btn-primary" type="submit" value="수정" />
      </form>
      
    </div>
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
    
    <script type="text/javascript">
    	
    </script>
    
</body>
</html>

