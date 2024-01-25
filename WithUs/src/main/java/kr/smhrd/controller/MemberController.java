package kr.smhrd.controller;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.Member;

import kr.smhrd.entity.Survey;
import kr.smhrd.entity.reviewBoard;
import kr.smhrd.mapper.BoardMapper;
import kr.smhrd.mapper.MemberMapper;

import kr.smhrd.mapper.ReportMapper;

@Controller
public class MemberController {

   @Autowired 
   private MemberMapper memberMapper; 
   
   @Autowired
   private BoardMapper boardMapper;
   
   @Autowired
   private ReportMapper reportMapper;

   // 메인으로 이동
   @RequestMapping("/")
   public String main(Model model) {
	   List<reviewBoard> reviewList = boardMapper.getAllReview();
	   if (reviewList != null) {
	      model.addAttribute("reviewList", reviewList);
	   }
      return "Main";
   }
   
   // 메인으로 이동
   @RequestMapping("/goMain")

   public String goMain(Model model) {
	   List<reviewBoard> reviewList = boardMapper.getAllReview();
	   if (reviewList != null) {
	      model.addAttribute("reviewList", reviewList);
	   }
      return "Main";
   }
   
   // 로그인 화면으로 이동
   @RequestMapping("/goLogin")
   public String goLogin() {
      return "Login";
   }
   
  
   // 채팅으로 이동
   @RequestMapping("/goChat")
   public String goChat() {
      return "Chat";
   }
   
   // 회원가입화면으로 이동
   @RequestMapping("/goJoin")
   public String goJoin() {
      return "Join";
   }
   
   // 프로필 수정 화면으로 이동
   @RequestMapping("/goUserproinfo")
   public String goUserproinfo() {
      return "Userproinfo";
   }

   // 회원정보 수정 화면으로 이동
   @RequestMapping("/goUserinfo")
   public String goUserinfo() {
      return "Userinfo";
   }
   
   // 일정 화면으로 이동
   @RequestMapping("/goDaily")
   public String goDaily() {
      return "daily";
   }
   
   // 프로필 가져오기
   @RequestMapping("/getProfil")
   public String getProfil(@RequestParam("mb_id") String mb_id, @RequestParam("mb_age") String mb_age, HttpSession session) {

       Member memPro = memberMapper.findPro(mb_id); 
       session.setAttribute("memPro", memPro);
       session.setAttribute("mb_age", mb_age);

       return "redirect:/goProfil";
   }

   
   // 프로필 보기
   @RequestMapping("/goProfil")
   public String goProfil() {
	   
	   return "Profil";
   }
      
   // 개인정보 변경
   @RequestMapping("/updateUserinfo")
   public String updateUserinfo(Member member, HttpSession session) {
	   
	    
	   int cnt = memberMapper.updateUserinfo(member);
	   session.setAttribute("loginMember", member);
	   
	   if(cnt >0) {
		   System.out.println("개인정보 변경 성공");
	   }else {
		   System.out.println("개인정보 변경 실패");
	   }
	   
	   return "Userinfo";
   }
   
   // 프로필 변경
   @RequestMapping("/updateProfil")
   public String updateProfil(Member member, HttpServletRequest request, HttpSession session) {

	   
	    MultipartRequest multi = null;
		
		String savePath = "C:\\eGovFrame-4.0.0\\workspace.edu\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WithUs\\resources\\pro_img";
		int maxSize = 1024 * 1024 * 10 ;
		String enc = "UTF-8";
		DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy(); 
		
		try {
			multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
			String mb_id = multi.getParameter("mb_id");
			String mb_pw = multi.getParameter("mb_pw");
			String mb_name = multi.getParameter("mb_name");
			String mb_nick = multi.getParameter("mb_nick");
			String mb_birthdate = multi.getParameter("mb_birthdate");
			String mb_gender = multi.getParameter("mb_gender");
			String mb_phone = multi.getParameter("mb_phone");
			String mb_img = multi.getParameter("mb_img");
			String mb_proimg  =  multi.getFilesystemName("mb_proimg");
			String mb_comment = multi.getParameter("mb_comment");
			String mb_mbti = multi.getParameter("mb_mbti");
			
			member = new Member(mb_id, mb_pw, mb_name, mb_nick, mb_birthdate, mb_gender, mb_phone, mb_img, null, null, mb_proimg, mb_comment,mb_mbti);
			
			System.out.println(member);
			
		} catch (IOException e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
			
		} 
	   System.out.println(member.toString());
	   int cnt = memberMapper.updateUserPro(member);
	   
	   Member loginMember = memberMapper.findPro(member.getMb_id());
	   session.setAttribute("loginMember", loginMember);
	   return "Userproinfo";

   }

   
   // 회원가입
   @RequestMapping("/goResult")
   public String goResult(Member member, HttpSession session) {
       memberMapper.memberInsert(member);
       
       session.setAttribute("mb_id", member.getMb_id());


       return "result";
   }
   
   
   // 설문조사 
   @RequestMapping("/surveyInsert")
   public String surveyInsert(Survey survey) {
	  
	  memberMapper.surveyInsert(survey);
      
      
      return "Main";
   }
   
   // 로그인
   @RequestMapping("/memberSelect")
   public String memberSelect(Member member, HttpSession session, Model model) {
      Member loginMember = memberMapper.memberSelect(member);
      
      session.setAttribute("loginMember", loginMember);
      
      
      
      LocalDate currentDate = LocalDate.now();
      if(loginMember != null) {
    	 
       // Member 객체에서 생년월일 String을 LocalDate로 변환
       LocalDate birthDate = LocalDate.parse(loginMember.getMb_birthdate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

       int mb_age = Period.between(birthDate, currentDate).getYears(); // 나이 계산
       
       // 신고 횟수 확인
       int reportCount = reportMapper.getReportCount(loginMember.getMb_id());
       if (reportCount >= 5) {
    	   session.setAttribute("reportWarning", "경고 5회 누적으로 사용에 제한이 되었습니다.");
           return "restricted"; 
          
       }else if(reportCount >= 3) {
    	   // 경고 메시지 세션에 저장
           session.setAttribute("reportWarning", "신고가 3회가 되셨습니다 신고가 5회 누적될 시 이용에 제한이 있을 수 있습니다.");
       }
    	   
       
       
       // 리뷰 목록 가져오기
       List<reviewBoard> reviewList = boardMapper.getAllReview();
       if (reviewList != null) {
           model.addAttribute("reviewList", reviewList);
       }
     
       // 추천 회원 가져오기
       String mb_id = loginMember.getMb_id();
       List<String> recommendMem = memberMapper.getrecommendMem(mb_id);
 	   
       List<Integer> ageList = new ArrayList<Integer>();
 	   List<Member> profiles = new ArrayList<Member>();
 	   for(int i = 0; i <recommendMem.size(); i++) {
 		   Member profile = memberMapper.findPro(recommendMem.get(i));
 		   
 		   LocalDate proBirthDate = LocalDate.parse(profile.getMb_birthdate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
 		   int proMb_age = Period.between(proBirthDate, currentDate).getYears(); // 나이 계산
 		   
 		   ageList.add(proMb_age);
 		   profiles.add(profile);
 		   session.setAttribute("profiles", profiles);
 		   session.setAttribute("ageList", ageList);
 		   System.out.println(profiles);
 		   
 	   }
       session.setAttribute("mb_age", mb_age);
       return "Main";
      
      }else {
         return "redirect:/goLogin";
         
      }
      
      
   }
   
   // 로그아웃
   @RequestMapping("goLogout")
   public String goLogout(HttpSession session) {
      session.removeAttribute("loginMember");
      session.removeAttribute("profiles");
      session.removeAttribute("ageList");
      
      return "Main";
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
   
   // 게시글 작성으로 이동
   @RequestMapping("/goGrwriter")
   public String goGrwriter() {
      return "gr_writer";
   }
   
   // 리뷰 작성으로 이동
   @RequestMapping("/goRewrite")
   public String goRewrite() {
      
      return "re_writer";
   }
   
   
				   
}