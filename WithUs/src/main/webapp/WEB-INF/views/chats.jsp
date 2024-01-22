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
	<!-- 채팅방을 따로 분리할것
채팅방(
	방 식별자 (PK)
	개설날짜
	방이름
	방설명
	소속인원 (PK)
)

-->

	<!-- A 라는 사람이 들어왔을 때, A가 소속된 채팅방을 불러와 출력 -->
	<!--
		select 방식별자, 방이름, 방설명 from 채팅방
		where 소속인원 = 로그인한 사용자;
	-->
	<!-- 방식별자 -->

	<div id="chatBox">
		<ul id="chatList">
			<li class="chatRoom" id="room10">
				<div class="chatImg"><img src="resources/images/user.png"></div>
				<div class="chatCon">
					<input type="hidden" readonly value="10">
					<span class="chatTitle">강원도 여행</span> <span class="count">5</span>
					<p class="chat">방설명</p>
				</div>
			</li>
			<li class="chatRoom" id="room115">
				<div class="chatImg"></div>
				<div class="chatCon">
					<span class="chatTitle">경기도 여행 </span> <span class="count">5</span>
					<p class="chat">방설명</p>
				</div>
			</li>
			<li class="chatRoom" id="room120">
				<div class="chatImg"><img src="resources/images/user3.jpg"></div>
				<div class="chatCon">
					<span class="chatTitle">충청도 여행</span> <span class="count">5</span>
					<p class="chat">방설명</p>
				</div>
			</li>
		</ul>
		<ul id="chatting">
			<li class="you">
			<span class="chatImg"><img src="resources/images/user.png"></span>
				<span class="chatNick">반장</span>
			<span class="talk">식당은 어디로 갈까요?</span>
			<span class="chatDate">08:32</span>
			</li>
			<li class="you">
				<span class="chatImg"><img src="resources/images/user3.jpg"></span>
				<span class="chatNick">유리</span>
				<span class="talk">삼겹살 먹으러가요!</span>
				<span class="chatDate">08:35</span>
			</li>
		</ul>
		<textarea class="form-control" aria-label="With textarea" id="msg"> </textarea>
		<button onclick="sendMessage()" type="submit" class="submitBtn">전송</button>
	</div>
</div>
<script type="text/javascript">
    let url = 'ws://172.30.1.55:8081/controller/chatserver/';
    let ws
    let userNickname = '<%=loginMember.getMb_nick()%>';
    let isAlreadyJoined = false;

    $('#chatting > li').hide();

    // 로그인 전 메세지 입력 창 비활성화
    $('#msg').attr('disabled', true);

    // 채팅 리스트 클릭 시 함수
    $('.chatRoom:nth-of-type(1)').click(function () {
        $('#chatting > li').show();
        // 방식별자를 가져오기
        var room_idx = $(this).attr('id').replace('room', '');

        // 현재 선택한 채팅방과 클릭한 채팅방이 다를 경우에만 처리

        if (!isAlreadyJoined) {
            // 소켓 연결
            ws = new WebSocket(url + room_idx);

            // 데이터수신
            ws.onmessage = onMessage;

            ws.onerror = onError;

            ws.onopen = function () {
                // $('#chatting').append(
                //     $('<li>')
                //         .text("'" + userNickname + "' 님이 입장했습니다.")
                //         .addClass('userCome')
                // );
                // 서버로 데이터 전송
                ws.send('1#' + userNickname + '#');
                // 채팅창 요소들 속성 변경
                $('.chatRoom').attr('disabled', true);
                $('#msg').attr('disabled', false);
                $('#msg').focus();
            }
            isAlreadyJoined = true;
        }
    });

    // 채팅 리스트 클릭 시 함수
    $('.chatRoom:nth-of-type(2)').click(function () {
        $('#chatting > li').hide();
        // 방식별자를 가져오기
        var room_idx = $(this).attr('id').replace('room', '');

        // 현재 선택한 채팅방과 클릭한 채팅방이 다를 경우에만 처리

            // 소켓 연결
            ws = new WebSocket(url + room_idx);

            // 데이터수신
            ws.onmessage = onMessage;

            ws.onerror = onError;

            ws.onopen = function () {
                $('#chatting').append(
                    $('<li>')
                        .text("'" + userNickname + "' 님이 입장했습니다.")
                        .addClass('userCome')
                );
                // 서버로 데이터 전송
                ws.send('1#' + userNickname + '#');
                // 채팅창 요소들 속성 변경
                $('.chatRoom').attr('disabled', true);
                $('#msg').attr('disabled', false);
                $('#msg').focus();
            }
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

    function onError(evt) {
        console.log(evt.data);
    }

    function onMessage(evt) {
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
    }

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

    window.onbeforeunload = function () {
        if (ws) {
            ws.close();
        }
    };

    function clearChatHistory() {
        $('#chatting').empty(); // Empty the chat history
    }

</script>
</body>
</html>
