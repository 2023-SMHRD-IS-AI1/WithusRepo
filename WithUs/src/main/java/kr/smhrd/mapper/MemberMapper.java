package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Member;


// 결국은 MemberMapper라는 클래스도 Spring Container로 올라가게됨
// mapper파일임을 알려줘야함
@Mapper // 어떤 패키지에 있는 mapper파일을 읽을건지?? -> root-context.xml
public interface MemberMapper {

	void memberInsert(Member member);

	Member memberSelect(Member member);
	
	@Select("select * from members where mb_id=#{mb_id}")
	Member emailCheck(String inputE);
	
	@Select("select * from members where mb_nick=#{mb_nick}")
	Member nickCheck(String inputN);


	

	
	

	
	
}

