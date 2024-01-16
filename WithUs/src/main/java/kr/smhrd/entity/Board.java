package kr.smhrd.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class Board {
	
//	CREATE TABLE companions (
//		    comp_idx INT UNSIGNED NOT NULL AUTO_INCREMENT,
//		    mb_id VARCHAR(20) NOT NULL,
//		    comp_title VARCHAR(1000) NOT NULL,
//		    comp_content TEXT NOT NULL,
//		    created_at DATETIME DEFAULT NOW(),
//		    comp_tourplace VARCHAR(50),
//		    comp_start datetime not null,
//		    comp_end datetime not null,
//		    PRIMARY KEY(comp_idx),
//		    FOREIGN KEY(mb_id) REFERENCES members(mb_id)
//		);
	
	
	public Board(Object comp_idx2, String mb_id2, String mb_nick2, String comp_title2, Object comp_title3,
			String comp_members2, String comp_content2, Object created_at2, String comp_tourplace2, String comp_start2,
			String comp_end2, String comp_img2) {
		// TODO Auto-generated constructor stub
	}
	private Long comp_idx;
	private String mb_id;
	private String mb_nick;
	private String mb_age;
	private String comp_title;
	private int comp_members;
	private String comp_content;
	private LocalDateTime created_at;
	private String comp_tourplace;
	private LocalDateTime comp_start;
	private LocalDateTime comp_end;
	private String comp_img;
}
