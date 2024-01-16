<%@page import="org.apache.ibatis.reflection.SystemMetaObject" %>
<%@page import="kr.smhrd.entity.Message" %>
<%@page import="java.util.List" %>
<%@page import="kr.smhrd.entity.Member" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
				 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Chatting</title>
	<script
					src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<link rel="stylesheet"
				href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap"/>
	<link
					href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
					rel="stylesheet"
					integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
					crossorigin="anonymous"/>
	<script src="https://kit.fontawesome.com/d5377ff581.js"
					crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com"/>
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
	<link
					href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
					rel="stylesheet"/>
	<link rel="stylesheet" href="resources/assets/css/reset.css"/>
	<!--[if lte IE 8]>
	<script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="resources/assets/css/chat.css"/>
	<!--[if lte IE 9]>
	<link rel="stylesheet" href="assets/css/ie9.css"/><![endif]-->
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="assets/css/ie8.css"/><![endif]-->
</head>
<body>
<%@ include file="./nav.jsp" %>
<div id="mainImg"></div>
<div id="contain">
	<div class="btn-group" role="group"
			 aria-label="Basic radio toggle button group">
		<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
					 autocomplete="off" checked/> <label
					class="btn btn-outline-primary" for="btnradio1">채팅</label>
	</div>
	<div id="chatBox">
		<ul id="chatList">
			<li id="chat1">
				<div class="chatImg"></div>
				<div class="chatCon">
					<span class="chatTitle">강원도 여행 </span> <span class="count">5</span>
					<p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도
						이뻐요.바다도 이뻐요.</p>
				</div>
				<div class="chatCount">
					<p>2</p>
				</div>
			</li>
		</ul>
		<ul id="chatting">
		</ul>
		<textarea class="form-control" aria-label="With textarea" id="msg"> </textarea>
		<button onclick="sendMessage()" type="submit" class="submitBtn">전송</button>
	</div>
</div>
<script type="text/javascript">
    let url = 'ws://172.30.1.55:8081/controller/chatserver';
    let ws = new WebSocket(url);
    let userNickname = '<%=loginMember.getMb_nick()%>';

    console.log("userNickname 확인 : ", userNickname)

    // 로그인 전 메세지 입력 창 비활성화
    $('#msg').attr('disabled', true);

    // 채팅 리스트 클릭 시 함수
    $('#chat1').click(() => {
        connectWebSocket();
        // 입장했습니다 텍스트 출력 (본인)
        $('#chatting').append(
            $('<li>')
                .text("'" + userNickname + "' 님이 입장했습니다.")
                .addClass('userCome')
        );
        // 서버로 데이터 전송
        ws.send('1#' + userNickname + '#');
        // 채팅창 요소들 속성 변경
        $('#chat1').attr('disabled', true);
        $('#msg').attr('disabled', false);
        $('#msg').focus();
    });

    // 메세지 전송 및 아이디
    function sendMessage() {
        let msg = $('#msg').val();
        if (msg.trim() !== '') {
            ws.send('2#' + userNickname + '#' + msg); // 서버에게 메시지 전송
            print(msg); // 본인 대화창에 출력
            $('#msg').val('');
            $('#msg').focus();
        }
    }

    /* 데이터수신 */
    ws.onmessage = (evt) => {
        let message = evt.data;
        let messageType = message.substring(0, 1)

        if (messageType === '1') {
            // 상대방 접속 메시지 처리
          print2(message.substring(2));
          // print2(message.substring(2));
        } else if (messageType === '2') {
            // 상대방이 보낸 메시지 처리
            let index = message.indexOf('#', 2);
            let user = message.substring(2, index);
            let msg = message.substring(index + 1);
            let no = msg.substring(0, 1);
            print3(msg, user);
        } else if (messageType === '3') {
            // 상대방 종료 메시지 처리
            chatClose(message.substring(2));
        }
        $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
    };

    function print(msg) {
        let temp = '';
        temp += '<li class="me">';
        temp += '<span class="chatImg"></span>';
        temp += '<span class="talk">' + msg + '</span>';
        temp += '<span class="chatDate">' + getCurrentTime() + '</span>';
        temp += '</li>';

        $('#chatting').append(temp);
        $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
    }

    function print2(user) {
        // <li class="userCome">가현님이 입장했습니다.</li>
        console.log(user);
        let temp = '';
        temp += '<li class="userCome">';
        temp += "'" + user + "'님이 접속했습니다.";
        temp += '</li>';

        // 모든 사용자에게 메시지를 출력
        $('#chatting').append(temp);
        $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
    }

    function print3(msg, user) {
        let temp = '';
        temp += '<li class="you">';
        temp += '<span class="chatImg"></span>';
        temp += '<span class="chatNick">' + user + '</span>';
        temp += '<span class="talk">' + msg + '</span>';
        temp += '<span class="chatDate">' + getCurrentTime() + '</span>';
        temp += '</li>';

        $('#chatting').append(temp);
        $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
    }

    // client 접속 종료
    function chatClose(user) {
        let temp = '';
        temp += '<li class="userCome">';
        temp += "'" + user + "'님이 종료했습니다.";
        temp += '</li>';

        $('#list').append(temp);
        $('#chatting').scrollTop($('#chatting')[0].scrollHeight);

    }


    // 엔터 키 입력 시 이벤트 등록
    $('#msg').keydown(function (event) {
        if (event.keyCode == 13) {
            sendMessage();
        }
    });

    function getCurrentTime() {
        let now = new Date();
        let hours = now.getHours();
        let minutes = now.getMinutes();

        // 시간과 분이 한 자리 수일 경우 앞에 0을 추가
        hours = hours < 10 ? '0' + hours : hours;
        minutes = minutes < 10 ? '0' + minutes : minutes;

        return hours + ':' + minutes;
    }

    function connectWebSocket() {
        // 웹소켓 오픈
        ws.onopen = () => {
            console.log('서버 연결 성공');
        }
    }

    ws.onerror = (evt) => {
        console.log(evt.data);
    };

    window.onbeforeunload = function() {
      if (ws) {
        ws.close();
      }
    };


</script>
</body>
</html>
