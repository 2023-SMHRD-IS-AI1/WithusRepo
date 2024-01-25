<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Join With Us!</title>
	<meta charset="utf-8"/>
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
	<link rel="stylesheet" href="resources/assets/css/join.css"/>
</head>
<body>
<%@ include file="./nav.jsp" %>
<div id="mainImg">회원가입</div>
<div id="contain">
	<form action="goResult" method="post" onsubmit="return validateForm()">
		<label class="form-label">아이디 *</label>
		<input type="text" name="mb_id" class="form-control" id="inputE" placeholder="ID" autocomplete="off"/>
		<input class="checkBtn" type="button" value="중복체크" onclick="checkE()"/>
		<p class="warnTxt1 warn"></p>

		<label class="form-label">비밀번호 *</label>
		<input type="password" name="mb_pw" class="form-control" placeholder="PW"/>
		<label class="form-label">이름 *</label>
		<input type="text" name="mb_name" class="form-control" placeholder="NAME" autocomplete="off"/>

		<label class="form-label">닉네임 *</label>
		<input type="text" name="mb_nick" class="form-control" id="inputN" placeholder="NICKNAME" autocomplete="off"/>

		<input class="checkBtn" type="button" value="중복체크" onclick="checkN()"/>
		<p class="warnTxt2 warn"></p>


		<label class="form-label">생년월일 *</label>
		<input type="date" name="mb_birthdate" class="form-control" placeholder="BIRTHDAY"/>
		<label class="form-label">성별 *</label>
		<div id="radio">
			<input class="form-check-input" name="mb_gender" type="radio" name="inlineRadioOptions" id="inlineRadio1"
			       value="option1"/>
			<label class="form-check-label" for="inlineRadio1">남성</label>
			<input class="form-check-input" name="mb_gender" type="radio" name="inlineRadioOptions" id="inlineRadio2"
			       value="option2"/>
			<label class="form-check-label" for="inlineRadio2">여성</label>
		</div>
		<label class="form-label">휴대폰번호 *</label>
		<input type="text" class="form-control" name="mb_phone" placeholder="PHONE NUMBER" autocomplete="off"/>
		<input class="checkBtn" type="button" value="핸드폰인증" onclick="checkP()"/>
		<p class="warnTxt3 warn"></p>
		<label for="formFile" class="form-label">신분증사진 *</label>
		<input class="form-control" type="file" name="mb_img" id="formFile"/>
		<input id="submit" class="btn btn-primary" type="submit" value="다음"/>
	</form>
</div>
<footer></footer>
<script src="resources/assets/js/jquery.min.js"></script>
<script type="text/javascript">
    function checkP() {
        $('.warnTxt3').text('인증이 완료되었습니다.')
    }
    // 아이디 중복 체크
    function checkE() {
        var inputE = $('#inputE').val()

        $.ajax({
            url: 'emailCheck',
            data: {'inputE': inputE},
            type: 'get',
            success: function (data) {
                if (data == 0) {
                    $('.warnTxt1').text('이미 존재하는 아이디입니다.')
                } else {
                    $('.warnTxt1').text('가입 가능한 아이디입니다.')
                }
            },
            // 요청-응답 실패
            error: function () {
                alert("통신 실패")
            }
        })
    }

    // 닉네임 중복 체크
    function checkN() {
        var inputN = $('#inputN').val();
        $.ajax({
            url: 'nickCheck',
            data: {'inputN': inputN},
            type: 'get',
            success: function (data) {
                if (data == 0) {
                    $('.warnTxt2').text('이미 존재하는 닉네임입니다.')
                } else {
                    $('.warnTxt2').text('사용 가능한 닉네임입니다.')
                }
            },
            // 요청-응답 실패
            error: function () {
                alert("통신 실패")
            }
        })
    }

    function validateForm() {
        var mb_id = document.getElementsByName("mb_id")[0].value;
        var mb_pw = document.getElementsByName("mb_pw")[0].value;
        var mb_name = document.getElementsByName("mb_name")[0].value;
        var mb_nick = document.getElementsByName("mb_nick")[0].value;
        var mb_birthdate = document.getElementsByName("mb_birthdate")[0].value;
        var mb_gender = document.querySelector('input[name="mb_gender"]:checked');
        var mb_phone = document.getElementsByName("mb_phone")[0].value;
        var mb_img = document.getElementsByName("mb_img")[0].value;

        if (mb_id === "" || mb_pw === "" || mb_name === "" || mb_nick === "" || mb_birthdate === "" || !mb_gender || mb_phone === "" || mb_img === "") {
            alert("모든 항목을 작성해주세요.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
