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
<link rel="stylesheet"  href="resources/assets/css/Map.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<%@ include file="./nav.jsp" %>
     <div id="mainImg"></div>
    
    
    
    <!-- mainImg end -->
    <div id="contain">
      <div id="buttons">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group" >
          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="location.href='goGroup'"  />
          <label   class="btn btn-outline-primary" for="btnradio1">모집</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="location.href='goReview'"  />
          <label   class="btn btn-outline-primary" for="btnradio2">리뷰</label>

          <input type="radio" class="btn-check " name="btnradio" id="btnradio3" autocomplete="off" onclick="location.href='goMap'"  />
          <label class="btn btn-outline-primary active" for="btnradio3">추천 맛집</label>
        </div>
      </div>
      <!-- buttons end -->
      <div id="mapbuttons">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
          <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" checked />
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio4" onclick="Gwangju()">광주</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off" />
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio5" onclick="Seoul()">서울</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off" />
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio6">강릉</label>
          
          <input type="radio" class="btn-check" name="btnradio" id="btnradio7" autocomplete="off" />
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio7">제주</label>
        </div>
      </div>

      <div id="map" style="width:60%;height:500px;"></div>
	    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=865ecf86d0c01c0a3ac0450f18fe26c1&libraries=services"
    ></script>
    
    <script>
     
    <div id="map" style="width:60%;height:500px;"></div>
    <script
  type="text/javascript"
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=865ecf86d0c01c0a3ac0450f18fe26c1&libraries=services"
></script>

<script>

let ClickOverlay = null;
var mapContainer = document.getElementById("map"), // 지도의 중심좌표
  mapOption = {
  center: new kakao.maps.LatLng(35.14919975177639, 126.92453208436793), // 지도의 중심좌표
  level: 3, // 지도의 확대 레벨
};
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var positions = [
{
  title: "시리즈인트로",
  address: "광주 동구 제봉로110번길 1",
  latlng: new kakao.maps.LatLng(35.1484606, 126.9222057),
  pimg: "./image/1시리즈인트로.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482270,458916&rt1=&rt2=%EC%8B%9C%EB%A6%AC%EC%A6%88%EC%9D%B8%ED%8A%B8%EB%A1%9C&rtIds=,1849034438",
  Link2:
    "http://localhost:3001/CafeInfo?name=시리즈인트로&i=./image/1시리즈인트로.jpeg",
},
{
  title: "티거훗타임쿠키",
  address: "광주 동구 제봉로110번길 9",
  latlng: new kakao.maps.LatLng(35.148723, 126.9227715),
  pimg: "./image/2티거훗타임쿠키in동명.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482405,458996&rt1=&rt2=%ED%8B%B0%EA%B1%B0%ED%9B%97%ED%83%80%EC%9E%84&rtIds=,62937167",
  Link2:
    "http://localhost:3001/CafeInfo?name=티거훗타임쿠키&i=./image/2티거훗타임쿠키in동명.jpg",
},
{
  title: "로타리커피",
  address: "광주 동구 장동로 2",
  latlng: new kakao.maps.LatLng(35.1492656, 126.9223209),
  pimg: "./image/3로타리커피.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482299,459147&rt1=&rt2=%EB%A1%9C%ED%83%80%EB%A6%AC%EC%BB%A4%ED%94%BC&rtIds=,1106438639",
  Link2:
    "http://localhost:3001/CafeInfo?name=로타리커피&i=./image/3로타리커피.jpeg",
},

{
  title: "토라네코",
  address: "광주 동구 장동로 23-33 1층",
  latlng: new kakao.maps.LatLng(35.1484528, 126.9246276),
  pimg: "./image/4토라네코.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482819,458916&rt1=&rt2=%ED%86%A0%EB%9D%BC%EB%84%A4%EC%BD%94&rtIds=,1110310247",
  Link2:
    "http://localhost:3001/CafeInfo?name=토라네코&i=./image/4토라네코.jpg",
},

{
  title: "소뇨",
  address: "광주 동구 장동로 21",
  latlng: new kakao.maps.LatLng(35.1483106, 126.9242476),
  pimg: "./image/5소뇨.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482731,458882&rt1=&rt2=%EC%86%8C%EB%87%A8&rtIds=,2116137905",
  Link2: "http://localhost:3001/CafeInfo?name=소뇨&i=./image/5소뇨.jpg",
},

{
  title: "여기카페",
  address: "광주 동구 장동로 15-1",
  latlng: new kakao.maps.LatLng(35.1486165, 126.9238187),
  pimg: "./image/6herecafe.jpg",
  // pimg: src={require("./image/6herecafe.jpg").default},
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482633,458965&rt1=&rt2=%EC%97%AC%EA%B8%B0%EC%B9%B4%ED%8E%98&rtIds=,1692969948",
  Link2:
    "http://localhost:3001/CafeInfo?name=여기카페&i=./image/6herecafe.jpg",
},

{
  title: "올데이피크닉",
  address: "광주 동구 제봉로110번길 20",
  latlng: new kakao.maps.LatLng(35.1490458, 126.9240097),
  pimg: "./image/7올데이피크닉.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482682,459095&rt1=&rt2=%EC%98%AC%EB%8D%B0%EC%9D%B4%ED%94%BC%ED%81%AC%EB%8B%89&rtIds=,2007794744",
  Link2:
    "http://localhost:3001/CafeInfo?name=올데이피크닉&i=./image/7올데이피크닉.jpeg",
},

{
  title: "카페벨벳",
  address: "광주 동구 장동로 23-45 1층",
  latlng: new kakao.maps.LatLng(35.1487785, 126.9245597),
  pimg: "./image/8카페벨벳.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482810,459008&rt1=&rt2=%EC%B9%B4%ED%8E%98%EB%B2%A8%EB%B2%B3&rtIds=,1345384774",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페벨벳&i=./image/8카페벨벳.jpeg",
},

{
  title: "하삼동커피",
  address: "광주 동구 제봉로110번길 15-1 1층",
  latlng: new kakao.maps.LatLng(35.1490215, 126.923503),
  pimg: "./image/9하삼동커피 동명점.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482568,459080&rt1=&rt2=%ED%95%98%EC%82%BC%EB%8F%99%EC%BB%A4%ED%94%BC%20%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,1854684861",
  Link2:
    "http://localhost:3001/CafeInfo?name=하삼동커피&i=./image/9하삼동커피 동명점.jpg",
},

{
  title: "루야",
  address: "광주 동구 제봉로110번길 19 1,2층",
  latlng: new kakao.maps.LatLng(35.1492882, 126.9238012),
  pimg: "./image/10루야.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482634,459152&rt1=&rt2=%EB%A3%A8%EC%95%BC&rtIds=,719862470",
  Link2: "http://localhost:3001/CafeInfo?name=루야&i=./image/10루야.jpeg",
},

{
  title: "맷차",
  address: "광주 동구 동계천로 132",
  latlng: new kakao.maps.LatLng(35.1494165, 126.9236283),
  pimg: "./image/11맷차.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482636,459208&rt1=&rt2=%EB%A7%B7%EC%B0%A8&rtIds=,1374343348",
  Link2: "http://localhost:3001/CafeInfo?name=맷차&i=./image/11맷차.jpg",
},

{
  title: "아노씨스튜디오",
  address: "광주 동구 장동로 5-3 3층",
  latlng: new kakao.maps.LatLng(35.149248, 126.9230292),
  pimg: "./image/12아노씨스튜디오.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482462,459147&rt1=&rt2=%EC%95%84%EB%85%B8%EC%94%A8%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4&rtIds=,789848702",
  Link2:
    "http://localhost:3001/CafeInfo?name=아노씨스튜디오&i=./image/12아노씨스튜디오.jpg",
},

{
  title: "카페 플랜비",
  address: "광주 동구 동계천로 126-7 1,2층",
  latlng: new kakao.maps.LatLng(35.1495625, 126.9234245),
  pimg: "./image/13카페플랜비.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482551,459232&rt1=&rt2=%EC%B9%B4%ED%8E%98%ED%94%8C%EB%9E%9C%EB%B9%84&rtIds=,761426304",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페플랜비&i=./image/13카페플랜비.jpeg",
},

{
  title: "카페 주덴",
  address: "광주 동구 동계천로 126-6 2층",
  latlng: new kakao.maps.LatLng(35.1497141, 126.9233446),
  pimg: "./image/14카페주덴.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482534,459271&rt1=&rt2=%EC%A3%BC%EB%8D%B4&rtIds=,159431609",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페 주덴&i=./image/14카페주덴.jpeg",
},

{
  title: "비비드",
  address: "광주 동구 동계천로 124",
  latlng: new kakao.maps.LatLng(35.1497971, 126.923248),
  pimg: "./image/15비비드.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482507,459293&rt1=&rt2=%EB%B9%84%EB%B9%84%EB%93%9C&rtIds=,1893280012",
  Link2:
    "http://localhost:3001/CafeInfo?name=비비드&i=./image/15비비드.jpg",
},

{
  title: "GT커피",
  address: "광주 동구 동계천로 131",
  latlng: new kakao.maps.LatLng(35.1496587, 126.9242057),
  pimg: "./image/16GT커피.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482735,459268&rt1=&rt2=GT%EC%BB%A4%ED%94%BC&rtIds=,1884832770",
  Link2:
    "http://localhost:3001/CafeInfo?name=GT커피&i=./image/16GT커피.jpeg",
},

{
  title: "카페 텅",
  address: "광주 동구 동명로 8",
  latlng: new kakao.maps.LatLng(35.1499206, 126.9229413),
  pimg: "./image/17카페텅 광주동명점.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482438,459334&rt1=&rt2=%EC%B9%B4%ED%8E%98%20%ED%85%85%20%EA%B4%91%EC%A3%BC%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,1536477252",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페 텅&i=./image/17카페텅 광주동명점.jpeg",
},

{
  title: "공과사",
  address: "광주 동구 동명로 5-1 2층",
  latlng: new kakao.maps.LatLng(35.1499873, 126.9225398),
  pimg: "./image/18공과사.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482349,459349&rt1=&rt2=%EA%B3%B5%EA%B3%BC%EC%82%AC&rtIds=,1343984921",
  Link2:
    "http://localhost:3001/CafeInfo?name=공과사&i=./image/18공과사.jpeg",
},

{
  title: "메저린오피스",
  address: "광주광역시 동구 동명동 154 177번지 1층",
  latlng: new kakao.maps.LatLng(35.1502435, 126.9237843),
  pimg: "./image/19메저린오피스.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482627,459422&rt1=&rt2=%EB%A9%94%EC%A0%80%EB%A6%B0%EC%98%A4%ED%94%BC%EC%8A%A4&rtIds=,1135493979",
  Link2:
    "http://localhost:3001/CafeInfo?name=메저린오피스&i=./image/19메저린오피스.jpg",
},

{
  title: "티앗",
  address: "광주 동구 동명로14번길 12",
  latlng: new kakao.maps.LatLng(35.1499868, 126.9243647),
  pimg: "./image/20티앗.png",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482765,459347&rt1=&rt2=%ED%8B%B0%EC%95%97&rtIds=,1969815297",
  Link2: "http://localhost:3001/CafeInfo?name=티앗&i=./image/20티앗.png",
},
{
  title: "프랭크커핀바",
  address: "광주광역시 동구 동명로14번길 15 1층",
  latlng: new kakao.maps.LatLng(35.1501487, 126.9249752),
  pimg: "./image/21프랭크커핀바 광주동명점.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482901,459396&rt1=&rt2=%ED%94%84%EB%9E%AD%ED%81%AC%EC%BB%A4%ED%95%80%EB%B0%94%20%EA%B4%91%EC%A3%BC%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,1667944802",
  Link2:
    "http://localhost:3001/CafeInfo?name=프랭크커핀바&i=./image/21프랭크커핀바 광주동명점.jpg",
},

{
  title: "모드니",
  address: "광주광역시 동구 동명동 73-19번지",
  latlng: new kakao.maps.LatLng(35.1500148, 126.9254368),
  pimg: "./image/22모드니.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,483006,459356&rt1=&rt2=%EB%AA%A8%EB%93%9C%EB%8B%88&rtIds=,6376422",
  Link2:
    "http://localhost:3001/CafeInfo?name=모드니&i=./image/22모드니.jpg",
},

{
  title: "포르투",
  address: "광주광역시 동구 동계천로 143-42",
  latlng: new kakao.maps.LatLng(35.1497943, 126.9254748),
  pimg: "./image/23포르투.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,483017,459307&rt1=&rt2=%ED%8F%AC%EB%A5%B4%ED%88%AC&rtIds=,775890805",
  Link2:
    "http://localhost:3001/CafeInfo?name=포르투&i=./image/23포르투.jpeg",
},

{
  title: "쎄쎄쎄",
  address: "광주광역시 동구 동명동 49-2",
  latlng: new kakao.maps.LatLng(35.1494397, 126.9275458),
  pimg: "./image/24쎄쎄쎄.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482939,459237&rt1=&rt2=%EC%8E%84%EC%8E%84%EC%8E%84&rtIds=,1334555221",
  Link2:
    "http://localhost:3001/CafeInfo?name=쎄쎄쎄&i=./image/24쎄쎄쎄.jpg",
},

{
  title: "데일리 오아시스",
  address: "광주광역시 동구 동명동 동계천로 143-5",
  latlng: new kakao.maps.LatLng(35.1492226, 126.9250444),
  pimg: "./image/25데일리 오아시스 광주 동명점.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482916,459145&rt1=&rt2=%EB%8D%B0%EC%9D%BC%EB%A6%AC%EC%98%A4%EC%95%84%EC%8B%9C%EC%8A%A4%20%EA%B4%91%EC%A3%BC%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,891896547",
  Link2:
    "http://localhost:3001/CafeInfo?name=데일리 오아시스&i=./image/25데일리 오아시스 광주 동명점.jpg",
},

{
  title: "에스엔티",
  address: "광주 동구 동명로 4",
  latlng: new kakao.maps.LatLng(35.1496238, 126.9226127),
  pimg: "./image/27에스엔티.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482366,459250&rt1=&rt2=SNT&rtIds=,1450243505",
  Link2:
    "http://localhost:3001/CafeInfo?name=에스엔티&i=./image/27에스엔티.jpg",
},
// 30
{
  title: "굿트커피",
  address: "광주 동구 동계천로 137-5",
  latlng: new kakao.maps.LatLng(35.1495218, 126.9246566),
  pimg: "./image/30굿트커피.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482825,459220&rt1=&rt2=%EA%B5%BF%ED%8A%B8%EC%BB%A4%ED%94%BC&rtIds=,1692841038",
  Link2:
    "http://localhost:3001/CafeInfo?name=굿트커피&i=./image/30굿트커피.jpg",
},
// 31
{
  title: "카페호시정",
  address: "광주 동구 동계천로 137-9",
  latlng: new kakao.maps.LatLng(35.1497214, 126.92487),
  pimg: "./image/31카페호시정.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482879,459277&rt1=&rt2=%EC%B9%B4%ED%8E%98%ED%98%B8%EC%8B%9C%EC%A0%95&rtIds=,904997780",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페호시정&i=./image/31카페호시정.jpeg",
},
];

for (let i = 0; i < positions.length; i++) {
var data = positions[i];
displayMarker(data);
}

var imageSrc =
  "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png", // 마커이미지의 주소입니다
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(
imageSrc,
imageSize,
imageOption
);

// 지도에 마커를 표시하는 함수입니다
function displayMarker(data) {
var marker = new kakao.maps.Marker({
  map: map,
  position: data.latlng,
  image: markerImage,
});
var CustomOverlay = new kakao.maps.CustomOverlay({
  yAnchor: 1.45,
  position: marker.getPosition(),
});

var Customcontent = document.createElement("div");
Customcontent.className = "wrap";

var info = document.createElement("div");
info.className = "info";
Customcontent.appendChild(info);

//커스텀오버레이 타이틀
var contentTitle = document.createElement("div");
contentTitle.className = "title";
contentTitle.appendChild(document.createTextNode(data.title));
info.appendChild(contentTitle);

//커스텀오버레이 닫기 버튼
var closeBtn = document.createElement("div");
closeBtn.className = "close";
closeBtn.setAttribute("title", "닫기");
closeBtn.onclick = function () {
  CustomOverlay.setMap(null);
};
contentTitle.appendChild(closeBtn);

var bodyContent = document.createElement("div");

bodyContent.className = "body";
info.appendChild(bodyContent);

var imgDiv = document.createElement("div");
imgDiv.className = "img";
bodyContent.appendChild(imgDiv);

//커스텀오버레이 이미지
var imgContent = document.createElement("img");
imgContent.src = data.pimg;
//imgContent.setAttribute("src", data.pimg);

imgContent.setAttribute("width", "73px");
imgContent.setAttribute("heigth", "100px");
imgDiv.appendChild(imgContent);

var descContent = document.createElement("div");
descContent.className = "desc";
bodyContent.appendChild(descContent);

//커스텀오버레이 주소
var addressContent = document.createElement("div");
addressContent.className = "ellipsis";
addressContent.appendChild(document.createTextNode(data.address));
descContent.appendChild(addressContent);

var LinkDiv = document.createElement("div");
descContent.appendChild(LinkDiv);

var LinkContent = document.createElement("a");
LinkContent.className = "link";
LinkContent.appendChild(document.createTextNode("길찾기"));
LinkContent.addEventListener("click", function () {
  LinkContent.setAttribute("href", data.Link);
});
LinkDiv.appendChild(LinkContent);

var LinkContent2 = document.createElement("a");
LinkContent2.className = "link2";
LinkContent2.appendChild(document.createTextNode("예약"));
LinkContent2.addEventListener("click", function () {
  LinkContent2.setAttribute("href", data.Link2);
});

LinkDiv.appendChild(LinkContent2);

CustomOverlay.setContent(Customcontent);

kakao.maps.event.addListener(marker, "click", function () {
	  if (ClickOverlay) {
          ClickOverlay.setMap(null);
        }

        CustomOverlay.setMap(map);

        ClickOverlay = CustomOverlay;
});
}






function Gwangju() {
  let ClickOverlay = null;
var mapContainer = document.getElementById("map"), // 지도의 중심좌표
  mapOption = {
  center: new kakao.maps.LatLng(35.14919975177639, 126.92453208436793), // 지도의 중심좌표
  level: 3, // 지도의 확대 레벨
};
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var positions = [
{
  title: "시리즈인트로",
  address: "광주 동구 제봉로110번길 1",
  latlng: new kakao.maps.LatLng(35.1484606, 126.9222057),
  pimg: "./image/1시리즈인트로.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482270,458916&rt1=&rt2=%EC%8B%9C%EB%A6%AC%EC%A6%88%EC%9D%B8%ED%8A%B8%EB%A1%9C&rtIds=,1849034438",
  Link2:
    "http://localhost:3001/CafeInfo?name=시리즈인트로&i=./image/1시리즈인트로.jpeg",
},
{
  title: "티거훗타임쿠키",
  address: "광주 동구 제봉로110번길 9",
  latlng: new kakao.maps.LatLng(35.148723, 126.9227715),
  pimg: "./image/2티거훗타임쿠키in동명.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482405,458996&rt1=&rt2=%ED%8B%B0%EA%B1%B0%ED%9B%97%ED%83%80%EC%9E%84&rtIds=,62937167",
  Link2:
    "http://localhost:3001/CafeInfo?name=티거훗타임쿠키&i=./image/2티거훗타임쿠키in동명.jpg",
},
{
  title: "로타리커피",
  address: "광주 동구 장동로 2",
  latlng: new kakao.maps.LatLng(35.1492656, 126.9223209),
  pimg: "./image/3로타리커피.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482299,459147&rt1=&rt2=%EB%A1%9C%ED%83%80%EB%A6%AC%EC%BB%A4%ED%94%BC&rtIds=,1106438639",
  Link2:
    "http://localhost:3001/CafeInfo?name=로타리커피&i=./image/3로타리커피.jpeg",
},

{
  title: "토라네코",
  address: "광주 동구 장동로 23-33 1층",
  latlng: new kakao.maps.LatLng(35.1484528, 126.9246276),
  pimg: "./image/4토라네코.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482819,458916&rt1=&rt2=%ED%86%A0%EB%9D%BC%EB%84%A4%EC%BD%94&rtIds=,1110310247",
  Link2:
    "http://localhost:3001/CafeInfo?name=토라네코&i=./image/4토라네코.jpg",
},

{
  title: "소뇨",
  address: "광주 동구 장동로 21",
  latlng: new kakao.maps.LatLng(35.1483106, 126.9242476),
  pimg: "./image/5소뇨.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482731,458882&rt1=&rt2=%EC%86%8C%EB%87%A8&rtIds=,2116137905",
  Link2: "http://localhost:3001/CafeInfo?name=소뇨&i=./image/5소뇨.jpg",
},

{
  title: "여기카페",
  address: "광주 동구 장동로 15-1",
  latlng: new kakao.maps.LatLng(35.1486165, 126.9238187),
  pimg: "./image/6herecafe.jpg",
  // pimg: src={require("./image/6herecafe.jpg").default},
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482633,458965&rt1=&rt2=%EC%97%AC%EA%B8%B0%EC%B9%B4%ED%8E%98&rtIds=,1692969948",
  Link2:
    "http://localhost:3001/CafeInfo?name=여기카페&i=./image/6herecafe.jpg",
},

{
  title: "올데이피크닉",
  address: "광주 동구 제봉로110번길 20",
  latlng: new kakao.maps.LatLng(35.1490458, 126.9240097),
  pimg: "./image/7올데이피크닉.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482682,459095&rt1=&rt2=%EC%98%AC%EB%8D%B0%EC%9D%B4%ED%94%BC%ED%81%AC%EB%8B%89&rtIds=,2007794744",
  Link2:
    "http://localhost:3001/CafeInfo?name=올데이피크닉&i=./image/7올데이피크닉.jpeg",
},

{
  title: "카페벨벳",
  address: "광주 동구 장동로 23-45 1층",
  latlng: new kakao.maps.LatLng(35.1487785, 126.9245597),
  pimg: "./image/8카페벨벳.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482810,459008&rt1=&rt2=%EC%B9%B4%ED%8E%98%EB%B2%A8%EB%B2%B3&rtIds=,1345384774",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페벨벳&i=./image/8카페벨벳.jpeg",
},

{
  title: "하삼동커피",
  address: "광주 동구 제봉로110번길 15-1 1층",
  latlng: new kakao.maps.LatLng(35.1490215, 126.923503),
  pimg: "./image/9하삼동커피 동명점.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482568,459080&rt1=&rt2=%ED%95%98%EC%82%BC%EB%8F%99%EC%BB%A4%ED%94%BC%20%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,1854684861",
  Link2:
    "http://localhost:3001/CafeInfo?name=하삼동커피&i=./image/9하삼동커피 동명점.jpg",
},

{
  title: "루야",
  address: "광주 동구 제봉로110번길 19 1,2층",
  latlng: new kakao.maps.LatLng(35.1492882, 126.9238012),
  pimg: "./image/10루야.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482634,459152&rt1=&rt2=%EB%A3%A8%EC%95%BC&rtIds=,719862470",
  Link2: "http://localhost:3001/CafeInfo?name=루야&i=./image/10루야.jpeg",
},

{
  title: "맷차",
  address: "광주 동구 동계천로 132",
  latlng: new kakao.maps.LatLng(35.1494165, 126.9236283),
  pimg: "./image/11맷차.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482636,459208&rt1=&rt2=%EB%A7%B7%EC%B0%A8&rtIds=,1374343348",
  Link2: "http://localhost:3001/CafeInfo?name=맷차&i=./image/11맷차.jpg",
},

{
  title: "아노씨스튜디오",
  address: "광주 동구 장동로 5-3 3층",
  latlng: new kakao.maps.LatLng(35.149248, 126.9230292),
  pimg: "./image/12아노씨스튜디오.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482462,459147&rt1=&rt2=%EC%95%84%EB%85%B8%EC%94%A8%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4&rtIds=,789848702",
  Link2:
    "http://localhost:3001/CafeInfo?name=아노씨스튜디오&i=./image/12아노씨스튜디오.jpg",
},

{
  title: "카페 플랜비",
  address: "광주 동구 동계천로 126-7 1,2층",
  latlng: new kakao.maps.LatLng(35.1495625, 126.9234245),
  pimg: "./image/13카페플랜비.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482551,459232&rt1=&rt2=%EC%B9%B4%ED%8E%98%ED%94%8C%EB%9E%9C%EB%B9%84&rtIds=,761426304",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페플랜비&i=./image/13카페플랜비.jpeg",
},

{
  title: "카페 주덴",
  address: "광주 동구 동계천로 126-6 2층",
  latlng: new kakao.maps.LatLng(35.1497141, 126.9233446),
  pimg: "./image/14카페주덴.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482534,459271&rt1=&rt2=%EC%A3%BC%EB%8D%B4&rtIds=,159431609",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페 주덴&i=./image/14카페주덴.jpeg",
},

{
  title: "비비드",
  address: "광주 동구 동계천로 124",
  latlng: new kakao.maps.LatLng(35.1497971, 126.923248),
  pimg: "./image/15비비드.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482507,459293&rt1=&rt2=%EB%B9%84%EB%B9%84%EB%93%9C&rtIds=,1893280012",
  Link2:
    "http://localhost:3001/CafeInfo?name=비비드&i=./image/15비비드.jpg",
},

{
  title: "GT커피",
  address: "광주 동구 동계천로 131",
  latlng: new kakao.maps.LatLng(35.1496587, 126.9242057),
  pimg: "./image/16GT커피.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482735,459268&rt1=&rt2=GT%EC%BB%A4%ED%94%BC&rtIds=,1884832770",
  Link2:
    "http://localhost:3001/CafeInfo?name=GT커피&i=./image/16GT커피.jpeg",
},

{
  title: "카페 텅",
  address: "광주 동구 동명로 8",
  latlng: new kakao.maps.LatLng(35.1499206, 126.9229413),
  pimg: "./image/17카페텅 광주동명점.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482438,459334&rt1=&rt2=%EC%B9%B4%ED%8E%98%20%ED%85%85%20%EA%B4%91%EC%A3%BC%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,1536477252",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페 텅&i=./image/17카페텅 광주동명점.jpeg",
},

{
  title: "공과사",
  address: "광주 동구 동명로 5-1 2층",
  latlng: new kakao.maps.LatLng(35.1499873, 126.9225398),
  pimg: "./image/18공과사.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482349,459349&rt1=&rt2=%EA%B3%B5%EA%B3%BC%EC%82%AC&rtIds=,1343984921",
  Link2:
    "http://localhost:3001/CafeInfo?name=공과사&i=./image/18공과사.jpeg",
},

{
  title: "메저린오피스",
  address: "광주광역시 동구 동명동 154 177번지 1층",
  latlng: new kakao.maps.LatLng(35.1502435, 126.9237843),
  pimg: "./image/19메저린오피스.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482627,459422&rt1=&rt2=%EB%A9%94%EC%A0%80%EB%A6%B0%EC%98%A4%ED%94%BC%EC%8A%A4&rtIds=,1135493979",
  Link2:
    "http://localhost:3001/CafeInfo?name=메저린오피스&i=./image/19메저린오피스.jpg",
},

{
  title: "티앗",
  address: "광주 동구 동명로14번길 12",
  latlng: new kakao.maps.LatLng(35.1499868, 126.9243647),
  pimg: "./image/20티앗.png",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482765,459347&rt1=&rt2=%ED%8B%B0%EC%95%97&rtIds=,1969815297",
  Link2: "http://localhost:3001/CafeInfo?name=티앗&i=./image/20티앗.png",
},
{
  title: "프랭크커핀바",
  address: "광주광역시 동구 동명로14번길 15 1층",
  latlng: new kakao.maps.LatLng(35.1501487, 126.9249752),
  pimg: "./image/21프랭크커핀바 광주동명점.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482901,459396&rt1=&rt2=%ED%94%84%EB%9E%AD%ED%81%AC%EC%BB%A4%ED%95%80%EB%B0%94%20%EA%B4%91%EC%A3%BC%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,1667944802",
  Link2:
    "http://localhost:3001/CafeInfo?name=프랭크커핀바&i=./image/21프랭크커핀바 광주동명점.jpg",
},

{
  title: "모드니",
  address: "광주광역시 동구 동명동 73-19번지",
  latlng: new kakao.maps.LatLng(35.1500148, 126.9254368),
  pimg: "./image/22모드니.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,483006,459356&rt1=&rt2=%EB%AA%A8%EB%93%9C%EB%8B%88&rtIds=,6376422",
  Link2:
    "http://localhost:3001/CafeInfo?name=모드니&i=./image/22모드니.jpg",
},

{
  title: "포르투",
  address: "광주광역시 동구 동계천로 143-42",
  latlng: new kakao.maps.LatLng(35.1497943, 126.9254748),
  pimg: "./image/23포르투.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,483017,459307&rt1=&rt2=%ED%8F%AC%EB%A5%B4%ED%88%AC&rtIds=,775890805",
  Link2:
    "http://localhost:3001/CafeInfo?name=포르투&i=./image/23포르투.jpeg",
},

{
  title: "쎄쎄쎄",
  address: "광주광역시 동구 동명동 49-2",
  latlng: new kakao.maps.LatLng(35.1494397, 126.9275458),
  pimg: "./image/24쎄쎄쎄.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482939,459237&rt1=&rt2=%EC%8E%84%EC%8E%84%EC%8E%84&rtIds=,1334555221",
  Link2:
    "http://localhost:3001/CafeInfo?name=쎄쎄쎄&i=./image/24쎄쎄쎄.jpg",
},

{
  title: "데일리 오아시스",
  address: "광주광역시 동구 동명동 동계천로 143-5",
  latlng: new kakao.maps.LatLng(35.1492226, 126.9250444),
  pimg: "./image/25데일리 오아시스 광주 동명점.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482916,459145&rt1=&rt2=%EB%8D%B0%EC%9D%BC%EB%A6%AC%EC%98%A4%EC%95%84%EC%8B%9C%EC%8A%A4%20%EA%B4%91%EC%A3%BC%EB%8F%99%EB%AA%85%EC%A0%90&rtIds=,891896547",
  Link2:
    "http://localhost:3001/CafeInfo?name=데일리 오아시스&i=./image/25데일리 오아시스 광주 동명점.jpg",
},

{
  title: "에스엔티",
  address: "광주 동구 동명로 4",
  latlng: new kakao.maps.LatLng(35.1496238, 126.9226127),
  pimg: "./image/27에스엔티.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482366,459250&rt1=&rt2=SNT&rtIds=,1450243505",
  Link2:
    "http://localhost:3001/CafeInfo?name=에스엔티&i=./image/27에스엔티.jpg",
},
// 30
{
  title: "굿트커피",
  address: "광주 동구 동계천로 137-5",
  latlng: new kakao.maps.LatLng(35.1495218, 126.9246566),
  pimg: "./image/30굿트커피.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482825,459220&rt1=&rt2=%EA%B5%BF%ED%8A%B8%EC%BB%A4%ED%94%BC&rtIds=,1692841038",
  Link2:
    "http://localhost:3001/CafeInfo?name=굿트커피&i=./image/30굿트커피.jpg",
},
// 31
{
  title: "카페호시정",
  address: "광주 동구 동계천로 137-9",
  latlng: new kakao.maps.LatLng(35.1497214, 126.92487),
  pimg: "./image/31카페호시정.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482879,459277&rt1=&rt2=%EC%B9%B4%ED%8E%98%ED%98%B8%EC%8B%9C%EC%A0%95&rtIds=,904997780",
  Link2:
    "http://localhost:3001/CafeInfo?name=카페호시정&i=./image/31카페호시정.jpeg",
},
];

for (let i = 0; i < positions.length; i++) {
var data = positions[i];
displayMarker(data);
}

var imageSrc =
  "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png", // 마커이미지의 주소입니다
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(
imageSrc,
imageSize,
imageOption
);

// 지도에 마커를 표시하는 함수입니다
function displayMarker(data) {
var marker = new kakao.maps.Marker({
  map: map,
  position: data.latlng,
  image: markerImage,
});
var CustomOverlay = new kakao.maps.CustomOverlay({
  yAnchor: 1.45,
  position: marker.getPosition(),
});

var Customcontent = document.createElement("div");
Customcontent.className = "wrap";

var info = document.createElement("div");
info.className = "info";
Customcontent.appendChild(info);

//커스텀오버레이 타이틀
var contentTitle = document.createElement("div");
contentTitle.className = "title";
contentTitle.appendChild(document.createTextNode(data.title));
info.appendChild(contentTitle);

//커스텀오버레이 닫기 버튼
var closeBtn = document.createElement("div");
closeBtn.className = "close";
closeBtn.setAttribute("title", "닫기");
closeBtn.onclick = function () {
  CustomOverlay.setMap(null);
};
contentTitle.appendChild(closeBtn);

var bodyContent = document.createElement("div");

bodyContent.className = "body";
info.appendChild(bodyContent);

var imgDiv = document.createElement("div");
imgDiv.className = "img";
bodyContent.appendChild(imgDiv);

//커스텀오버레이 이미지
var imgContent = document.createElement("img");
imgContent.src = data.pimg;
//imgContent.setAttribute("src", data.pimg);

imgContent.setAttribute("width", "73px");
imgContent.setAttribute("heigth", "100px");
imgDiv.appendChild(imgContent);

var descContent = document.createElement("div");
descContent.className = "desc";
bodyContent.appendChild(descContent);

//커스텀오버레이 주소
var addressContent = document.createElement("div");
addressContent.className = "ellipsis";
addressContent.appendChild(document.createTextNode(data.address));
descContent.appendChild(addressContent);

var LinkDiv = document.createElement("div");
descContent.appendChild(LinkDiv);

var LinkContent = document.createElement("a");
LinkContent.className = "link";
LinkContent.appendChild(document.createTextNode("길찾기"));
LinkContent.addEventListener("click", function () {
  LinkContent.setAttribute("href", data.Link);
});
LinkDiv.appendChild(LinkContent);

var LinkContent2 = document.createElement("a");
LinkContent2.className = "link2";
LinkContent2.appendChild(document.createTextNode("예약"));
LinkContent2.addEventListener("click", function () {
  LinkContent2.setAttribute("href", data.Link2);
});

LinkDiv.appendChild(LinkContent2);

CustomOverlay.setContent(Customcontent);

kakao.maps.event.addListener(marker, "click", function () {
	  if (ClickOverlay) {
          ClickOverlay.setMap(null);
        }

        CustomOverlay.setMap(map);

        ClickOverlay = CustomOverlay;
});
}
}

function Seoul() {

  let ClickOverlay = null;
var mapContainer = document.getElementById("map"), // 지도의 중심좌표
  mapOption = {
  center: new kakao.maps.LatLng(37.6737966, 126.7754243), // 지도의 중심좌표
  level: 3, // 지도의 확대 레벨
};
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var positions = [
{
  title: "시리즈인트로",
  address: "광주 동구 제봉로110번길 1",
  latlng: new kakao.maps.LatLng(37.6737966, 126.7754243),
  pimg: "./image/1시리즈인트로.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482270,458916&rt1=&rt2=%EC%8B%9C%EB%A6%AC%EC%A6%88%EC%9D%B8%ED%8A%B8%EB%A1%9C&rtIds=,1849034438",
  Link2:
    "http://localhost:3001/CafeInfo?name=시리즈인트로&i=./image/1시리즈인트로.jpeg",
},
{
  title: "티거훗타임쿠키",
  address: "광주 동구 제봉로110번길 9",
  latlng: new kakao.maps.LatLng(37.66995281,126.8554586),
  pimg: "./image/2티거훗타임쿠키in동명.jpg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482405,458996&rt1=&rt2=%ED%8B%B0%EA%B1%B0%ED%9B%97%ED%83%80%EC%9E%84&rtIds=,62937167",
  Link2:
    "http://localhost:3001/CafeInfo?name=티거훗타임쿠키&i=./image/2티거훗타임쿠키in동명.jpg",
},

];

for (let i = 0; i < positions.length; i++) {
var data = positions[i];
displayMarker(data);
}

var imageSrc =
  "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png", // 마커이미지의 주소입니다
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(
imageSrc,
imageSize,
imageOption
);

// 지도에 마커를 표시하는 함수입니다
function displayMarker(data) {
var marker = new kakao.maps.Marker({
  map: map,
  position: data.latlng,
  image: markerImage,
});
var CustomOverlay = new kakao.maps.CustomOverlay({
  yAnchor: 1.45,
  position: marker.getPosition(),
});

var Customcontent = document.createElement("div");
Customcontent.className = "wrap";

var info = document.createElement("div");
info.className = "info";
Customcontent.appendChild(info);

//커스텀오버레이 타이틀
var contentTitle = document.createElement("div");
contentTitle.className = "title";
contentTitle.appendChild(document.createTextNode(data.title));
info.appendChild(contentTitle);

//커스텀오버레이 닫기 버튼
var closeBtn = document.createElement("div");
closeBtn.className = "close";
closeBtn.setAttribute("title", "닫기");
closeBtn.onclick = function () {
  CustomOverlay.setMap(null);
};
contentTitle.appendChild(closeBtn);

var bodyContent = document.createElement("div");

bodyContent.className = "body";
info.appendChild(bodyContent);

var imgDiv = document.createElement("div");
imgDiv.className = "img";
bodyContent.appendChild(imgDiv);

//커스텀오버레이 이미지
var imgContent = document.createElement("img");
imgContent.src = data.pimg;
//imgContent.setAttribute("src", data.pimg);

imgContent.setAttribute("width", "73px");
imgContent.setAttribute("heigth", "100px");
imgDiv.appendChild(imgContent);

var descContent = document.createElement("div");
descContent.className = "desc";
bodyContent.appendChild(descContent);

//커스텀오버레이 주소
var addressContent = document.createElement("div");
addressContent.className = "ellipsis";
addressContent.appendChild(document.createTextNode(data.address));
descContent.appendChild(addressContent);

var LinkDiv = document.createElement("div");
descContent.appendChild(LinkDiv);

var LinkContent = document.createElement("a");
LinkContent.className = "link";
LinkContent.appendChild(document.createTextNode("길찾기"));
LinkContent.addEventListener("click", function () {
  LinkContent.setAttribute("href", data.Link);
});
LinkDiv.appendChild(LinkContent);

var LinkContent2 = document.createElement("a");
LinkContent2.className = "link2";
LinkContent2.appendChild(document.createTextNode("예약"));
LinkContent2.addEventListener("click", function () {
  LinkContent2.setAttribute("href", data.Link2);
});

LinkDiv.appendChild(LinkContent2);

CustomOverlay.setContent(Customcontent);

kakao.maps.event.addListener(marker, "click", function () {
	  if (ClickOverlay) {
          ClickOverlay.setMap(null);
        }

        CustomOverlay.setMap(map);

        ClickOverlay = CustomOverlay;
});
}
}


function Seoul() {

let ClickOverlay = null;
var mapContainer = document.getElementById("map"), // 지도의 중심좌표
mapOption = {
center: new kakao.maps.LatLng(37.6737966, 126.7754243), // 지도의 중심좌표
level: 3, // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var positions = [
{
title: "시리즈인트로",
address: "광주 동구 제봉로110번길 1",
latlng: new kakao.maps.LatLng(37.6737966, 126.7754243),
pimg: "./image/1시리즈인트로.jpeg",
Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482270,458916&rt1=&rt2=%EC%8B%9C%EB%A6%AC%EC%A6%88%EC%9D%B8%ED%8A%B8%EB%A1%9C&rtIds=,1849034438",
Link2:
"http://localhost:3001/CafeInfo?name=시리즈인트로&i=./image/1시리즈인트로.jpeg",
},
{
title: "티거훗타임쿠키",
address: "광주 동구 제봉로110번길 9",
latlng: new kakao.maps.LatLng(37.66995281,126.8554586),
pimg: "./image/2티거훗타임쿠키in동명.jpg",
Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482405,458996&rt1=&rt2=%ED%8B%B0%EA%B1%B0%ED%9B%97%ED%83%80%EC%9E%84&rtIds=,62937167",
Link2:
"http://localhost:3001/CafeInfo?name=티거훗타임쿠키&i=./image/2티거훗타임쿠키in동명.jpg",
},

];

for (let i = 0; i < positions.length; i++) {
var data = positions[i];
displayMarker(data);
}

var imageSrc =
"http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png", // 마커이미지의 주소입니다
imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(
imageSrc,
imageSize,
imageOption
);

//지도에 마커를 표시하는 함수입니다
function displayMarker(data) {
var marker = new kakao.maps.Marker({
map: map,
position: data.latlng,
image: markerImage,
});
var CustomOverlay = new kakao.maps.CustomOverlay({
yAnchor: 1.45,
position: marker.getPosition(),
});

var Customcontent = document.createElement("div");
Customcontent.className = "wrap";

var info = document.createElement("div");
info.className = "info";
Customcontent.appendChild(info);

//커스텀오버레이 타이틀
var contentTitle = document.createElement("div");
contentTitle.className = "title";
contentTitle.appendChild(document.createTextNode(data.title));
info.appendChild(contentTitle);

//커스텀오버레이 닫기 버튼
var closeBtn = document.createElement("div");
closeBtn.className = "close";
closeBtn.setAttribute("title", "닫기");
closeBtn.onclick = function () {
CustomOverlay.setMap(null);
};
contentTitle.appendChild(closeBtn);

var bodyContent = document.createElement("div");

bodyContent.className = "body";
info.appendChild(bodyContent);

var imgDiv = document.createElement("div");
imgDiv.className = "img";
bodyContent.appendChild(imgDiv);

//커스텀오버레이 이미지
var imgContent = document.createElement("img");
imgContent.src = data.pimg;
//imgContent.setAttribute("src", data.pimg);

imgContent.setAttribute("width", "73px");
imgContent.setAttribute("heigth", "100px");
imgDiv.appendChild(imgContent);

var descContent = document.createElement("div");
descContent.className = "desc";
bodyContent.appendChild(descContent);

//커스텀오버레이 주소
var addressContent = document.createElement("div");
addressContent.className = "ellipsis";
addressContent.appendChild(document.createTextNode(data.address));
descContent.appendChild(addressContent);

var LinkDiv = document.createElement("div");
descContent.appendChild(LinkDiv);

var LinkContent = document.createElement("a");
LinkContent.className = "link";
LinkContent.appendChild(document.createTextNode("길찾기"));
LinkContent.addEventListener("click", function () {
LinkContent.setAttribute("href", data.Link);
});
LinkDiv.appendChild(LinkContent);

var LinkContent2 = document.createElement("a");
LinkContent2.className = "link2";
LinkContent2.appendChild(document.createTextNode("예약"));
LinkContent2.addEventListener("click", function () {
LinkContent2.setAttribute("href", data.Link2);
});

LinkDiv.appendChild(LinkContent2);

CustomOverlay.setContent(Customcontent);

kakao.maps.event.addListener(marker, "click", function () {
if (ClickOverlay) {
     ClickOverlay.setMap(null);
   }

   CustomOverlay.setMap(map);

   ClickOverlay = CustomOverlay;
});
}
}

</script>
  </div>
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

