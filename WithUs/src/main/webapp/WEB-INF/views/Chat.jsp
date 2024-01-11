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
<link rel="stylesheet" href="resources/assets/css/chat.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<%@ include file="./nav.jsp" %>
    <div id="mainImg"></div>
    <div id="contain">
      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked />
        <label class="btn btn-outline-primary" for="btnradio1">채팅</label>
      </div>
      <div id="chatBox">
        <ul id="chatList">
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
          <li>
            <div class="chatImg"></div>
            <div class="chatCon">
              <span class="chatTitle">강원도 여행</span>
              <span class="count">5</span>
              <p class="chat">저희 여행 코스는 속초 - 주문진입니다. 오징어 순대 맛있어요. 바다도 이뻐요.바다도 이뻐요.</p>
            </div>
            <div class="chatCount">
              <p>2</p>
            </div>
          </li>
        </ul>
        <ul id="chatting">
          <li>대화가 시작되었습니다.</li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
          <li class="you">
            <span class="chatImg"></span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatDate">오후 11시32분</span>
          </li>
          <li class="me">
            <span class="chatDate">오후 11시32분</span>
            <span class="talk">Lorem ipsum dolor sit amet.</span>
            <span class="chatImg"></span>
          </li>
        </ul>
        <textarea class="form-control" aria-label="With textarea"> </textarea>
        <button type="submit" class="submitBtn">전송</button>
      </div>
    </div>
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

