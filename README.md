# :pushpin: WithUs
> 사용자 성향 조사 데이터를 활용한 혼행족을 겨냥한 여행 동행자 추천 서비스

</br>

## 1. 제작 기간 & 참여 인원
- 2024년 12월 18일 ~ 1월 24일
- 팀 프로젝트(총 4명)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 11
  - Spring
  - MySQL 5.1
  - Python 3.9
  - Apache Tomcat 8.5
  - Maven
  - WebSocket
  - FullCalendar API
  - KAKAO MAP API
    
#### `Front-end`
  - JavaScript
  - Html
  - Css

</br>

## 3. ERD 설계
![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/607e5b07-72e3-4bc6-a528-6882671912d2)


## 4. 핵심 기능
이 서비스의 핵심 기능은 설문조사, 동행자추천, 동행자모집, 실시간채팅, 캘린더 기능입니다.  
사용자는 회원가입시 설문조사 정보를 입력하여 동행자를 추천받을 수 있습니다.
동행자 모집을 통해 함께 여행 갈 동행자를 모집할 수 있고, 
해당 동행자와 실시간 채팅을 할 수 있으며 캘린더기능으로 개인일정을 관리할 수 있습니다.

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/815b3de6-7b10-4428-a112-d1ab4b12160e)


- **설문조사와 동행자 추천** :pushpin:[코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/10d01598-52e3-4eff-9fcf-13794a7b61b4
)
  - 600개 정도의 설문조사 데이터를 수집
  - 180개의 y데이터 사용한 후 6개의 라벨 값을 가지고 있는 머신러닝 머신에 학습
  - DB와 연결해 회원가입시 설문조사 결과를 DB에 저장
  - 파이썬에서 Polling 방식으로 5초마다 결과에 라벨값을 입혀 다시 DB에 저장
  - 다른 분류모델 보다 성능이 좋은 Knn모델 사용
  - 사용자는 본인과 라벨값이 똑같은 사용자가 추천 동행자에 보이게 됨

- **실시간 채팅** :pushpin: [코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/31226e87-0192-4046-8ae9-b7c0f27fe338)
 
  ![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/03f60ac4-c7ac-456b-8405-00f0eb07f08c)
- 채팅은 자바스크립트의 Web Socket기능 이용
- 사용자가 메세지를 입력, 전송하면 자바스크립트에서 샌드메세지 함수 사용하여 웹소켓 서버로 보냄
- Web Socket 서버는 메세지를 수신하고 붙어있는 분류번호를 이용해 알맞은 곳에 다시 메세지 보내줌
- 채팅방 번호를 붙여 경로에 방번호가 붙게 보낸뒤 서버에서 방번호를 수집
- 해당 방번호에 들어와있는 사람만 메세지를 받을 수 있게 함

- **캘린더** :pushpin: [코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/4cd9196b-0aa0-496a-8558-dca5dd9e6b44)

![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/b1ea1c1e-d3c7-4660-b5d1-3f8946a9f98b)
- FullCalendar API를 사용
- 비동기통신방식을 이용
- 일정을 등록하면 일정이 불러와져 화면에 보이게끔 함

- **지도(맛집)** :pushpin: [코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/02b926c9-5485-4c15-8866-d1a1f9bb2149)

![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/a4e02f85-67cf-492f-9483-40a68b0cd3e7)
- Kakao Map API를 사용
- JavaScript, Dom을 이용해서 마커를 표시
- 오버레이로 가게정보 화면에 보이게 함

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 팀장 최지호
- 프로필 사진을 변경하는 과정에서 사진이 resource내의 폴더로 제대로 들어가지 않는 상황이 발생하여 원인에 대해 분석해본 결과
상대경로로 입력시 DB로 사진의 이름값만 저장이 되고 폴더에 사진이 저장이 되지 않는다는 사실을 발견하여 사진을 저장할 절대경로를
만든 후 정상적으로 사진 업로드 기능 구현했으나 Git Hub로 Pull을 받은 후 다시 정상적으로 작동되지 않는 문제를 발견하여 에러 코드를
찍어본 결과 multipart/form-data는  Post 방식으로만 가져올 수 있는데 Get방식으로 바뀌어져 있다는 사실을 확인 후 수정하여 
원활한 프로젝트 진행을 할 수 있었습니다.

[개선된 코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/9fdd137d-62aa-49d0-9d62-9abd0e947c4d)

### 5.2 팀원 박가현
- 메세지를 하나 보내고나면 웹소켓이 계속 닫히는것을 확인할 수 있었습니다.
  코드 확인시, 채팅 서버 컨트롤러에 null을 반환하는 함수가 호출 돼있어서 null값 때문에 오류가 나니 웹소켓이 닫히는 것을 확인하였습니다.
  
[문제 코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/77085e1a-1193-4b12-8006-b4e5f178f416)

이를 지워서 해결하였습니다.

### 5.3 팀원 이진근
- 게시물 삭제 할때 댓글이 있으면 삭제가 안되었습니다.
  게시물 삭제하는 메서드에 댓글을 삭제하는 함수를 넣어서 해결했습니다.

[개선된 코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/d8443f70-3e52-4947-9442-ec45c2b19577)


### 5.2 팀원 임은영
-예로 캘린더에서 1.22~1.23일에 저장한 일정이 1.22일로만 잘려서 나오는 것을 확인하였습니다.
 이는 일정 불러오는 ajax부분에 시작 날짜, 종료날짜를 문자열로 받은 날짜를 Date 객체로 변환하여 해결하였습니다.

[개선된 코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/67817c8d-25fe-4dd4-9880-c255a78dbca7)

</br>

## 6. 팀원 소개
### 6.1 팀장 최지호
![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/16a66a65-baf0-4d9c-a56f-3ed50ca321f5)

### 6.2 팀원 이진근
![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/58251fb8-b464-4f2a-9260-04d7a6e5e1a1)

### 6.3 팀원 임은영
![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/1fd117d9-abd5-4f25-a2b1-fe05b1478ec5)

### 6.4 팀원 박가현
![image](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/806a7af5-13be-4988-aeaf-2ab9d29eceea)


</br>
