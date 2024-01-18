package kr.smhrd.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.smhrd.entity.Calendar;
import kr.smhrd.entity.Member;
import kr.smhrd.mapper.CalendarMapper;
import kr.smhrd.mapper.MemberMapper;

@Controller
public class CalendarController {
   
   @Autowired
   private CalendarMapper calMapper;
   
   
   private Calendar dto;
   
   @Autowired
   private MemberMapper memberMapper;
   
   
   
   @RequestMapping(value="/calSave", method=RequestMethod.POST)
   public @ResponseBody String addEvent(@RequestBody String params) {

      System.out.println(params);
   
      Calendar[] arr = new Gson().fromJson(params, Calendar[].class);
      
      
      // System.out.println(arr[0].toString());    
      for(int i=0; i<arr.length; i++) {
         
         System.out.println("문자열 잘랐어요 : " + arr[i].getCal_start().substring(0, arr[i].getCal_start().indexOf("T")));
          arr[i].setCal_start(arr[i].getCal_start().substring(0, arr[i].getCal_start().indexOf("T")));
            System.out.println(arr[i].getCal_start());
           arr[i].setCal_end(arr[i].getCal_end().substring(0, arr[i].getCal_end().indexOf("T")));
          System.out.println(arr[i].getCal_end());
          dto = arr[i];
          calMapper.insertCalendar(dto);
         
//         calMapper.insertCalendar(arr[i]);
      }
 
      
     
      System.out.println(dto.getCal_title());
      System.out.println(dto.getCal_start());
      System.out.println(dto.getCal_end());
     
      
    
       return "Event added successfully!";
   }
	/*
	 * @RequestMapping(value="/eventData", method=RequestMethod.POST)
	 * 
	 * @ResponseBody public List<Calendar> getEventData(Member member, HttpSession
	 * session){ Member loginMember = memberMapper.memberSelect(member);
	 * List<Calendar> eventList = new ArrayList<Calendar>();
	 * 
	 * if(loginMember != null) { List<Calendar> eventsFromDatabase =
	 * calMapper.calendar(loginMember.getMb_id()); } return "daily"; }
	 */
   }
