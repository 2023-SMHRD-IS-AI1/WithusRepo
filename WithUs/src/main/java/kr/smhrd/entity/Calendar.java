package kr.smhrd.entity;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Calendar {
	int cal_idx; 
	String mb_id;
	String cal_title;
	String cal_content;
	String cal_start;
	String cal_end;
	String cal_status ;
	String cal_color;
	String cal_important;
	

}
