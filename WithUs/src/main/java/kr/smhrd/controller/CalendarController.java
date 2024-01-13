package kr.smhrd.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspTagException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CalendarController {
	
	@Autowired
	private kr.smhrd.mapper.CalendarMapper mapper;
	

	@RequestMapping("/addEvent")
	public String addEvent(@RequestParam String title, @RequestParam String start, @RequestParam String end,
			@RequestParam String allDay) {
// 여기서 받은 데이터를 활용하여 필요한 로직 수행
// 예시로 받은 데이터를 CalendarEvent 객체로 묶어서 활용하는 경우:

		//System.out.println(title + "/" + start + "/" + end + "/" + allDay);
		

// 서비스나 DAO를 통해 이벤트 등록 등의 비즈니스 로직 수행

// 성공 또는 실패에 따라 적절한 응답 반환
		
		kr.smhrd.entity.Calendar ca = new kr.smhrd.entity.Calendar();
		ca.setCal_title(title);
		ca.setCal_start(start);
		ca.setCal_end(end);
		
		mapper.insertCalendar(ca);
		 
		 return "Event added successfully!";
	}
	
	

}
