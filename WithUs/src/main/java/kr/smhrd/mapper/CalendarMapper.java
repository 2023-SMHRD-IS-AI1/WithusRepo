package kr.smhrd.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.smhrd.entity.Calendar;
import kr.smhrd.entity.Member;


@Mapper
public interface CalendarMapper {
	
	// 캘린더 정보 추가하기
	public int insertCalendar(kr.smhrd.entity.Calendar calendar);
	
	// 캘린더 목록 가져오기
	List<Calendar> getCalendar(String mb_id);
	
}
