<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
  <head>
  <title>Schedule</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <link rel="stylesheet" href="resources/assets/css/daily.css" />
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementById('calendar')
        const calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          selectable: true
        })
        calendar.render()
      })

    </script>
    <title>daily</title>
  </head>
  <body>
  <%@ include file="./nav.jsp" %>

    <div id="contain">
      <h1 id ="d_title">일정</h1>
      <div id='calendar'></div>
      <div class="list-group gap-3">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
          <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">1월 14일 일정</h5>
            <small>3일후</small>
          </div>
          <p class="mb-1">강릉 여행</p>
        </a>
        <a href="#" class="list-group-item list-group-item-info" aria-current="true">
          <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">1월 14일 일정</h5>
            <small>3일후</small>
          </div>
          <p class="mb-1">강릉 여행</p>
        </a>

   
        <a href="#" class="list-group-item list-group-item-warning">
          <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">List group item heading</h5>
            <small class="text-body-secondary">3 days ago</small>
          </div>
          <p class="mb-1">Some placeholder content in a paragraph.</p>
          <small class="text-body-secondary">And some muted small print.</small>
        </a>

      </div>

    <!-- contain end -->
    </div>
    <a href="#" id="chat"><img src="./img/chat.png" alt="" /></a>
	<%@ include file="./F_chat.jsp" %>
    <footer></footer>
  </body>

 
</html>
