package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Survey;


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

	int updateUserinfo(Member member);

	int updateUserPro(Member member);

	Member findPro(String mb_id);

	void surveyInsert(Survey survey);

	List<String> getrecommendMem(String mb_id);

	


	

	
	

	
	
}

