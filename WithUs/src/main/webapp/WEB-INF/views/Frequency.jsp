<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BEST TOURPLACE</title>
    <style>
        .thumbnail-container1 {
            width: 90%;
            overflow: hidden;
            position: relative;
           right:35px;
            bottom:30px;
        }
        
        .thumbnail-container2 {
            width: 90%;
            overflow: hidden;
            position: relative;
           right:35px;
            bottom:30px;
        }

        #thumbnail-list {
            display: flex;
            animation: slide 20s linear infinite;
        }

        .thumbnail-item {
            flex: 0 0 auto;
            margin-right: 10px;
        }

        .thumbnail-item img {
            width: 350px;
            height: auto;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: default; /* Disable cursor pointer */
        }

        @keyframes slide {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-1500px); /* Adjust this value based on the total width of thumbnails */
            }
            
        }
        
        h3{
        
        	text-align: center;
        
        }
        
        p{
        
        text-align: center;
        
        }
        

     
        
        .c_foot{
        	position: relative;
        	top:35px;
        }
        
	
			#btn_box{
		
		position: relative;
		left: 10px;
	
	} 
	
		
	.btn_title{
	
		font-size: 40px;
		position: relative;
	 	bottom: 10px;
	 	 
		
		
	}
	
	
	#Freqcontain {
  max-width: 80%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  box-sizing: border-box;
  
}
	
	.thumbnail-container2{
	
		display: none;
	}
        
    </style>
</head>
<body>
		<!--  	<button onclick="culture()" >문화관광</button>
        	<button onclick="nature()" >자연관광</button> -->


<div id= "Freqcontain">
		 <div class="btn-group" role="group" aria-label="Basic outlined example">
  <button type="button" class="btn btn-outline-primary" onclick="culture()">문화관광</button>
  <button type="button" class="btn btn-outline-primary" onclick="nature()">자연관광</button>
</div>
<div class="thumbnail-container1">
		
		
		<h1 class = "btn_title">문화관광 베스트</h1>


    <div id="thumbnail-list">
    
        <div class="thumbnail-item">
            <img src="https://cdn.joongboo.com/news/photo/201709/1197605_1077218_4449.jpg" alt="Imag" alt="Thumbnail 1">
        	<h3>1.애버랜드</h3>
            <p>경기도 용인시 처인구 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://i.namu.wiki/i/N3HeYeRRnwQahmlYSLl4G3Sb0tq_ZwQMjdEViRy3ruU0tVZA48PKbz30mt3fiHV0r9DvMzo2EiZMj5EKleoqPQ.webp" alt="Imag" alt="Thumbnail 2">
        	 <h3>2.코엑스</h3>
             <p>서울 특별시 강남구 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://cdn.goyang1.com/news/photo/201807/6689_11301_1255.jpg" alt="Imag" alt="Thumbnail 3">
        	 <h3>3.킨텍스 제1 전시장</h3>
                                    <p>경기도 고양시 일산서구 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://mediahub.seoul.go.kr/uploads/mediahub/2022/02/RsdXerNqgMMbclULRSFYcICcSiUtZGMx.jpg" alt="Imag" alt="Thumbnail 4">
        	 <h3>4.여의도 한강공원</h3>
                                    <p>서울특별시 영등포구</p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202311/17/c74ac685-ad04-4ddb-a7a1-23cd337fa165.jpg" alt="Imag" alt="Thumbnail 5">
        	  <h3>5.롯데월드 잠실점</h3>
                                    <p>서울 특별시 송파구 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://i.namu.wiki/i/mfh3dqNR7RcdZjnevacLUTV6j29UYqkvHBkCjch2XjZGK45vZnoEuN7idv3A6-CbsMDlkzVBc4NueR8HnoRwEg.webp" alt="Imag" alt="Thumbnail 6">
        	 <h3>6.예술의 전당</h3>
                                    <p>서울 특별시 서초구 </p>
        </div>
        
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3-b-fCzZvFFCxAOBNqOoCXlzfveqLsEP8OA&usqp=CAU" alt="Imag" alt="Thumbnail 7">
        	  <h3>7.오이도 빨강등대</h3>
                                    <p>경기도 시홍시</p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://www.lafent.com/mono/data/news/img1/em200501007.jpg" alt="Imag" alt="Thumbnail 8">
        	   <h3>8.일산호수공원</h3>
                                    <p>경기도  고양시 일산동구</p>
        </div>
        
        <!-- Add more as needed -->
    </div>
    <p id="c_foot">2023년 문화관광 관련 검색량 기준</p>
</div>




<div class="thumbnail-container2">
		<h1 class = "btn_title">자연관광 베스트</h1>


    <div id="thumbnail-list">
    
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFDDZrSpti3dx3glwoyJRl1etKJe469UpzYQ&usqp=CAU" alt="Imag" alt="Thumbnail 1">
        	<h3>1.속초해변</h3>
            <p>강원특별자치도 속초시 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Zjh-7NwLPlo_XDz7n6nCsXq0lpO791ejEw&usqp=CAU" alt="Imag" alt="Thumbnail 2">
        	 <h3>2.광안리 해수욕장</h3>
             <p>부산광역시 수영구 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZuh3iMWrXuiHQUF4Wz_yXuC3g17aFL9n-rg&usqp=CAU" alt="Imag" alt="Thumbnail 3">
        	 <h3>3.월미도</h3>
                                    <p>인천광역시 중구 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYnuPtIjTMXa82K-GtN65WvBEe36EnFuA0zw&usqp=CAU" alt="Imag" alt="Thumbnail 4">
        	 <h3>4.송정해수욕장</h3>
                                    <p>부산광역시 해운대구</p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3ubH5kpqDWiAixrMDF9G_Fpdk60whOzy8ww&usqp=CAU" alt="Imag" alt="Thumbnail 5">
        	  <h3>5.궁평향</h3>
                                    <p>경기도 화성시 </p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZIUTPbF3-g4FJjnukLNH-CPoHvE0VKHzxdA&usqp=CAU" alt="Imag" alt="Thumbnail 6">
        	 <h3>6.해운대 해수욕장</h3>
                                    <p>부산광역시 해운대구 </p>
        </div>
        
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHXwzJBtMFOK62sYVJbEQ8y21DPgeT9ciojA&usqp=CAU" alt="Imag" alt="Thumbnail 7">
        	  <h3>7.동막 해수욕장</h3>
                                    <p>인천광역시 강화군</p>
        </div>
        
        <div class="thumbnail-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEYqfa5YMb9xzyS011OpT-AiXiy_3XrBf70Q&usqp=CAU" alt="Imag" alt="Thumbnail 8">
        	   <h3>8.대천해수욕장</h3>
                                    <p>충청남도 보령시</p>
        </div>
        
        <!-- Add more as needed -->
    </div>
    <p id="c_foot">2023년 자연관광 관련 검색량 기준</p>
</div>

</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>

 function culture() {
     $(".thumbnail-container1").show();
     $(".thumbnail-container2").hide();
     $("#c_foot").text("2023년 문화관광 관련 검색량 기준");
 }

 function nature() {
     $(".thumbnail-container1").hide();
     $(".thumbnail-container2").show();
     $("#c_foot").text("2023년 자연관광 관련 검색량 기준");
 }
    </script>

</body>
</html>
