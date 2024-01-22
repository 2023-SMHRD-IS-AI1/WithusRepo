package kr.smhrd.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	
	private int report_idx;
    private String reporter;
    private String reportee;
    private String report_content;
    private LocalDateTime created_at;

}
