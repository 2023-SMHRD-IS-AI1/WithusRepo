package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.MemberMapper;

// 비동기 방식만 처리해주는 controller

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	// Email 중복체크
	@RequestMapping("/emailCheck")
	// @ResponseBody 비동기방식 전용 컨틀롤러  일반컨트롤러일시에는 써줘줘야한다.
	public int emailCheck(@RequestParam("inputE") String inputE) {
		
		Member member = memberMapper.emailCheck(inputE);
		
		if(member != null) {
			// 사용 불가능한 이메일
			
			return 0;
		}
		else {
			// 사용 가능한 이메일
			
			return 1;
		}
		
	}
	
}
