package kr.smhrd.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;
import kr.smhrd.entity.Calendar;
import kr.smhrd.entity.Member;
import kr.smhrd.mapper.CalendarMapper;

@RestController
@Controller
public class CalendarController {
   int beforeArraySize = 0;  
	
   @Autowired
   private CalendarMapper calMapper;
   
   private Calendar dto;
   
   // 캘린더 저장
   @RequestMapping(value="/calSave", method=RequestMethod.POST)
   public @ResponseBody String addEvent(@RequestBody String params, HttpSession session) {


      Calendar[] arr = new Gson().fromJson(params, Calendar[].class);
       
      for(int i=beforeArraySize; i<arr.length; i++) {  
          arr[i].setCal_start(arr[i].getCal_start().substring(0, arr[i].getCal_start().indexOf("T")));

          arr[i].setCal_end(arr[i].getCal_end().substring(0, arr[i].getCal_end().indexOf("T")));


           arr[i].setCal_end(arr[i].getCal_end().substring(0, arr[i].getCal_end().indexOf("T")));

          
          dto = arr[i];
          calMapper.insertCalendar(dto);
      }
      beforeArraySize = arr.length;
       return "Event added successfully!";
   }
   // 사용자 아이디를 기반으로 달력 데이터를 가져옴
   @GetMapping("/eventData")
   public @ResponseBody List<Calendar> getEventData(HttpSession session) {
	   
	   Member dto = (Member)session.getAttribute("loginMember");
	   
	   String mb_id = dto.getMb_id() ;
	   
	   List<Calendar> calendarData = calMapper.getCalendar(mb_id);
	   
	   beforeArraySize = calendarData.size();

       return calendarData;
   }
}
