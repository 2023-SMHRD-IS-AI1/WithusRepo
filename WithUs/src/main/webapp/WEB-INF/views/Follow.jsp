<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Forty by HTML5 UP</title>
	<meta charset="utf-8"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Jost:wght@400&display=swap"/>
	<link
					href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
					rel="stylesheet"
					integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
					crossorigin="anonymous"
	/>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/d5377ff581.js" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com"/>
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;800&display=swap"
	      rel="stylesheet"/>
	<link rel="stylesheet" href="resources/assets/css/reset.css"/>
	<link rel="stylesheet" href="resources/assets/css/profil.css"/>
</head>
<body>
<%@ include file="./nav.jsp" %>
<div id="mainImg"></div>
<div id="contain">
	<div class="container emp-profile">
		<form method="post" id="all">
			<div class="row">
				<div id="img_box" class="col-md-4">
					<div class="profile-img">
						<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
						     alt=""/>
						<div class="file btn btn-lg btn-primary">
							Change Photo
							<input type="file" name="file"/>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="profile-head">
						<p class="proile-rating">팔로우 : <span>200</span></p>
						<p class="proile-rating">팔로잉 : <span>10</span></p>
					</div>
				</div>
				<a class="col-md-2 btn btn-primary" id="su_btn" href="goUserproinfo">수정</a>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="profile-work">
						<p>닉네임 : <span>닉네임</span></p>
						<p>생년월일 : <span>1999.01.15</span></p>
						<p>이메일 : <span>jgidmg@gmail.com</span></p>
						<p>MBTI : <span>ENFPs</span></p>
					</div>
				</div>
				<div class="col-md-8">
					<div class="tab-content profile-tab" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							<ul id="nav1" class="nav nav-pills mb-3" id="myTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="home-tab" data-toggle="tab" href="goFollow" role="tab"
									   aria-controls="home" aria-selected="true">팔로우</a>
								</li>
								<li class="nav-item">
									<a class="nav-link " id="profile-tab" data-toggle="tab" href="goProfil" role="tab"
									   aria-controls="profile" aria-selected="false">팔로잉 </a>
								</li>
							</ul>
							<div class="container">
								<div class="row bootstrap snippets bootdey">
									<div class="col-md-8 col-xs-12">
										<div class="panel" id="followers">
											<div class="panel-heading">
												<h3 class="panel-title">
													<i class="icon md-check" aria-hidden="true"></i> 팔로잉
												</h3>
											</div>
											<div class="panel-body">
												<ul class="list-group list-group-dividered list-group-full">
													<li class="list-group-item">
														<div class="media">
															<div class="media-left">
																<a class="avatar avatar-away" href="javascript:void(0)">
																	<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
																	<i></i>
																</a>
															</div>
															<div class="media-body">
																<div class="pull-right">
																	<button type="button"
																	        class="btn btn-success btn-default btn-sm waves-effect waves-light"><i
																					class="icon md-check" aria-hidden="true"></i>Following
																	</button>
																</div>
																<div><a class="name" href="javascript:void(0)">Ronnie Ellis</a></div>
																<small>@kingronnie24</small>
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="media">
															<div class="media-left">
																<a class="avatar avatar-away" href="javascript:void(0)">
																	<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
																	<i></i>
																</a>
															</div>
															<div class="media-body">
																<div class="pull-right">
																	<button type="button"
																	        class="btn btn-success btn-default btn-sm waves-effect waves-light"><i
																					class="icon md-check" aria-hidden="true"></i>Following
																	</button>
																</div>
																<div><a class="name" href="javascript:void(0)">Ronnie Ellis</a></div>
																<small>@kingronnie24</small>
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="media">
															<div class="media-left">
																<a class="avatar avatar-busy" href="javascript:void(0)">
																	<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
																	<i></i>
																</a>
															</div>
															<div class="media-body">
																<div class="pull-right">
																	<button type="button" class="btn btn-info btn-sm waves-effect waves-light">Follow
																	</button>
																</div>
																<div><a class="name" href="javascript:void(0)">Gwendolyn Wheeler</a></div>
																<small>@perttygirl66</small>
															</div>
														</div>
													</li>
													<li class="list-group-item">
														<div class="media">
															<div class="media-left">
																<a class="avatar avatar-off" href="javascript:void(0)">
																	<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
																	<i></i>
																</a>
															</div>
															<div class="media-body">
																<div class="pull-right">
																	<button type="button" class="btn btn-info btn-sm waves-effect waves-light">Follow
																	</button>
																</div>
																<div><a class="name" href="javascript:void(0)">Daniel Russell</a></div>
																<small>@danieltiger08</small>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>


</div>
<!-- contain end -->
<%@ include file="./F_chat.jsp" %>
<footer></footer>
</body>
</html>

