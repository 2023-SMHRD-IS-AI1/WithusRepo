package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import kr.smhrd.entity.Member;

import kr.smhrd.mapper.MemberMapper;


// POJO를 찾기위해 @(어노테이션)으로 Controller라고 명시해야 함
// 어떤 패키지에서 Controller를 찾을 건지 servlet-context.xml 파일에도 명시해야 함
@Controller
public class MemberController {

	// class 안에 있는 메소드를 쓰려면 '객체생성' 필요함, interface는 객체생성도 안됨 -> but 스프링에서는 생성하는게 아니라 주입받아서 씀
	@Autowired // 스프링 컨테이너에 객체가 생성되어 올라간 boardMapper 객체를 주입받아 사용하겠다
	private MemberMapper memberMapper; // DAO같은 역할인데 DAO는 커넥션 관리까지 다했다면
	
	// @RequestMapping : get방식,post방식 요청을 다 받을 수 있음
	// @GetMapping : get방식 요청만 받을 수 있음
	// @PostMapping : post방식 요청만 받을 수 있음
	
	
	@RequestMapping("/")
	public String main() {
		return "Main";
	}
	
	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "Login";
	}
	
	
	@RequestMapping("/goChat")
	public String goChat() {
		return "Chat";
	}
	@RequestMapping("/goJoin")
	public String goJoin() {
		return "Join";
	}

	
	
	@RequestMapping("/goProfil")
	public String goProfil() {
		return "Profil";
	}
	
	@RequestMapping("/goFollow")
	public String goFollow() {
		return "Profil";
	}
	

	
	
	
}
