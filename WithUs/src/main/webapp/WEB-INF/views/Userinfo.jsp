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
<title>Forty by HTML5 UP</title>
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
<link rel="stylesheet"  href="resources/assets/css/userInfo.css" />
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
      <form action="goProfil">
        <label for="exampleFormControlInput1" class="form-label">아이디 *</label>
        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="ID" />
        <label for="exampleFormControlInput1" class="form-label">비밀번호 *</label>
        <input type="password" class="form-control" id="exampleFormControlInput1" placeholder="PW" />
        <div id="warn">
          <p>사용할 수 없는 아이디입니다. 다른 아이디를 입력해주세요.</p>
        </div>
        <label for="exampleFormControlInput1" class="form-label">이메일 *</label>
        <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="EMAIL" />
        <label for="exampleFormControlInput1" class="form-label">전화번호 *</label>
        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="PHONE NUMBER" />
        <input id="submit" class="btn btn-primary" type="submit" value="수정" />
      </form>
      
    </div>
    
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

