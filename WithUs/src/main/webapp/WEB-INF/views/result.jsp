<%@page import="org.apache.ibatis.reflection.SystemMetaObject" %>
<%@page import="kr.smhrd.entity.Message" %>
<%@page import="java.util.List" %>
<%@page import="kr.smhrd.entity.Member" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
				 pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Survey</title>
	<meta charset="utf-8"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap"/>
	<link
					href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
					rel="stylesheet"
					integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
					crossorigin="anonymous"
	/>
	<script src="https://kit.fontawesome.com/d5377ff581.js" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com"/>
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
				rel="stylesheet"/>
	<link rel="stylesheet" href="resources/assets/css/reset.css"/>
	<!--[if lte IE 8]>
	<script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="resources/assets/css/result.css"/>
	<!--[if lte IE 9]>
	<link rel="stylesheet" href="assets/css/ie9.css"/><![endif]-->
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="assets/css/ie8.css"/><![endif]-->
  <script src="resources/assets/js/jquery.min.js"></script>
</head>
<body>
<%@ include file="./nav.jsp" %>

<% String mb_id = (String) session.getAttribute("mb_id");
%>
<div id="mainImg">설문조사</div>
<div id="contain">

	<form action="surveyInsert" method="post" onsubmit="return validateForm()">

		<input type="hidden" name="mb_id" value="<%=mb_id %>">
		<label for="exampleFormControlInput1" class="form-label">1. 주요 활동 장소가 어디인가요?</label>
		<div class="form-check">
			<input class="form-check-input" name="q1" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="0"/>
			<label class="form-check-label" for="flexRadioDefault1">실외</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" name="q1" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="1"/>
			<label class="form-check-label" for="flexRadioDefault2">실내</label>
		</div>
		<hr/>
		<label for="exampleFormControlInput1" class="form-label">2. 선호하는 교통수단이 무엇인가요?</label>
		<div class="form-check">
			<input class="form-check-input" name="q2" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="0"/>
			<label class="form-check-label" for="flexRadioDefault1">차량</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" name="q2" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="1"/>
			<label class="form-check-label" for="flexRadioDefault2">대중교통</label>
		</div>
		<hr/>
		<label for="exampleFormControlInput1" class="form-label">3. 선호하는 활동 시간대는 언제인가요?</label>
		<div class="form-check">
			<input class="form-check-input" name="q3" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="0"/>
			<label class="form-check-label" for="flexRadioDefault1">아침 ~ 오후</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" name="q3" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="1"/>
			<label class="form-check-label" for="flexRadioDefault2">오후 ~ 저녁 늦게</label>
		</div>
		<hr/>
		<label for="exampleFormControlInput1" class="form-label">4. 음주를 하시나요?</label>
		<div class="form-check">
			<input class="form-check-input" name="q4" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="0"/>
			<label class="form-check-label" for="flexRadioDefault1">예</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" name="q4" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="1"/>
			<label class="form-check-label" for="flexRadioDefault2">아니오</label>
		</div>
		<hr/>
		<label for="exampleFormControlInput1" class="form-label">5. 흡연을 하시나요?</label>
		<div class="form-check">
			<input class="form-check-input" name="q5" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="0"/>
			<label class="form-check-label" for="flexRadioDefault1">예</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" name="q5" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="1"/>
			<label class="form-check-label" for="flexRadioDefault2">아니오</label>
		</div>
		<input id="submit" class="btn btn-primary" type="submit" value="완료"/>
	</form>

</div>
<!-- contain end -->
<%@ include file="./F_chat.jsp" %>
<footer></footer>
</body>
<script>

  $("input:radio").prop('checked', false);

  function validateForm() {
      // 각 라디오 버튼의 상태 확인
      var q1Checked = $('input[name="q1"]:checked').val();
      var q2Checked = $('input[name="q2"]:checked').val();
      var q3Checked = $('input[name="q3"]:checked').val();
      var q4Checked = $('input[name="q4"]:checked').val();
      var q5Checked = $('input[name="q5"]:checked').val();

      // 모든 라디오 버튼이 선택되었는지 확인
      if (q1Checked === undefined || q2Checked === undefined || q3Checked === undefined || q4Checked === undefined || q5Checked === undefined) {
          alert("모든 항목에 답해주세요.");
          return false; // 폼 제출 방지
      }

      // 다른 유효성 검사 로직 추가 가능

      return true; // 폼 제출 허용
  }
</script>
</html>

