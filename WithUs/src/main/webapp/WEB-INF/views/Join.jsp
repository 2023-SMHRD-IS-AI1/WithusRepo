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
<title>Join With Us!</title>
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
        <input type="text" name="mb_id"  class="form-control" id="inputE" placeholder="ID" />
        
             <li><input type="button" value="중복체크" onclick="checkE()" /></li>
         <p id="resultCheck"></p>      
        
        <label for="exampleFormControlInput1" class="form-label">비밀번호 *</label>
        <input type="password"name="mb_pw" class="form-control" id="exampleFormControlInput1" placeholder="PW" />
        <label for="exampleFormControlInput1" class="form-label">이름 *</label>
        <input type="text" name="mb_name" class="form-control" id="exampleFormControlInput1" placeholder="NAME" />
        
        <label for="exampleFormControlInput1" class="form-label">닉네임 *</label>
        <input type="text" name="mb_nick" class="form-control" id="inputN" placeholder="NICKNAME" />
        
        <li><input type="button" value="중복체크" onclick="checkN()" /></li>
         <p id="resultCheck2"></p>
        
        
        
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
    <script src="resources/assets/js/jquery.min.js"></script>
         <script src="resources/assets/js/jquery.scrolly.min.js"></script>
         <script src="resources/assets/js/jquery.scrollex.min.js"></script>
         <script src="resources/assets/js/skel.min.js"></script>
         <script src="resources/assets/js/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="resources/assets/js/main.js"></script>

    <script type="text/javascript">
    
    // 아이디 중복 체크
    function checkE() {
      var inputE = $('#inputE').val()

      $.ajax({ // json 형식 {key:value, key:value}
         // 어디로 요청할 것인지(요쳥 url)
         url : 'emailCheck',
         // 요청 데이터
         data : { 'inputE' : inputE },
         // 요청 방식
         type : 'get',
         // 요청-응답 성공
         success : function(data){
            // 불가능 : 0 가능: 1
            // alert(data)
            if(data ==0){
               $('#resultCheck').text('이미 존재하는 아이디입니다.')
            }else{
               $('#resultCheck').text('가입 가능한 아이디입니다.')
            }
         },
         // 요청-응답 실패
         error : function(){
            alert("통신 실패")
         }
      })
    }
    // 닉네임 중복 체크
    function checkN() {
       
       var inputN = decodeURIComponent($('#inputN').val());
      
       console.log(inputN)
      
      $.ajax({
      
         url : 'nickCheck',
          data : { 'inputN' : encodeURIComponent($('#inputN').val()) },
          type : 'get',
          contentType: "application/x-www-form-urlencoded; charset=UTF-8",
          
         success : function(data){
            if(data ==0){
               $('#resultCheck2').text('이미 존재하는 닉네임입니다.')
            }else{
               $('#resultCheck2').text('사용 가능한 닉네임입니다.')
            }
         },
         // 요청-응답 실패
         error : function(){
            alert("통신 실패")
         }
      })
    }
    </script>
    
</body>
</html>
