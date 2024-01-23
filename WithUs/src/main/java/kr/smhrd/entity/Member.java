package kr.smhrd.entity;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Setter
@ToString

public class Member {

//	mb_id varchar(20) not null,
//	mb_pw varchar(20) not null,
//	mb_name varchar(50) not null,
//	mb_nick varchar(20) not null,
//	mb_birthdate date not null,
//	mb_gender char(1) not null,
//	mb_phone varchar(20) not null,
//	mb_img varchar(800) not null,
//	joined_at datetime default now(),
//	mb_type varchar(10),
	
	@NonNull
	private String mb_id;
	@NonNull
	private String mb_pw;
	@NonNull
	private String mb_name;
	@NonNull
	private String mb_nick;
	@NonNull
	private String mb_birthdate;
	@NonNull
	private String mb_gender;
	@NonNull
	private String mb_phone;
	@NonNull
	private String mb_img;
	private String joined_at;
	private String mb_type;
	private String mb_proimg;
	private String mb_comment;
	private String mb_mbti;
	
	
}
