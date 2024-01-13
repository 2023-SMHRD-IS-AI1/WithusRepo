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
 
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>
    <link rel="stylesheet" href="resources/assets/css/reset.css" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet"  href="resources/assets/css/Map.css" />

</head>
<body>
	<%@ include file="./nav.jsp" %>
     <div id="mainImg"></div>
    <!-- mainImg end -->
 
     <div id="contain">
           <div id="buttons">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off"  onclick="location.href='goGroup'"/>
          <label class="btn btn-outline-primary" for="btnradio1">모집</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="location.href='goReview'" />
          <label class="btn btn-outline-primary" for="btnradio2">리뷰</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked />
          <label class="btn btn-outline-primary" for="btnradio3">추천 맛집</label>
        </div>
      </div>
      <!-- buttons end -->
      <div id="mapbuttons">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
          <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" />
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio4" onclick="seoul()">서울</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off" />
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio5" onclick="Gr()">강릉</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off" />
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio6" onclick="jj()">제주</label>
          
          <input type="radio" class="btn-check" name="btnradio" id="btnradio7" autocomplete="off" checked/>
          <label class="btn btn-outline-primary btn-outline-warning" for="btnradio7" onclick="bs()">부산</label>
        </div>
      </div>

      <div id="map" style="width:60%;height:500px;"></div>
	    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=865ecf86d0c01c0a3ac0450f18fe26c1&libraries=services"
    ></script>
    
    <script>
    

    let ClickOverlay = null;
      var mapContainer = document.getElementById("map"), // 지도의 중심좌표
        mapOption = {
        center: new kakao.maps.LatLng(35.1580808, 129.058029), // 지도의 중심좌표
        level: 8, // 지도의 확대 레벨
      };
       
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
    var positions = [
     
    {
hsp_region : "부산",
hsp_name : "쌍둥이 돼지국밥 본점",
hsp_address : "부산광역시 남구 유엔평화로 35-1",
latlng: new kakao.maps.LatLng(35.1317784, 129.0922355),
hsp_tel : "0516287021",
hsp_mainmenu : "돼지국밥",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,976776,459295&rt1=&rt2=쌍둥이돼지국밥](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,976776,459295&rt1=&rt2=%EC%8C%8D%EB%91%A5%EC%9D%B4%EB%8F%BC%EC%A7%80%EA%B5%AD%EB%B0%A5) 본점&rtIds=,349525135",
hsp_img: "resources/hsp_img/busan/busanimg1.jpg"
},

{
hsp_region : "부산",
hsp_name : "개금밀면 서면",
hsp_address : "부산광역시 부산진구 서면로68번길 39",
latlng: new kakao.maps.LatLng(35.1552602, 129.0585654),
hsp_tel : "0518020456",
hsp_mainmenu : "물밀면, 비빔밀면",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968948,465645&rt1=&rt2=서면개금밀면&rtIds=,10116848](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968948,465645&rt1=&rt2=%EC%84%9C%EB%A9%B4%EA%B0%9C%EA%B8%88%EB%B0%80%EB%A9%B4&rtIds=,10116848)",
hsp_img: "resources/hsp_img/busan/busanimg2.jpg"
},

{
hsp_region : "부산",
hsp_name : "백화양곱창",
hsp_address : "부산광역시 중구 자갈치로23번길 6",
latlng: new kakao.maps.LatLng(35.0969366, 129.0270227),
hsp_tel : "0512573352",
hsp_mainmenu : "양곱창",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962090,449323&rt1=&rt2=백화양곱창](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962090,449323&rt1=&rt2=%EB%B0%B1%ED%99%94%EC%96%91%EA%B3%B1%EC%B0%BD) 1호&rtIds=,2061622071",
hsp_img: "resources/hsp_img/busan/busanimg3.jpg"
},

{
hsp_region : "부산",
hsp_name : "다리집",
hsp_address : "부산광역시 수영구 남천바다로10번길 70 101호",
latlng: new kakao.maps.LatLng(35.1465455, 129.1107007),
hsp_tel : "0516250130",
hsp_mainmenu : "떡볶이",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,980879,463470&rt1=&rt2=다리집](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,980879,463470&rt1=&rt2=%EB%8B%A4%EB%A6%AC%EC%A7%91) 본점&rtIds=,8849564",
hsp_img: "resources/hsp_img/busan/busanimg4.jpg"
},

{
hsp_region : "부산",
hsp_name : "옵스 해운대점",
hsp_address : "부산 해운대구 중동1로 31",
latlng: new kakao.maps.LatLng(35.1627911, 129.1628989),
hsp_tel : "0517476886",
hsp_mainmenu : "빵",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,992676,468249&rt1=&rt2=옵스](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,992676,468249&rt1=&rt2=%EC%98%B5%EC%8A%A4) 해운대점&rtIds=,8010849",
hsp_img: "resources/hsp_img/busan/busanimg5.jpg"
},

{
hsp_region : "부산",
hsp_name : "동래 할매파전",
hsp_address : "부산 동래구 명륜로94번길 43-10",
latlng: new kakao.maps.LatLng(35.2045795, 129.0838345),
hsp_tel : "0515520792",
hsp_mainmenu : "동래파전",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,974426,479450&rt1=&rt2=동래할매파전&rtIds=,10305625](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,974426,479450&rt1=&rt2=%EB%8F%99%EB%9E%98%ED%95%A0%EB%A7%A4%ED%8C%8C%EC%A0%84&rtIds=,10305625)",
hsp_img: "resources/hsp_img/busan/busanimg6.jpg"
},

{
hsp_region : "부산",
hsp_name : "이재모피자",
hsp_address : "부산 중구 광복중앙로 31 중앙아파트 상가 2층",
latlng: new kakao.maps.LatLng(35.1021046, 129.0305985),
hsp_tel : "0512451478",
hsp_mainmenu : "이재모 새싹피자",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962915,450758&rt1=&rt2=이재모피자](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962915,450758&rt1=&rt2=%EC%9D%B4%EC%9E%AC%EB%AA%A8%ED%94%BC%EC%9E%90) 본점&rtIds=,10070964",
hsp_img: "resources/hsp_img/busan/busanimg7.jpg"
},

{
hsp_region : "부산",
hsp_name : "사상꼬리집",
hsp_address : "부산광역시 사상구 사상로233번길 34",
latlng: new kakao.maps.LatLng(35.1657217, 128.9809225),
hsp_tel : "0513233146",
hsp_mainmenu : "꼬리",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,951129,468227&rt1=&rt2=사상꼬리집&rtIds=,13568871](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,951129,468227&rt1=&rt2=%EC%82%AC%EC%83%81%EA%BC%AC%EB%A6%AC%EC%A7%91&rtIds=,13568871)",
hsp_img: "resources/hsp_img/busan/busanimg8.jpg"
},

{
hsp_region : "부산",
hsp_name : "마산곱창",
hsp_address : "부산광역시 부산진구 신천대로 290",
latlng: new kakao.maps.LatLng(35.1676386, 129.0507095),
hsp_tel : "0518047416",
hsp_mainmenu : "곱창전골",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,967093,469053&rt1=&rt2=마산곱창&rtIds=,16669377](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,967093,469053&rt1=&rt2=%EB%A7%88%EC%82%B0%EA%B3%B1%EC%B0%BD&rtIds=,16669377)",
hsp_img: "resources/hsp_img/busan/busanimg9.jpg"
},

{
hsp_region : "부산",
hsp_name : "급행장",
hsp_address : "부산 부산진구 서면문화로 4",
latlng: new kakao.maps.LatLng(35.1580808, 129.058029),
hsp_tel : "0518092100",
hsp_mainmenu : "한우 생갈비",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968816,466435&rt1=&rt2=급행장](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968816,466435&rt1=&rt2=%EA%B8%89%ED%96%89%EC%9E%A5) 본점&rtIds=,12601510",
hsp_img: "resources/hsp_img/busan/busanimg10.jpg"
}


  
     
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
      contentTitle.className = "hsp_name ";
      contentTitle.appendChild(document.createTextNode(data. hsp_name));
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
      imgContent.src = data. hsp_img;
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
      addressContent.appendChild(document.createTextNode(data.hsp_address));
      descContent.appendChild(addressContent);
  
      // 지역
      var  hsp_region = document.createElement("div");
      hsp_region.className = "hsp_region";
      hsp_region.appendChild(document.createTextNode(data. hsp_region));
      descContent.appendChild(hsp_region);
  
      // 전화번호
      var  hsp_tel = document.createElement("div");
      hsp_tel.className = "hsp_tel";
      hsp_tel.appendChild(document.createTextNode(data.hsp_tel));
      descContent.appendChild(hsp_tel);
  
       // 메인 메뉴
      var hsp_mainmenu  = document.createElement("div");
      hsp_mainmenu.className = "hsp_mainmenu ";
      hsp_mainmenu.appendChild(document.createTextNode(data.hsp_mainmenu));
      descContent.appendChild(hsp_mainmenu);
  
      var LinkDiv = document.createElement("div");
      descContent.appendChild(LinkDiv);
  
      var LinkContent = document.createElement("a");
      LinkContent.className = "link";
      LinkContent.appendChild(document.createTextNode("길찾기"));
      LinkContent.addEventListener("click", function () {
        LinkContent.setAttribute("href", data.Link);
      });
      LinkDiv.appendChild(LinkContent);
  
      CustomOverlay.setContent(Customcontent);
  
      kakao.maps.event.addListener(marker, "click", function () {
          if (ClickOverlay) {
                ClickOverlay.setMap(null);
              }
  
              CustomOverlay.setMap(map);
  
              ClickOverlay = CustomOverlay;
      });
    }

 

   // 서울 함수 

    function seoul() {
      let ClickOverlay = null;
    var mapContainer = document.getElementById("map"), // 지도의 중심좌표
      mapOption = {
      center: new kakao.maps.LatLng(37.5570994, 127.0116712), // 지도의 중심좌표
      level: 7, // 지도의 확대 레벨
    };
     
  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  var positions = [
   
{
   hsp_region : "서울",
   hsp_name : "파이브가이즈 강남점",
   hsp_address : "서울특별시 서초구 강남대로 435" ,
   latlng : new kakao.maps.LatLng(37.5012188, 127.0256954),
   hsp_tel : "07088347900",
   hsp_mainmenu : "치즈버거",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,505678,1111585&rt1=&rt2=파이브가이즈 강남&rtIds=,1725176424",
   hsp_img: "resources/hsp_img/seoul/seoulimg1.jpg",
},

{
   hsp_region : "서울",
      hsp_name : "명동 교자",
      hsp_address : "서울특별시 서초구 강남대로 435" ,
      latlng : new kakao.maps.LatLng(37.5012188, 127.0256954),
      hsp_tel : "07088347900",
      hsp_mainmenu : "칼국수",
      Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,505678,1111585&rt1=&rt2=파이브가이즈 강남&rtIds=,1725176424",
      hsp_img:"resources/hsp_img/seoul/seoulimg1.jpg2",
   
},

{
   hsp_region : "서울",
   hsp_name : "우정떡볶이",
   hsp_address : "서울특별시 중구 퇴계로76길 55" ,
   latlng : new kakao.maps.LatLng(37.5627442, 127.0149072),
   hsp_tel : "0222330669",
   hsp_mainmenu : "2인세트",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,503294,1128681&rt1=&rt2=우정&rtIds=,27388900",
   hsp_img: "resources/hsp_img/seoul/seoulimg3.jpg",
},

{
   hsp_region : "서울",
   hsp_name : "금돼지식당",
   hsp_address : "서울특별시 중구 다산로 149" ,
   latlng : new kakao.maps.LatLng(37.5570994, 127.0116712),
   hsp_tel : "01044848750",
   hsp_mainmenu : "본삼겹",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,502580,1127093&rt1=&rt2=금돼지식당&rtIds=,1065693087",
   hsp_img: "resources/hsp_img/seoul/seoulimg4.jpg",
},

{
   hsp_region : "서울",
   hsp_name : "유즈라멘 본점",
   hsp_address : "서울특별시 중구 만리동1가 53-8" ,
   latlng : new kakao.maps.LatLng(37.5568928, 126.968192),
   hsp_tel :" 07041770365",
   hsp_mainmenu : "유즈시오라멘",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,492984,1127026&rt1=&rt2=유즈라멘 만리동점&rtIds=,469577034",
   hsp_img: "resources/hsp_img/seoul/seoulimg5.jpg",
},

{
   hsp_region : "서울",
   hsp_name : "차크라 정동 인도레스토랑",
   hsp_address : "서울특별시 용산구 한남동 독서당로 83", 
   latlng : new kakao.maps.LatLng(37.5344972, 127.0096897),
   hsp_tel : "027961149",
   hsp_mainmenu : "치킨티카세트",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,502141,1120833&rt1=&rt2=챠크라&rtIds=,1912252139",
   hsp_img: "resources/hsp_img/seoul/seoulimg6.jpg",
},

{
   hsp_region : "서울",
   hsp_name : "육전식당 서울 본점",
   hsp_address : "서울특별시 동대문구 난계로30길 16" ,
   latlng : new kakao.maps.LatLng(37.5742381, 127.0242968),
   hsp_tel :" 0222536373",
   hsp_mainmenu : "통삼겹살",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,505382,1131860&rt1=&rt2=육전식당 본점&rtIds=,10331494",
   hsp_img: "resources/hsp_img/seoul/seoulimg7.jpg",
},

{
   hsp_region : "서울",
   hsp_name : "나폴레옹과자점 성북본점",
   hsp_address : "서울특별시 성북구 성북로 7" ,
   latlng : new kakao.maps.LatLng(37.5887465, 127.0080764),
   hsp_tel :" 0222536373",
   hsp_mainmenu : "소프트롤",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,501125,1135927&rt1=&rt2=나폴레옹과자점 성북본점&rtIds=,8203240",
   hsp_img: "resources/hsp_img/seoul/seoulimg8.jpg",
},

{
   hsp_region : "서울",
   hsp_name : "구포국수",
   hsp_address : "서울특별시 성북구 성북로 52-1",
   latlng : new kakao.maps.LatLng(37.5887465, 127.0080764),
   hsp_tel : "0222536373",
   hsp_mainmenu : "멸치국수",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,503779,1137432&rt1=&rt2=구포국수&rtIds=,1205939791",
   hsp_img: "resources/hsp_img/seoul/seoulimg9.jpg",
},

{
   hsp_region : "서울",
   hsp_name : "신선식탁 대학로 본점",
   hsp_address : "서울특별시 종로구 율곡로13가길 4" ,
   latlng : new kakao.maps.LatLng(37.5763149, 127.0006982),
   hsp_tel :" 027426933",
   hsp_mainmenu : "목살스테이크",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,500157,1132446&rt1=&rt2=신선식탁&rtIds=,1718266224",
   hsp_img: "resources/hsp_img/seoul/seoulimg10.jpg",
},


   
  ];

  for (let i = 0; i <positions.length; i++) {
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
    contentTitle.className = "hsp_name ";
    contentTitle.appendChild(document.createTextNode(data. hsp_name));
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
    imgContent.src = data. hsp_img;
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
    addressContent.appendChild(document.createTextNode(data.hsp_address));
    descContent.appendChild(addressContent);

    // 지역
    var  hsp_region = document.createElement("div");
    hsp_region.className = "hsp_region";
    hsp_region.appendChild(document.createTextNode(data. hsp_region));
    descContent.appendChild(hsp_region);

    // 전화번호
    var  hsp_tel = document.createElement("div");
    hsp_tel.className = "hsp_tel";
    hsp_tel.appendChild(document.createTextNode(data.hsp_tel));
    descContent.appendChild(hsp_tel);

     // 메인 메뉴
    var hsp_mainmenu  = document.createElement("div");
    hsp_mainmenu.className = "hsp_mainmenu ";
    hsp_mainmenu.appendChild(document.createTextNode(data.hsp_mainmenu));
    descContent.appendChild(hsp_mainmenu);

    var LinkDiv = document.createElement("div");
    descContent.appendChild(LinkDiv);

    var LinkContent = document.createElement("a");
    LinkContent.className = "link";
    LinkContent.appendChild(document.createTextNode("길찾기"));
    LinkContent.addEventListener("click", function () {
      LinkContent.setAttribute("href", data.Link);
    });
    LinkDiv.appendChild(LinkContent);

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


    // 강릉 함수 
     

      function Gr() {
        let ClickOverlay = null;
      var mapContainer = document.getElementById("map"), // 지도의 중심좌표
        mapOption = {
        center: new kakao.maps.LatLng(37.7564341, 128.8948752), // 지도의 중심좌표
        level: 8, // 지도의 확대 레벨
      };
       
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
    var positions = [
     
    {
   hsp_region : "강릉",
   hsp_name : "테라로사 커피공장 강릉본점",
   hsp_address : "강원도 강릉시 구정면 현천길 7",
   latlng: new kakao.maps.LatLng(37.6961635, 128.8923885),
   hsp_tel : "0336482760",
   hsp_mainmenu : "아메리카노",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,917296,1169999&rt1=&rt2=테라로사 커피공장 강릉본점&rtIds=,21344157",
   hsp_img: "resources/hsp_img/kangreung/kangimg1.jpg",
},

{
   hsp_region : "강릉",
   hsp_name : "동화가든 본점",
   hsp_address : "강원특별자치도 강릉시 초당순두부길77번길 15",
   latlng: new kakao.maps.LatLng(37.791097, 128.9147239),
   hsp_tel : "050714329885",
   hsp_mainmenu : "원조짬순",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,921633,1196365&rt1=&rt2=강릉동화가든 본점&rtIds=,7846414",
   hsp_img: "resources/hsp_img/kangreung/kangimg2.jpg"
},

{
   hsp_region : "강릉",
   hsp_name : "버드나무 브루어리",
   hsp_address : "강원도 강릉시 경강로 1961", 
   latlng: new kakao.maps.LatLng(37.7482296, 128.8843596),
   hsp_tel : "050714329885",
   hsp_mainmenu : "마르게리타 피자",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,915228,1184300&rt1=&rt2=버드나무브루어리&rtIds=,27152913",
   hsp_img: "resources/hsp_img/kangreung/kangimg3.jpg"
},

{
   hsp_region : "강릉",
   hsp_name : "교동반점 본점",
   hsp_address : "강원도 강릉시 강릉대로 205" ,
   latlng: new kakao.maps.LatLng(37.75835, 128.8930428),
   hsp_tel : "0336463833",
   hsp_mainmenu : "교동짬뽕면",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,917036,1187152&rt1=&rt2=원조강릉교동반점 본점&rtIds=,8773810",
   hsp_img: "resources/hsp_img/kangreung/kangimg4.jpg",
},

{
   hsp_region : "강릉",
   hsp_name : "초당할머니 순두부",
   hsp_address : "강원특별자치도 강릉시 초당순두부길 77", 
   latlng: new kakao.maps.LatLng(37.790496, 128.915441),
   hsp_tel :" 0336522058",
   hsp_mainmenu : "순두부백반",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,921798,1196203&rt1=&rt2=초당할머니순두부&rtIds=,8535139",
   hsp_img: "resources/hsp_img/kangreung/kangimg5.jpg"
},

{
   hsp_region : "강릉",
   hsp_name : "루이식당",
   hsp_address : "강원도 강릉시 강문동 창해로 439", 
   latlng: new kakao.maps.LatLng(37.8003439, 128.9127025),
   hsp_tel : "0336440439",
   hsp_mainmenu : "루이 돈가츠",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,921142,1198916&rt1=&rt2=루이식당&rtIds=,268969109",
   hsp_img: "resources/hsp_img/kangreung/kangimg6.jpg"
},

{
   hsp_region : "강릉",
   hsp_name : "강릉감자 옹심이",
   hsp_address : "강원도 강릉시 임당동 19-22" ,
   latlng: new kakao.maps.LatLng(37.7564341, 128.8948752),
   hsp_tel : "0336480340",
   hsp_mainmenu : "순감자옹심이",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,917471,1186653&rt1=&rt2=강릉감자옹심이 강릉본점&rtIds=,10127723",
   hsp_img: "resources/hsp_img/kangreung/kangimg7.jpg"
},

{
   hsp_region : "강릉",
   hsp_name : "오월에 초당",
   hsp_address : "강원특별자치도 강릉시 난설헌로 234-5", 
   latlng: new kakao.maps.LatLng(37.7929727, 128.9146131),
   hsp_tel : "0336510187",
   hsp_mainmenu : "보쌈한상",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,921633,1196868&rt1=&rt2=오월에초당&rtIds=,26992014",
   hsp_img: "resources/hsp_img/kangreung/kangimg8.jpg"
},

{
   hsp_region : "강릉",
   hsp_name : "형제칼국수",
   hsp_address : "강원도 강릉시 교동 162-76" ,
   latlng: new kakao.maps.LatLng(37.7578859, 128.8930168),
   hsp_tel : "0336471358",
   hsp_mainmenu : "장칼국수",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,917070,1187035&rt1=&rt2=형제칼국수&rtIds=,13131970",
   hsp_img: "resources/hsp_img/kangreung/kangimg9.jpg"
},

{
   hsp_region : "강릉",
   hsp_name : "버거웍스",
   hsp_address : "강원도 강릉시 견소동 창해로14번길 12" ,
   latlng: new kakao.maps.LatLng(37.7731043, 128.946477),
   hsp_tel : "0336524160",
   hsp_mainmenu : "웍스버거",
   Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,928749,1191500&rt1=&rt2=버거웍스&rtIds=,760568991",
   hsp_img: "resources/hsp_img/kangreung/kangimg10.jpg"
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
      contentTitle.className = "hsp_name ";
      contentTitle.appendChild(document.createTextNode(data. hsp_name));
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
      imgContent.src = data. hsp_img;
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
      addressContent.appendChild(document.createTextNode(data.hsp_address));
      descContent.appendChild(addressContent);
  
      // 지역
      var  hsp_region = document.createElement("div");
      hsp_region.className = "hsp_region";
      hsp_region.appendChild(document.createTextNode(data. hsp_region));
      descContent.appendChild(hsp_region);
  
      // 전화번호
      var  hsp_tel = document.createElement("div");
      hsp_tel.className = "hsp_tel";
      hsp_tel.appendChild(document.createTextNode(data.hsp_tel));
      descContent.appendChild(hsp_tel);
  
       // 메인 메뉴
      var hsp_mainmenu  = document.createElement("div");
      hsp_mainmenu.className = "hsp_mainmenu ";
      hsp_mainmenu.appendChild(document.createTextNode(data.hsp_mainmenu));
      descContent.appendChild(hsp_mainmenu);
  
      var LinkDiv = document.createElement("div");
      descContent.appendChild(LinkDiv);
  
      var LinkContent = document.createElement("a");
      LinkContent.className = "link";
      LinkContent.appendChild(document.createTextNode("길찾기"));
      LinkContent.addEventListener("click", function () {
        LinkContent.setAttribute("href", data.Link);
      });
      LinkDiv.appendChild(LinkContent);
  
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
      

      // 제주
      function jj() {
        let ClickOverlay = null;
      var mapContainer = document.getElementById("map"), // 지도의 중심좌표
        mapOption = {
        center: new kakao.maps.LatLng(33.4867686, 126.489452), // 지도의 중심좌표
        level: 7, // 지도의 확대 레벨
      };
       
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
    var positions = [
     
    {   
   hsp_region : "제주",
   hsp_name : "문개항아리",
   hsp_address : "제주특별자치도 제주시 조천읍 조함해안로 217-1" ,
   latlng : new kakao.maps.LatLng(33.5534876, 126.6440569),
   hsp_tel : "07042244775",
   hsp_mainmenu : "우삼겹 칼라반반/라면/칼국수 2人",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,417353,16731&rt1=&rt2=문개항아리 조천본점&rtIds=,26792593",
   hsp_img: "resources/hsp_img/jeju/jejuimg1.jpg",
   
  /*  title: "시리즈인트로",
  address: "광주 동구 제봉로110번길 1",
  latlng: new kakao.maps.LatLng(35.1484606, 126.9222057),
  pimg: "./image/1시리즈인트로.jpeg",
  Link: "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,482270,458916&rt1=&rt2=%EC%8B%9C%EB%A6%AC%EC%A6%88%EC%9D%B8%ED%8A%B8%EB%A1%9C&rtIds=,1849034438",
  Link2:
    "http://localhost:3001/CafeInfo?name=시리즈인트로&i=./image/1시리즈인트로.jpeg",  */
},
{
   hsp_region : "제주",
   hsp_name : "숙성도",
   hsp_address : "제주특별자치도 제주시 원노형로 41" ,
   latlng : new kakao.maps.LatLng(33.4850463, 126.4850445),
   hsp_tel : "0647115212",
   hsp_mainmenu : "960숙성흑뼈등심(350g)",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,380346,-2092&rt1=&rt2=숙성도 노형점&rtIds=,316010726",
   hsp_img: "resources/hsp_img/jeju/jejuimg2.jpg"
},
{
   hsp_region : "제주",
   hsp_name : "새우리",
   hsp_address : "제주특별자치도 제주시 특별자치도 무근성7길 24" ,
   latlng : new kakao.maps.LatLng(33.5146009, 126.5207545),
   hsp_tel : "0649002527",
   hsp_mainmenu : "딱새우 김밥",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,388683,6070&rt1=&rt2=제주시새우리 제주점&rtIds=,2146989435",
   hsp_img: "resources/hsp_img/jeju/jejuimg3.jpg",
},

{
   hsp_region : "제주",
   hsp_name : "자매국수",
   hsp_address : "제주특별자치도 제주시 특별자치도, 항골남길 46" ,
   latlng : new kakao.maps.LatLng(33.4985643, 126.458788),
   hsp_tel : "0647462222",
   hsp_mainmenu : "고기국수",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,374353,1694&rt1=&rt2=자매국수&rtIds=,21455793",
   hsp_img: "resources/hsp_img/jeju/jejuimg4.jpg",
},

{
   hsp_region : "제주",
   hsp_name : "정우말가든",
   hsp_address : "제주특별자치도 제주시 연동 505-5", 
   latlng : new kakao.maps.LatLng(33.4802099, 126.4976743),
   hsp_tel : "0647476525",
   hsp_mainmenu : "정우스페샬코스",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,383242,-3425&rt1=&rt2=정우말가든&rtIds=,8515374",
   hsp_img: "resources/hsp_img/jeju/jejuimg5.jpg",
},

{
   hsp_region : "제주",
   hsp_name : "하타나카",
   hsp_address : "제주특별자치도 제주시 특별자치도 연동 번지 1층 292-57" ,
   latlng : new kakao.maps.LatLng(33.4886182, 126.4948886),
   hsp_tel : "0647476525",
   hsp_mainmenu : "닭다리살 꼬치",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,362461,-1898&rt1=&rt2=하타나카&rtIds=,1000640070",
   hsp_img: "resources/hsp_img/jeju/jejuimg6.jpg"
},

{
   hsp_region : "제주",
   hsp_name : "제주 김만복",
   hsp_address : "제주특별자치도 제주시 특별자치도, 오라로 41 KR" ,
   latlng : new kakao.maps.LatLng(33.4970467, 126.5090047),
   hsp_tel : "0647598582",
   hsp_mainmenu : "만복이네 김밥",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,385915,1209&rt1=&rt2=제주김만복 김밥 본점&rtIds=,1046180098",
   hsp_img: "resources/hsp_img/jeju/jejuimg7.jpg",
},

{
   hsp_region : "제주",
   hsp_name : "반디파스타",
   hsp_address : "제주특별자치도 제주시 특별자치도, 조천읍 함덕리 528 KR 1004-29 3층 반디파스타" ,
   latlng : new kakao.maps.LatLng(33.5425322, 126.6692199),
   hsp_tel : "050713840615",
   hsp_mainmenu : "돌문어 오일 파스타",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,423185,13672&rt1=&rt2=반디파스타 함덕본점&rtIds=,1232992456",
   hsp_img: "resources/hsp_img/jeju/jejuimg8.jpg"
},

{
   hsp_region : "제주",
   hsp_name : "우진해장국",
   hsp_address : "제주특별자치도 제주시 특별자치도 서사로 11" ,
   latlng : new kakao.maps.LatLng(33.511505, 126.5200319),
   hsp_tel : "0647573393",
   hsp_mainmenu : "고사리육개장",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,388508,5213&rt1=&rt2=우진해장국&rtIds=,11547525",
   hsp_img: "resources/hsp_img/jeju/jejuimg9.jpg"
},

{
   hsp_region : "제주",
   hsp_name : "마라도 횟집",
   hsp_address : "제주특별자치도 제주시 연동 262-10" ,
   latlng : new kakao.maps.LatLng(33.4867686, 126.489452),
   hsp_tel :" 0647462286",
   hsp_mainmenu : "모듬회",
   Link : "https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,381367,-1606&rt1=&rt2=연동마라도횟집&rtIds=,27454594",
   hsp_img: "resources/hsp_img/jeju/jejuimg10.jpg"
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
      contentTitle.className = "hsp_name ";
      contentTitle.appendChild(document.createTextNode(data. hsp_name));
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
      imgContent.src = data. hsp_img;
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
      addressContent.appendChild(document.createTextNode(data.hsp_address));
      descContent.appendChild(addressContent);
  
      // 지역
      var  hsp_region = document.createElement("div");
      hsp_region.className = "hsp_region";
      hsp_region.appendChild(document.createTextNode(data. hsp_region));
      descContent.appendChild(hsp_region);
  
      // 전화번호
      var  hsp_tel = document.createElement("div");
      hsp_tel.className = "hsp_tel";
      hsp_tel.appendChild(document.createTextNode(data.hsp_tel));
      descContent.appendChild(hsp_tel);
  
       // 메인 메뉴
      var hsp_mainmenu  = document.createElement("div");
      hsp_mainmenu.className = "hsp_mainmenu ";
      hsp_mainmenu.appendChild(document.createTextNode(data.hsp_mainmenu));
      descContent.appendChild(hsp_mainmenu);
  
      var LinkDiv = document.createElement("div");
      descContent.appendChild(LinkDiv);
  
      var LinkContent = document.createElement("a");
      LinkContent.className = "link";
      LinkContent.appendChild(document.createTextNode("길찾기"));
      LinkContent.addEventListener("click", function () {
        LinkContent.setAttribute("href", data.Link);
      });
      LinkDiv.appendChild(LinkContent);
  
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



    // 부산
    function bs() {
        let ClickOverlay = null;
      var mapContainer = document.getElementById("map"), // 지도의 중심좌표
        mapOption = {
        center: new kakao.maps.LatLng(35.1580808, 129.058029), // 지도의 중심좌표
        level: 8, // 지도의 확대 레벨
      };
       
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
    var positions = [
     
    {
hsp_region : "부산",
hsp_name : "쌍둥이 돼지국밥 본점",
hsp_address : "부산광역시 남구 유엔평화로 35-1",
latlng: new kakao.maps.LatLng(35.1317784, 129.0922355),
hsp_tel : "0516287021",
hsp_mainmenu : "돼지국밥",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,976776,459295&rt1=&rt2=쌍둥이돼지국밥](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,976776,459295&rt1=&rt2=%EC%8C%8D%EB%91%A5%EC%9D%B4%EB%8F%BC%EC%A7%80%EA%B5%AD%EB%B0%A5) 본점&rtIds=,349525135",
hsp_img: "resources/hsp_img/busan/busanimg1.jpg"
},

{
hsp_region : "부산",
hsp_name : "개금밀면 서면",
hsp_address : "부산광역시 부산진구 서면로68번길 39",
latlng: new kakao.maps.LatLng(35.1552602, 129.0585654),
hsp_tel : "0518020456",
hsp_mainmenu : "물밀면, 비빔밀면",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968948,465645&rt1=&rt2=서면개금밀면&rtIds=,10116848](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968948,465645&rt1=&rt2=%EC%84%9C%EB%A9%B4%EA%B0%9C%EA%B8%88%EB%B0%80%EB%A9%B4&rtIds=,10116848)",
hsp_img: "resources/hsp_img/busan/busanimg2.jpg"
},

{
hsp_region : "부산",
hsp_name : "백화양곱창",
hsp_address : "부산광역시 중구 자갈치로23번길 6",
latlng: new kakao.maps.LatLng(35.0969366, 129.0270227),
hsp_tel : "0512573352",
hsp_mainmenu : "양곱창",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962090,449323&rt1=&rt2=백화양곱창](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962090,449323&rt1=&rt2=%EB%B0%B1%ED%99%94%EC%96%91%EA%B3%B1%EC%B0%BD) 1호&rtIds=,2061622071",
hsp_img: "resources/hsp_img/busan/busanimg3.jpg"
},

{
hsp_region : "부산",
hsp_name : "다리집",
hsp_address : "부산광역시 수영구 남천바다로10번길 70 101호",
latlng: new kakao.maps.LatLng(35.1465455, 129.1107007),
hsp_tel : "0516250130",
hsp_mainmenu : "떡볶이",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,980879,463470&rt1=&rt2=다리집](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,980879,463470&rt1=&rt2=%EB%8B%A4%EB%A6%AC%EC%A7%91) 본점&rtIds=,8849564",
hsp_img: "resources/hsp_img/busan/busanimg4.jpg"
},

{
hsp_region : "부산",
hsp_name : "옵스 해운대점",
hsp_address : "부산 해운대구 중동1로 31",
latlng: new kakao.maps.LatLng(35.1627911, 129.1628989),
hsp_tel : "0517476886",
hsp_mainmenu : "빵",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,992676,468249&rt1=&rt2=옵스](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,992676,468249&rt1=&rt2=%EC%98%B5%EC%8A%A4) 해운대점&rtIds=,8010849",
hsp_img: "resources/hsp_img/busan/busanimg5.jpg"
},

{
hsp_region : "부산",
hsp_name : "동래 할매파전",
hsp_address : "부산 동래구 명륜로94번길 43-10",
latlng: new kakao.maps.LatLng(35.2045795, 129.0838345),
hsp_tel : "0515520792",
hsp_mainmenu : "동래파전",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,974426,479450&rt1=&rt2=동래할매파전&rtIds=,10305625](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,974426,479450&rt1=&rt2=%EB%8F%99%EB%9E%98%ED%95%A0%EB%A7%A4%ED%8C%8C%EC%A0%84&rtIds=,10305625)",
hsp_img: "resources/hsp_img/busan/busanimg6.jpg"
},

{
hsp_region : "부산",
hsp_name : "이재모피자",
hsp_address : "부산 중구 광복중앙로 31 중앙아파트 상가 2층",
latlng: new kakao.maps.LatLng(35.1021046, 129.0305985),
hsp_tel : "0512451478",
hsp_mainmenu : "이재모 새싹피자",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962915,450758&rt1=&rt2=이재모피자](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,962915,450758&rt1=&rt2=%EC%9D%B4%EC%9E%AC%EB%AA%A8%ED%94%BC%EC%9E%90) 본점&rtIds=,10070964",
hsp_img: "resources/hsp_img/busan/busanimg7.jpg"
},

{
hsp_region : "부산",
hsp_name : "사상꼬리집",
hsp_address : "부산광역시 사상구 사상로233번길 34",
latlng: new kakao.maps.LatLng(35.1657217, 128.9809225),
hsp_tel : "0513233146",
hsp_mainmenu : "꼬리",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,951129,468227&rt1=&rt2=사상꼬리집&rtIds=,13568871](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,951129,468227&rt1=&rt2=%EC%82%AC%EC%83%81%EA%BC%AC%EB%A6%AC%EC%A7%91&rtIds=,13568871)",
hsp_img: "resources/hsp_img/busan/busanimg8.jpg"
},

{
hsp_region : "부산",
hsp_name : "마산곱창",
hsp_address : "부산광역시 부산진구 신천대로 290",
latlng: new kakao.maps.LatLng(35.1676386, 129.0507095),
hsp_tel : "0518047416",
hsp_mainmenu : "곱창전골",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,967093,469053&rt1=&rt2=마산곱창&rtIds=,16669377](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,967093,469053&rt1=&rt2=%EB%A7%88%EC%82%B0%EA%B3%B1%EC%B0%BD&rtIds=,16669377)",
hsp_img: "resources/hsp_img/busan/busanimg9.jpg"
},

{
hsp_region : "부산",
hsp_name : "급행장",
hsp_address : "부산 부산진구 서면문화로 4",
latlng: new kakao.maps.LatLng(35.1580808, 129.058029),
hsp_tel : "0518092100",
hsp_mainmenu : "한우 생갈비",
Link: "[https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968816,466435&rt1=&rt2=급행장](https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,968816,466435&rt1=&rt2=%EA%B8%89%ED%96%89%EC%9E%A5) 본점&rtIds=,12601510",
hsp_img: "resources/hsp_img/busan/busanimg10.jpg"
}


  
     
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
      contentTitle.className = "hsp_name ";
      contentTitle.appendChild(document.createTextNode(data. hsp_name));
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
      imgContent.src = data. hsp_img;
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
      addressContent.appendChild(document.createTextNode(data.hsp_address));
      descContent.appendChild(addressContent);
  
      // 지역
      var  hsp_region = document.createElement("div");
      hsp_region.className = "hsp_region";
      hsp_region.appendChild(document.createTextNode(data. hsp_region));
      descContent.appendChild(hsp_region);
  
      // 전화번호
      var  hsp_tel = document.createElement("div");
      hsp_tel.className = "hsp_tel";
      hsp_tel.appendChild(document.createTextNode(data.hsp_tel));
      descContent.appendChild(hsp_tel);
  
       // 메인 메뉴
      var hsp_mainmenu  = document.createElement("div");
      hsp_mainmenu.className = "hsp_mainmenu ";
      hsp_mainmenu.appendChild(document.createTextNode(data.hsp_mainmenu));
      descContent.appendChild(hsp_mainmenu);
  
      var LinkDiv = document.createElement("div");
      descContent.appendChild(LinkDiv);
  
      var LinkContent = document.createElement("a");
      LinkContent.className = "link";
      LinkContent.appendChild(document.createTextNode("길찾기"));
      LinkContent.addEventListener("click", function () {
        LinkContent.setAttribute("href", data.Link);
      });
      LinkDiv.appendChild(LinkContent);
  
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
    <!-- contain end -->
    <%@ include file="./F_chat.jsp" %>
    <footer></footer>
</body>
</html>

