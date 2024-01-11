<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#buttons {
  width: 100%;
  height: 150px;
  display: flex;
  justify-content: center;
  align-items: center;
}



</style>

<body>
	<div id="buttons">
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group" >
          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="location.href='goGroup'"  />
          <label   class="btn btn-outline-primary" for="btnradio1">모집</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="location.href='goReview'"  />
          <label   class="btn btn-outline-primary" for="btnradio2">리뷰</label>

          <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" onclick="location.href='goMap'"  />
          <label class="btn btn-outline-primary" for="btnradio3">추천 맛집</label>
        </div>
      </div>
      
    
</body>
</html>