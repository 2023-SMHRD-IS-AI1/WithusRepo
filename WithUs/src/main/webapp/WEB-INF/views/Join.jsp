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
<link rel="stylesheet" href="resources/assets/css/join.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<%@ include file="./nav.jsp" %>
    <div id="mainImg">회원가입</div>
    <div id="contain">

      <form action="goResult" method="post">
        <label for="exampleFormControlInput1" class="form-label">아이디 *</label>
        <input type="text" name="mb_id" class="form-control" id="exampleFormControlInput1" placeholder="ID" />
        <label for="exampleFormControlInput1" class="form-label">비밀번호 *</label>
        <input type="password"name="mb_pw" class="form-control" id="exampleFormControlInput1" placeholder="PW" />
        <label for="exampleFormControlInput1" class="form-label">이름 *</label>
        <input type="text" name="mb_name" class="form-control" id="exampleFormControlInput1" placeholder="NAME" />
        <label for="exampleFormControlInput1" class="form-label">닉네임 *</label>
        <input type="text" name="mb_nick" class="form-control" id="exampleFormControlInput1" placeholder="NICKNAME" />
        <div id="warn">
          <p>사용할 수 없는 아이디입니다. 다른 아이디를 입력해주세요.</p>
          <p>사용할 수 없는 닉네임입니다. 다른 닉네임을 입력해주세요.</p>
        </div>
        
        
        <label for="exampleFormControlInput1" class="form-label">생년월일 *</label>
        <input type="date" name="mb_birthdate" class="form-control" id="exampleFormControlInput1" placeholder="BIRTHDAY" />
        <label for="exampleFormControlInput1" class="form-label">성별 *</label>
        <div id="radio" >
          <input class="form-check-input" name="mb_gender" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" />
          <label class="form-check-label" for="inlineRadio1">남성</label>
          <input class="form-check-input" name="mb_gender" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2" />
          <label class="form-check-label" for="inlineRadio2">여성</label>
        </div>
        <label for="exampleFormControlInput1" class="form-label">휴대폰번호 *</label>
        <input type="text" class="form-control" name="mb_phone" id="exampleFormControlInput1" placeholder="PHONE NUMBER" />
        
        <label for="formFile" class="form-label">신분증사진 *</label>

        <input class="form-control" type="file" name="mb_img" id="formFile" />
        <input id="submit" class="btn btn-primary" type="submit" value="다음" />
        

      </form>
      
    </div>
    <!-- contain end -->
    <footer></footer>
</body>
</html>

