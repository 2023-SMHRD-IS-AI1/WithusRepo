<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Chatting</title>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
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
<link rel="stylesheet" href="resources/assets/css/reset.css" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="resources/assets/css/chat.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<%@ include file="./nav.jsp"%>
	<div id="mainImg"></div>
	<div id="contain">
		<div class="btn-group" role="group"
			aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
				autocomplete="off" checked /> <label
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
      let url = 'ws://localhost:8081/controller/chatserver';
      let ws;
      let userNickname = '<%=loginMember.getMb_nick()%>';

      $('#msg').attr('disabled', true);

      $('#chat1').click(() => {
        if (userNickname != '') {
        	
        	function connectWebSocket(){
        		ws = new WebSocket(url);
        		
                ws.onopen = (evt) => {
                    console.log('서버 연결 성공');
                    let chatStart = document.getElementById('chatting');
                    console.log(chatStart);
                    $('#chatting').append(
                      $('<li>')
                        .text("'" + userNickname + "' 님이 입장했습니다.")
                        .addClass('userCome')
                    );

                    ws.send('1#' + userNickname + '#');

                    $(userNickname).attr('readonly', true);
                    $('#chat1').attr('disabled', true);
                    $('#btnDisconnect').attr('disabled', false);
                    $('#msg').attr('disabled', false);
                    $('#msg').focus();
                  };
                  
                  
                  /* 데이터수신 */
                  ws.onmessage = (evt) => {
                	let message = evt.data;
                	let messageType = message.substring(0,1)
                	
                	if (messageType === '1') {
        			    // 상대방 접속 메시지 처리
        			    print2(message.substring(2));
	       			  } else if (messageType === '2') {
	       			    // 상대방이 보낸 메시지 처리
	       			    let index = message.indexOf('#', 2);
	       			    let sender = message.substring(2, index);
	       			    let text = message.substring(index + 1);
	       			    print(message, userNickname);
	       			  } else if (messageType === '3') {
	       			    // 상대방 종료 메시지 처리
	       			    print3(message.substring(2));
	       			  }

                    $('#chatting').scrollTop($('#chatting')[0].scrollHeight);
                  };
                  
                  ws.onerror = (evt) => {
                	    console.log(evt.data);
                	  };

                  ws.onclose = (evt) => {
                	    connectWebSocket();
                	  };
        	}
        	
        	connectWebSocket();
        	
        }
      });
      
      // 메세지 전송 및 아이디

      function sendMessage() {
        let message = $('#msg').val();
        if (message.trim() !== '') {
          ws.send('2#' + userNickname + '#' + message); // 서버에게 메시지 전송
          print(message, userNickname); // 본인 대화창에 출력
          $('#msg').val('');
          $('#msg').focus();
        }
      }

      function print(message, user) {
      let temp = '';
        if (user === userNickname) {
          temp += '<li class="me">';
        } else {
          temp += '<li class="you">';
        }
        temp += '<span class="chatImg"></span>';
        temp += '<span class="chatNick">' + user + '</span>';
        temp += '<span class="talk">' + message + '</span>';
        temp += '<span class="chatDate">' + getCurrentTime() + '</span>';
        temp += '</li>';

        $('#chatting').append(temp);
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

      // 다른 client 접속
      function print2(user) {
        // <li class="userCome">가현님이 입장했습니다.</li>
        let temp = '';
        temp += '<li class="userCome">';
        temp += "'" + userNickname + "'님이 접속했습니다.";
        temp += '</li>';

        // 모든 사용자에게 메시지 전송
        ws.send('3#' + user);

        // 모든 사용자에게 메시지를 출력
        $('#chatting').append(temp);
        $('#chatting').scrollTop($('#chatting')[0].scrollHeight);

      }

      // client 접속 종료
      function print3(user) {
        let temp = '';
        temp += '<div style="margin-bottom:3px;">';
        temp += "'" + user + "' 이(가) 종료했습니다.";
        temp += ' <span style="font-size:11px;color:#777;">' + getCurrentTime() + '</span>';
        temp += '</div>';

        $('#list').append(temp);
      }
    </script>
</body>
</html>
