package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Survey {
	
	private String mb_id;
	@NonNull
	private int q1;
	@NonNull
	private int q2;
	@NonNull
	private int q3;
	@NonNull
	private int q4;
	@NonNull
	private int q5;
	
	
	
	
}
