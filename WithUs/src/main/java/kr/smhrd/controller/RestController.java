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
	
	// Email 중복 체크
		@Autowired
		private MemberMapper memberMapper;

		@RequestMapping("/emailCheck")
		@ResponseBody
		public int emailCheck(@RequestParam("inputE") String inputE) {
			
			Member member = memberMapper.emailCheck(inputE);
			
			if(member != null) {
				// 사용 불가능한 이메일
				return 0;
			}else {
				// 사용 가능한 이메일
				return 1;
			}
			
		}
		
		@RequestMapping("/nickCheck")
		@ResponseBody
		public int nickCheck(@RequestParam("inputN") String inputN) {
			
			System.out.println(inputN);
			Member member = memberMapper.nickCheck(inputN);
			
			if(member != null) {
				// 사용 불가능한 닉네임
				return 0;
			}else {
				// 사용 가능한 닉네임
				return 1;
			}
			
		}
	
	
	
}
