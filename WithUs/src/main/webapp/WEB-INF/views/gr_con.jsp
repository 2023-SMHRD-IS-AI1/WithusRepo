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
<title>Group Contents</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/d5377ff581.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="resources/assets/css/grcontent.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
<body>
	<%@ include file="./nav.jsp" %>
     <div id="mainImg"></div>
    <!-- mainImg end -->
 
     <div id="contain">
        <div class="row">
          
          <h1 id ="r_title">모집</h1>
        
            <div class="col-sm-8 col-sm-offset-2 all">
                
                  
                    <div class="col-sm-12">
                      <div id="buttons">
                        <div class="btn-group">
                          <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            메뉴
                          </button>
                          <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">모집 신청</a></li>
                            <li><a class="dropdown-item" href="#">수정</a></li>
                            <li><a class="dropdown-item" href="#">삭제</a></li>
                          </ul>
                        </div>
                          </div>
                        <div class="panel panel-white post">
                            <div class="post-heading">
                                <div class="pull-left image">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="img-circle avatar" alt="user profile image">
                                </div>
                                <div class="pull-left meta">
                                    <div class="title h5">
                                        <a href="#"><b>부산바다</b></a>
                                        
                                    </div>
                                    <h6 class="text-muted time">2024.1.11 ~ 2024.1.15</h6>
                                </div>
                            </div>
                            <div class="post-image">
                                <img src=""><img src="resources/images/cardImg.png" class="image" alt="image post">
                            </div>
                            <div class="post-description">
                                <h2>제주도에 겨울바다 보러 같이 여행 가실분 구합니다</h2>
                                <br>
                                <h3>지역 : <span>제주도</span></h3>
                                <br>
                                <h3>날짜 : <span>2014.2.14~2014.2.18</span></h3>
                                <br>
                                <h3>모집인원 : <span>5</span></h3>
                                <br>
                                <p>사람 모집해요 커피 한잔씩 제가 쏠게요~</p>
                                <div class="stats">
                                    <a href="javascript:void(0);" class="btn btn-default stat-item">
                                        <i class="fa fa-thumbs-up icon"></i>228
                                    </a>
                                    <a href="javascript:void(0);" class="btn btn-default stat-item">
                                        <i class="fa fa-share icon"></i>128
                                    </a>
                                </div>
                            </div>
                            <div class="post-footer">
                                <div class="input-group"> 
                                    <input class="form-control" placeholder="댓글을 달아주세요" type="text">
                                    <span class="input-group-addon">
                                        <a href="#;" class="sub"><img class ="send" src="./img/Send.png"></a>  
                                    </span>
                                  
                                </div>
                                <ul class="comments-list">
                                    <li class="comment">
                                        <a class="pull-left" href="javascript:void(0);">
                                            <img class="avatar" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="avatar">
                                        </a>
                                        <div class="comment-body">
                                            <div class="comment-heading">
                                                <h4 class="user">최반장</h4>
                                                <h5 class="time">7분전</h5>
                                            </div>
                                            <p>저요저요</p>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <a class="pull-left" href="javascript:void(0);">
                                            <img class="avatar" src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
                                        </a>
                                        <div class="comment-body">
                                            <div class="comment-heading">
                                                <h4 class="user">존</h4>
                                                <h5 class="time">3분전</h5>
                                            </div>
                                            <p>신청 가능할까요?</p>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <a class="pull-left" href="javascript:void(0);">
                                            <img class="avatar" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="avatar">
                                        </a>
                                        <div class="comment-body">
                                            <div class="comment-heading">
                                                <h4 class="user">대디</h4>
                                                <h5 class="time">10초전</h5>
                                            </div>
                                            <p>신청 했어요.</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>
    </div>
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

