<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport"
	      content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link
					href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css"
					rel="stylesheet"/>
	<script
					src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
	<script
					src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
					crossorigin="anonymous"></script>
	<link
					href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
					rel="stylesheet"
					integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
					crossorigin="anonymous"/>
	<style>
      /* body 스타일 */
      html, body {
          overflow: hidden;
          font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
          font-size: 14px;
      }

      /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
      .fc-header-toolbar {
          padding-top: 1em;
          padding-left: 1em;
          padding-right: 1em;
      }

      .modal-content {
          height: 300px;
      }

      .m_b_f {
          position: relative;
          right: 180px;
      }

      #m_cont {
          position: relative;
          left: 90px;

      }

	</style>
</head>
<body>
<%@ include file="./nav.jsp" %>
<div id="calendar-container">
	<div id="calendar"></div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">일정 추가하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
				        aria-label="Close"></button>
			</div>
			<div class="modal-body" id="m_cont">

				일정이름 : <input type="text" id="title"/>
				<br/><br/>
				시작시간 : <input type="datetime-local" id="start"/>
				<br/><br/>
				종료시간 : <input type="datetime-local" id="end"/>
			</div>
			<div class="modal-footer">
				<div class="m_b_f">
					<button type="button" class="btn btn-secondary"
					        data-bs-dismiss="modal">취소
					</button>
					<button type="button" class="btn btn-primary" id="saveChanges">
						추가
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    var mb_id = "<%=loginMember.getMb_id()%>";

    let eventArray = [];

    (function () {
        $(function () {
            // calendar element 취득
            var calendarEl = $("#calendar")[0];
            // full-calendar 생성하기

            $.ajax({
                method: "GET",
                url: "eventData",
                success: function (res) {
                    for (let i = 0; i < res.length; i++) {
                        eventArray.push({
                            title: res[i].cal_title,
                            start: new Date(res[i].cal_start),
                            end: res[i].cal_end ? new Date(res[i].cal_end) : null
                        })
                    }
                    var calendar = new FullCalendar.Calendar(calendarEl, {
                        googleCalendarApiKey: "",
                        height: "700px", // calendar 높이 설정
                        expandRows: true, // 화면에 맞게 높이 재설정
                        slotMinTime: "08:00", // Day 캘린더에서 시작 시간
                        slotMaxTime: "20:00", // Day 캘린더에서 종료 시간
                        customButtons: {
                            myCustomButton: {
                                text: "일정 추가하기",
                                click: function () {
                                    //부트스트랩 모달 열기
                                    $("#exampleModal").modal("show");
                                },
                            },
                            mySaveButton: {
                                text: "저장하기",
                                click: async function () {
                                    if (confirm("저장하시겠습니까?")) {
                                        //지금까지 생성된 모든 이벤트 저장하기
                                        //이벤트 저장하기
                                        var allEvent = calendar.getEvents();
                                        var events = new Array();
                                        for (var i = 0; i < allEvent.length; i++) {
                                            var objt = new Object();
                                            objt.mb_id = mb_id;
                                            objt.cal_title = allEvent[i]._def.title;
                                            objt.cal_start = allEvent[i].start.toISOString();
                                            objt.cal_end = allEvent[i].end ? allEvent[i].end.toISOString() : null;
                                            events.push(objt);
                                        }
                                        $.ajax({
                                            url: "calSave",
                                            contentType: "application/json; charset=utf-8",
                                            data: JSON.stringify(events),
                                            type: "post",
                                            success: function (result) {
                                            },
                                            error: function () {
                                                alert("ajax 통신 실패");
                                            },
                                        });
                                    }
                                },
                            },
                        },
                        // 해더에 표시할 툴바
                        headerToolbar: {
                            left: "prev,next today,myCustomButton,mySaveButton",
                            center: "title",
                            right: "dayGridMonth,timeGridWeek,timeGridDay,listWeek",
                        },
                        initialView: "dayGridMonth", // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                        // initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
                        editable: true, // 수정 가능?
                        selectable: true, // 달력 일자 드래그 설정가능
                        nowIndicator: true, // 현재 시간 마크
                        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                        locale: "ko", // 한국어 설정
                        select: function (arg) {
                            // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                            var title = prompt("Event Title:");
                            if (title) {
                                calendar.addEvent({
                                    title: title,
                                    start: arg.start,
                                    end: arg.end,
                                    allDay: arg.allDay,
                                });
                            }
                            calendar.unselect();
                        },
                        //데이터 가져오는 이벤트
                        eventSources: [
                            {
                                events: eventArray,
                            },

                        ],
                    });

                    // 캘린더 랜더링
                    calendar.render();


                    //모달창 이벤트
                    $("#saveChanges").on("click", function () {
                        var eventData = {
                            title: $("#title").val(),
                            start: $("#start").val(),
                            end: $("#end").val(),
                            // color: $("#color").val(),
                        };


                        //빈값입력시 오류
                        if (
                            eventData.title == "" ||
                            eventData.start == "" ||
                            eventData.end == ""
                        ) {
                            alert("입력하지 않은 값이 있습니다.");

                            //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
                        } else if ($("#start").val() > $("#end").val()) {
                            alert("시간을 잘못입력 하셨습니다.");
                        } else {
                            // 이벤트 추가
                            calendar.addEvent(eventData);
                            $("#exampleModal").modal("hide");
                            $("#title").val("");
                            $("#start").val("");
                            $("#end").val("");
                            // $("#color").val("");
                        }
                    });

                },
                error: function (error) {
                    console.error("Error fetching event data:", error);
                    // 적절한 사용자 피드백 제공
                    alert(
                        "이벤트 데이터를 불러오는 데 실패했습니다. 관리자에게 문의하세요."
                    );
                },
            });


        });
    })();
</script>
</body>
</html>