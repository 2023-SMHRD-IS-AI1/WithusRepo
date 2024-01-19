package kr.smhrd.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.smhrd.entity.Calendar;
import kr.smhrd.entity.Member;





@Mapper
public interface CalendarMapper {
	

	public int insertCalendar(kr.smhrd.entity.Calendar calendar);

	 List<Calendar> getCalendar(String mb_id);
	
}
