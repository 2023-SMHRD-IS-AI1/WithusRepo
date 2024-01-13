package kr.smhrd.mapper;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;





@Mapper
public interface CalendarMapper {
	

	public int insertCalendar(kr.smhrd.entity.Calendar calendar);

	
}
