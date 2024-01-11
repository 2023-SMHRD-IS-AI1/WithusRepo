package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Member;

// 결국은 MemberMapper라는 클래스도 Spring Container로 올라가게됨
// mapper파일임을 알려줘야함
@Mapper // 어떤 패키지에 있는 mapper파일을 읽을건지?? -> root-context.xml
public interface MemberMapper {

	static void insertMember(Member member) {
		// TODO Auto-generated method stub
		
	} // 틀, SqlSessionFactoryBean이 MemberMapper를 implement 해서 사용

	
	
}

