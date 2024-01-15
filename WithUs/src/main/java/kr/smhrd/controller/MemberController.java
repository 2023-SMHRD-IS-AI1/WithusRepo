package kr.smhrd.controller;





import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.Member;
import kr.smhrd.entity.Message;
import kr.smhrd.entity.Survey;
import kr.smhrd.entity.reviewBoard;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.MessageMapper;

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
   
   @RequestMapping("goLogout")
   public String goLogout(HttpSession session) {
      session.removeAttribute("loginMember");

      return "Main";
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
      return "Follow";
   }
   
   @RequestMapping("/goUserproinfo")
   public String goUserproinfo() {
      return "Userproinfo";
   }
   
   @RequestMapping("/goUserinfo")
   public String goUserinfo() {
      return "Userinfo";
   }
   
   @RequestMapping("/goDaily")
   public String goDaily() {
      return "daily";
   }
   
   @RequestMapping("/updateUserinfo")
   public String updateUserinfo(Member member) {
	   
	    
	   memberMapper.updateUserinfo(member);
	   
	   return "Userinfo";
   }
   
   @RequestMapping("/updateProfil")
   public String updateProfil() {
	   
 
	   
	   return "Userproinfo";
   }
   
// 게시글 업로드 기능
//	@RequestMapping("/Writereview")
//	public String BoardInsert(reviewBoard board,HttpServletRequest request) {
//		
//		MultipartRequest multi = null;
//		
//		// MultipartRequest 객체 생성을 위한 매개변수 설정
//		// 1. 요청객체(request)
//		// 2. 파일을 저장할 경로(String)
//		String savePath = request.getRealPath("./resources/review_img");
//		System.out.println(savePath);
//		// 3. 파일의 용량 크기(int)
//		int maxSize = 1024 * 1024 * 10 ; // 10MB
//		// 4. 파일 이름에 대한 인코딩(String)
//		String enc = "UTF-8";
//		// 5. 파일 이름 중복제거(DefaultFileRenamePolicy) 
//		DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy(); 
//		
//		try {
//			multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
//			String review_title = multi.getParameter("review_title");
//			String review_content = multi.getParameter("review_content");
//			String review_region = multi.getParameter("review_region");
//			String mb_id = multi.getParameter("mb_id");
//			String review_img =  multi.getFilesystemName("review_img");
//		
//			board = new reviewBoard(null, review_title, review_content, review_region, null, mb_id, review_img);
//			System.out.println(board.toString());
//			boardMapper.Writereview(board);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			System.out.println("리뷰 작성 실패");
//		}
//		
//		
//		
//		return "goReview";
//	}
   
   
   
//   @RequestMapping("/goResult")
//   public String goResult(Member member, Model model) {
//      
//      memberMapper.memberInsert(member);
//      model.addAttribute("mb_id",member.getMb_id());
//      model.addAttribute("mb_nick", member.getMb_nick());
//      
//   
//      
//      return "result";
//   }
   
   @RequestMapping("/goResult")
   public String goResult(Member member, Model model) {
       memberMapper.memberInsert(member);
       model.addAttribute("mb_id", member.getMb_id());


       return "result";
   }
   
   
   

   @RequestMapping("/surveyInsert")
   public String surveyInsert(Survey survey) {
      System.out.println(survey.toString());
      
      
      
      return "Main";
   }
   
   // 로그인
   @RequestMapping("/memberSelect")
   public String memberSelect(Member member, HttpSession session) {
      Member loginMember = memberMapper.memberSelect(member);
      session.setAttribute("loginMember", loginMember);
      
      LocalDate currentDate = LocalDate.now();
      if(loginMember != null) {
         

       // Member 객체에서 생년월일 String을 LocalDate로 변환
       LocalDate birthDate = LocalDate.parse(loginMember.getMb_birthdate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

       int mb_age = Period.between(birthDate, currentDate).getYears(); // 나이 계산
       System.out.println(mb_age);
       session.setAttribute("mb_age", mb_age);
       return "Main";
      
      }else {
         return "Login";
         
      }
      
      
   }
   

   
   
   
      
   // 서울 지도 이동
   @RequestMapping("/goSeoul")
   public String goSeoul() {
      return "Seoul";
   }
   // 강릉 지도 이동
   @RequestMapping("/goGr")
   public String goGr() {
      return "Grmap";
   }
   // 제주 지도 이동
   @RequestMapping("goJj")
   public String goJj() {
      return "jjmap";
   }
   // 부산 지도 이동
   @RequestMapping("goBusan")
   public String goBusan() {
      return "busan";
   }
   
   
   @RequestMapping("/goGrwriter")
   public String goGrwriter() {
      return "gr_writer";
   }
   
   @RequestMapping("/goRewrite")
   public String goRewrite() {
      
      return "re_writer";
   }
   
}