package kr.smhrd.entity;

import lombok.Data;

@Data

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
	
	private String mb_id;
	private String comp_title;
	private String comp_members;
	private String comp_content;
	private String created_at;
	private String comp_tourplace;
	private String comp_start;
	private String comp_end;
	private String comp_img;
}
