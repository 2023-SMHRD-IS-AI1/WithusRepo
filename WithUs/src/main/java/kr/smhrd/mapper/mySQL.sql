select * from members;

select * from companions;

select * from reviews;

select * from calendars;

select * from companions;

select * from reviews;

select * from following;

select * from surveys;

select * from comments;

select * from reviewLike;

select * from reports;
commit;
delete from reports where report_idx<10;


ALTER TABLE members
MODIFY COLUMN mb_comment VARCHAR(300) DEFAULT '입력 안됨';



create table members(
	mb_id varchar(20) not null,
	mb_pw varchar(20) not null,
	mb_name varchar(50) not null,
	mb_nick varchar(20) not null,
	mb_birthdate date not null,
	mb_gender varchar(20) not null,
	mb_phone varchar(20) not null,
	mb_img varchar(800) not null,
	joined_at datetime default now(),
	mb_type varchar(10),
	mb_proimg varchar(300),
	mb_comment varchar(300) DEFAULT '입력 안됨',
	mb_mbti VARCHAR(50) default '입력 안됨',
	primary key(mb_id)
);


CREATE TABLE companions (
    comp_idx INT UNSIGNED NOT NULL AUTO_INCREMENT,
    mb_id VARCHAR(20) NOT NULL,
    mb_nick VARCHAR(20) NOT NULL,
    comp_title VARCHAR(1000) NOT NULL,
    comp_members INT NOT NULL,
    comp_content TEXT NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    comp_tourplace VARCHAR(50),
    comp_start datetime not null,
    comp_end datetime not null,
    comp_img varchar(2000),
    PRIMARY KEY(comp_idx),
    FOREIGN KEY(mb_id) REFERENCES members(mb_id)
);



CREATE TABLE comments (
    cmt_idx INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cmt_content TEXT NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    mb_id VARCHAR(20),
    review_idx INT UNSIGNED,
    PRIMARY KEY(cmt_idx),
    FOREIGN KEY(review_idx) REFERENCES reviews(review_idx)
);

create table surveys (
	survey_idx int unsigned not null auto_increment,
	mb_id varchar(20) not null,
	result_label varchar(100),
	q1 int(20) not null,
	q2 int(20) not null,
	q3 int(20) not null,
	q4 int(20) not null,
	q5 int(20) not null,
	processed int(10) default 0,
	PRIMARY KEY(survey_idx),
	FOREIGN KEY(mb_id) REFERENCES members(mb_id)
);


create table reviews (
	review_idx int unsigned not null auto_increment,
	review_title varchar(1500) not null,
	review_content text not null,
	review_region varchar(200) not null,
	reviewed_at datetime default now(),
	mb_id varchar(20) not null,
	review_img varchar(1500),
	PRIMARY KEY(review_idx),
	FOREIGN KEY(mb_id) REFERENCES members(mb_id)
);

create table hotspots(
	hsp_idx int unsigned not null auto_increment,
	hsp_region varchar(30) not null,
	hsp_name varchar(50) not null,
	hsp_addr varchar(1000) not null,
	lat decimal(17,14) not null,
	lng decimal(17,14) not null,
	hsp_tel varchar(20) not null,
	hsp_mainmenu varchar(2000) not null,
	hsp_img varchar(1000),
	primary key(hsp_idx)
);

create table chatrooms(
	room_idx int unsigned not null auto_increment,
	mb_id varchar(20) not null,
	room_title varchar(1000) not null,
	room_desc text not null,
	room_limit int not null,
	opened_at datetime default now(),
	room_status varchar(20) not null,
	primary key(room_idx),
	FOREIGN KEY(mb_id) REFERENCES members(mb_id)
);

create table chatting(
	chat_idx int unsigned not null auto_increment,
	room_idx int unsigned not null,
	chatter varchar(20) not null,
	chat text,
	chatted_at datetime default now(),
	primary key(chat_idx),
	FOREIGN KEY(chatter) REFERENCES members(mb_id),
	FOREIGN KEY(room_idx) REFERENCES chatrooms(room_idx)
);

create table following (
	following_idx int unsigned not null auto_increment,
	follower varchar(20) not null,
	followee varchar(20) not null,
	created_at datetime default now(),
	primary key(following_idx),
	FOREIGN KEY(follower) REFERENCES members(mb_id)
);

create table reports (
	report_idx int unsigned not null auto_increment,
	reporter varchar(20) not null,
	reportee varchar(20) not null,
	report_content varchar(300) not null,
	created_at datetime default now(),
	primary key(report_idx),
	FOREIGN KEY(reporter) REFERENCES members(mb_id)
);
-- 다중 신고 방지
ALTER TABLE reports ADD UNIQUE unique_report (reporter, reportee);


create table calendars (
	cal_idx int unsigned not null auto_increment,
	mb_id varchar(20) not null,
	cal_title varchar(1000) not null,
	cal_content text not null,
	cal_start varchar(100) not null,
	cal_end varchar(100) not null,
	cal_status varchar(20) not null,
	cal_color varchar(20),
	cal_important varchar(10),
	primary key(cal_idx),
	foreign key(mb_id) references members(mb_id)
);


create table applies(
	app_idx int unsigned not null auto_increment,
	mb_id varchar(20) not null,
	comp_idx int unsigned not null,
	created_at datetime default now(),
	app_status varchar(20) not null,
	primary key(app_idx),
	foreign key(comp_idx) references companions(comp_idx),
	FOREIGN KEY(mb_id) REFERENCES members(mb_id)
);

ALTER TABLE 테이블명 DROP COLUMN 컬럼명;

create table chat(
	
)

create table reviewLike(
	like_idx int unsigned not null auto_increment,
	review_idx int unsigned not null,
	mb_id varchar(20) not null,
	liked boolean,
	primary key(like_idx),
	FOREIGN KEY(mb_id) REFERENCES members(mb_id),
	FOREIGN KEY(review_idx) REFERENCES reviews(review_idx)
);
