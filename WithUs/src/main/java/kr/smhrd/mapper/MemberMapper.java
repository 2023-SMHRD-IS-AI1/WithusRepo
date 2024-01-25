package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.Survey;


@Mapper 
public interface MemberMapper {
	
	// 회원가입
	void memberInsert(Member member);
	
	// 로그인
	Member memberSelect(Member member);
	
	// 아이디 중복확인
	@Select("select * from members where mb_id=#{mb_id}")
	Member emailCheck(String inputE);
	
	// 닉네임 중복확인
	@Select("select * from members where mb_nick=#{mb_nick}")
	Member nickCheck(String inputN);
	
	// 개인정보 변경하기
	int updateUserinfo(Member member);
	
	// 개인 프로필 변경하기
	int updateUserPro(Member member);
	
	// 프로필 가져오기
	Member findPro(String mb_id);
	
	// 설문조사
	void surveyInsert(Survey survey);
	
	// 추천 회원 정보 가져오기
	List<String> getrecommendMem(String mb_id);

	


	

	
	

	
	
}

