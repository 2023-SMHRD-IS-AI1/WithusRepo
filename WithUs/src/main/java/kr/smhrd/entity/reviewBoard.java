package kr.smhrd.entity;



import lombok.Data;

@Data

public class reviewBoard {
	
//	create table reviews (
//			review_idx int unsigned not null auto_increment,
//			review_title varchar(1500) not null,
//			review_content text not null,
//			reviewed_at datetime default now(),
//			mb_id varchar(20) not null,
//			review_img varchar(1500),
//			PRIMARY KEY(review_idx),
//			FOREIGN KEY(mb_id) REFERENCES members(mb_id)
//		);
	

	private String review_title;
	private String review_content;
	private String review_region;
	private String reviewed_at;
	private String mb_id;
	private String review_img;

	
	
	
}
