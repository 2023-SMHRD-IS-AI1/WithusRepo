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
  코드 확인시, 채팅 서버 컨트롤러에 null을 반환하는 함수가 호출 돼있어서 null값 때문에 오류가 나니 웹소켓이 닫히는 것을 확인하여
  이를 지워서 해결하였습니다.

[개선된 코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/77085e1a-1193-4b12-8006-b4e5f178f416)


### 5.3 팀원 이진근
- 게시물 삭제 할때 댓글이 있으면 삭제가 안되었습니다.
  게시물 삭제하는 메서드에 댓글을 삭제하는 함수를 넣어서 해결했습니다.

[개선된 코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/d8443f70-3e52-4947-9442-ec45c2b19577)
)

### 5.2 팀원 임은영
-예로 캘린더에서 1.22~1.23일에 저장한 일정이 1.22일로만 잘려서 나오는 것을 확인하였습니다
 이는 일정 불러오는 ajax부분에 시작 날짜, 종료날짜를 문자열로 받은 날짜를 Date 객체로 변환하여 해결하였습니다

[개선된 코드 확인](https://github.com/2023-SMHRD-IS-AI1/WithusRepo/assets/153056455/67817c8d-25fe-4dd4-9880-c255a78dbca7)

</br>

## 6. 그 외 트러블 슈팅
<details>
<summary>npm run dev 실행 오류</summary>
<div markdown="1">

- Webpack-dev-server 버전을 3.0.0으로 다운그레이드로 해결
- `$ npm install —save-dev webpack-dev-server@3.0.0`

</div>
</details>

<details>
<summary>vue-devtools 크롬익스텐션 인식 오류 문제</summary>
<div markdown="1">
  
  - main.js 파일에 `Vue.config.devtools = true` 추가로 해결
  - [https://github.com/vuejs/vue-devtools/issues/190](https://github.com/vuejs/vue-devtools/issues/190)
  
</div>
</details>

<details>
<summary>ElementUI input 박스에서 `v-on:keyup.enter="메소드명"`이 정상 작동 안하는 문제</summary>
<div markdown="1">
  
  - `v-on:keyup.enter.native=""` 와 같이 .native 추가로 해결
  
</div>
</details>

<details>
<summary> Post 목록 출력시에 Member 객체 출력 에러 </summary>
<div markdown="1">
  
  - 에러 메세지(500에러)
    - No serializer found for class org.hibernate.proxy.pojo.javassist.JavassistLazyInitializer and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationConfig.SerializationFeature.FAIL_ON_EMPTY_BEANS)
  - 해결
    - Post 엔티티에 @ManyToOne 연관관계 매핑을 LAZY 옵션에서 기본(EAGER)옵션으로 수정
  
</div>
</details>
    
<details>
<summary> 프로젝트를 git init으로 생성 후 발생하는 npm run dev/build 오류 문제 </summary>
<div markdown="1">
  
  ```jsx
    $ npm run dev
    npm ERR! path C:\Users\integer\IdeaProjects\pilot\package.json
    npm ERR! code ENOENT
    npm ERR! errno -4058
    npm ERR! syscall open
    npm ERR! enoent ENOENT: no such file or directory, open 'C:\Users\integer\IdeaProjects\pilot\package.json'
    npm ERR! enoent This is related to npm not being able to find a file.
    npm ERR! enoent

    npm ERR! A complete log of this run can be found in:
    npm ERR!     C:\Users\integer\AppData\Roaming\npm-cache\_logs\2019-02-25T01_23_19_131Z-debug.log
  ```
  
  - 단순히 npm run dev/build 명령을 입력한 경로가 문제였다.
   
</div>
</details>    

<details>
<summary> 태그 선택후 등록하기 누를 때 `object references an unsaved transient instance - save the transient instance before flushing` 오류</summary>
<div markdown="1">
  
  - Post 엔티티의 @ManyToMany에 영속성 전이(cascade=CascadeType.ALL) 추가
    - JPA에서 Entity를 저장할 때 연관된 모든 Entity는 영속상태여야 한다.
    - CascadeType.PERSIST 옵션으로 부모와 자식 Enitity를 한 번에 영속화할 수 있다.
    - 참고
        - [https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218](https://stackoverflow.com/questions/2302802/object-references-an-unsaved-transient-instance-save-the-transient-instance-be/10680218)
   
</div>
</details>    

<details>
<summary> JSON: Infinite recursion (StackOverflowError)</summary>
<div markdown="1">
  
  - @JsonIgnoreProperties 사용으로 해결
    - 참고
        - [http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html](http://springquay.blogspot.com/2016/01/new-approach-to-solve-json-recursive.html)
        - [https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue](https://stackoverflow.com/questions/3325387/infinite-recursion-with-jackson-json-and-hibernate-jpa-issue)
        
</div>
</details>  
    
<details>
<summary> H2 접속문제</summary>
<div markdown="1">
  
  - H2의 JDBC URL이 jdbc:h2:~/test 으로 되어있으면 jdbc:h2:mem:testdb 으로 변경해서 접속해야 한다.
        
</div>
</details> 
    
<details>
<summary> 컨텐츠수정 모달창에서 태그 셀렉트박스 드랍다운이 뒤쪽에 보이는 문제</summary>
<div markdown="1">
  
   - ElementUI의 Global Config에 옵션 추가하면 해결
     - main.js 파일에 `Vue.us(ElementUI, { zIndex: 9999 });` 옵션 추가(9999 이하면 안됌)
   - 참고
     - [https://element.eleme.io/#/en-US/component/quickstart#global-config](https://element.eleme.io/#/en-US/component/quickstart#global-config)
        
</div>
</details> 

<details>
<summary> HTTP delete Request시 개발자도구의 XHR(XMLHttpRequest )에서 delete요청이 2번씩 찍히는 이유</summary>
<div markdown="1">
  
  - When you try to send a XMLHttpRequest to a different domain than the page is hosted, you are violating the same-origin policy. However, this situation became somewhat common, many technics are introduced. CORS is one of them.

        In short, server that you are sending the DELETE request allows cross domain requests. In the process, there should be a **preflight** call and that is the **HTTP OPTION** call.

        So, you are having two responses for the **OPTION** and **DELETE** call.

        see [MDN page for CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS).

    - 출처 : [https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o](https://stackoverflow.com/questions/35808655/why-do-i-get-back-2-responses-of-200-and-204-when-using-an-ajax-call-to-delete-o)
        
</div>
</details> 

<details>
<summary> 이미지 파싱 시 og:image 경로가 달라서 제대로 파싱이 안되는 경우</summary>
<div markdown="1">
  
  - UserAgent 설정으로 해결
        - [https://www.javacodeexamples.com/jsoup-set-user-agent-example/760](https://www.javacodeexamples.com/jsoup-set-user-agent-example/760)
        - [http://www.useragentstring.com/](http://www.useragentstring.com/)
        
</div>
</details> 
    
<details>
<summary> 구글 로그인으로 로그인한 사용자의 정보를 가져오는 방법이 스프링 2.0대 버전에서 달라진 것</summary>
<div markdown="1">
  
  - 1.5대 버전에서는 Controller의 인자로 Principal을 넘기면 principal.getName(0에서 바로 꺼내서 쓸 수 있었는데, 2.0대 버전에서는 principal.getName()의 경우 principal 객체.toString()을 반환한다.
    - 1.5대 버전에서 principal을 사용하는 경우
    - 아래와 같이 사용했다면,

    ```jsx
    @RequestMapping("/sso/user")
    @SuppressWarnings("unchecked")
    public Map<String, String> user(Principal principal) {
        if (principal != null) {
            OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) principal;
            Authentication authentication = oAuth2Authentication.getUserAuthentication();
            Map<String, String> details = new LinkedHashMap<>();
            details = (Map<String, String>) authentication.getDetails();
            logger.info("details = " + details);  // id, email, name, link etc.
            Map<String, String> map = new LinkedHashMap<>();
            map.put("email", details.get("email"));
            return map;
        }
        return null;
    }
    ```

    - 2.0대 버전에서는
    - 아래와 같이 principal 객체의 내용을 꺼내 쓸 수 있다.

    ```jsx
    UsernamePasswordAuthenticationToken token =
                    (UsernamePasswordAuthenticationToken) SecurityContextHolder
                            .getContext().getAuthentication();
            Map<String, Object> map = (Map<String, Object>) token.getPrincipal();

            String email = String.valueOf(map.get("email"));
            post.setMember(memberRepository.findByEmail(email));
    ```
        
</div>
</details> 
    
<details>
<summary> 랭킹 동점자 처리 문제</summary>
<div markdown="1">
  
  - PageRequest의 Sort부분에서 properties를 "rankPoint"를 주고 "likeCnt"를 줘서 댓글수보다 좋아요수가 우선순위 갖도록 설정.
  - 좋아요 수도 똑같다면..........
        
</div>
</details> 
    
</br>

## 6. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
