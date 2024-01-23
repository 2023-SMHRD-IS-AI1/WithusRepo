package kr.smhrd.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Comment;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.reviewBoard;
import kr.smhrd.mapper.BoardMapper;
import kr.smhrd.mapper.MemberMapper;

@Controller
public class BoardController {
   
	  private final BoardMapper boardMapper;
	    private final HttpSession httpSession;
	    
	    @Autowired
	    public BoardController(BoardMapper boardMapper, HttpSession httpSession) {
	        this.boardMapper = boardMapper;
	        this.httpSession = httpSession;
	    }
   

   // 모집 글 작성
   @RequestMapping("/boardWirte")
   public String boardWirte(Board board,HttpServletRequest request) {
      
     MultipartRequest multi = null;
     


     String savePath = "C:\\eGovFrame-4.0.0\\workspace.edu\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WithUs\\resources\\comp_img";

     System.out.println(savePath);
     int maxSize = 1024 * 1024 * 10 ; // 10MB
      String enc = "UTF-8";
      DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy(); 

      try {
	      multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
	      String mb_id = multi.getParameter("mb_id");
	      String mb_nick = multi.getParameter("mb_nick");
	      String mb_age = multi.getParameter("mb_age");
	      String comp_title = multi.getParameter("comp_title");
	      String comp_members = multi.getParameter("comp_members");
	      String comp_content = multi.getParameter("comp_content");
	      String comp_tourplace = multi.getParameter("comp_tourplace");
	      String comp_start = multi.getParameter("comp_start");
	      String comp_end = multi.getParameter("comp_end");
	      String comp_img =  multi.getFilesystemName("comp_img");
	      
	      board = new Board(null, mb_id, mb_nick, mb_age, comp_title, comp_members, comp_content, null, comp_tourplace, comp_start, comp_end, comp_img, null);
	      System.out.println(board.toString());
   
   } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
   }
     
      boardMapper.boardWirte(board);
      
      return "redirect:/goGroup";
   }
 

  

   // 모집 페이지 이동
   @RequestMapping("/goGroup")
   public String goGroup(Model model) {

     // 모집글 리스트 가져오기
      List<Board> boardList = boardMapper.getAllBoard();
      model.addAttribute("boardList", boardList);
      
      
      return "group";
   }

   
   // 리뷰 페이지 이동
   @RequestMapping("/goReview")
   public String goReview(Model model) {
      
      List<reviewBoard> reviewList = boardMapper.getAllReview();
      if (reviewList != null) {
         model.addAttribute("reviewList", reviewList);
      }
      
      
      return "review";
   }
      
   // 모집 상세로 이동
   @RequestMapping("/goGrcon")
   public String goGrcon(@RequestParam Long comp_idx, Model model) {
      
	     
       Board board = boardMapper.getCompByIndex(comp_idx);

       // 리뷰 세부 정보를 모델에 추가
       model.addAttribute("board", board);
	   
    // 리뷰에 대한 댓글 목록을 가져와 모델에 추가
       List<Comment> comments = boardMapper.getCommentsByCompIndex(comp_idx);
       board.setComments(comments);
       model.addAttribute("comments", comments);
	   
    // 현재 로그인한 사용자 정보를 모델에 추가
       Member loginMember = (Member) httpSession.getAttribute("loginMember");
       model.addAttribute("loginMember", loginMember);
	   
      return "gr_con";
   }
   

   
   


   
   
   
   // 리뷰 업로드 기능
   @RequestMapping("/Writereview")
   public String Writereview(reviewBoard board,HttpServletRequest request) {
      
      MultipartRequest multi = null;
   
      // MultipartRequest 객체 생성을 위한 매개변수 설정
      // 1. 요청객체(request)
      // 2. 파일을 저장할 경로(String)
      String savePath = "C:\\eGovFrame-4.0.0\\workspace.edu\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WithUs\\resources\\upload1";
      
      System.out.println(savePath);
      // 3. 파일의 용량 크기(int)
      int maxSize = 1024 * 1024 * 10 ; // 10MB
      // 4. 파일 이름에 대한 인코딩(String)
      String enc = "UTF-8";
      // 5. 파일 이름 중복제거(DefaultFileRenamePolicy) 
      DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy(); 
      
      try {
         multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
         String review_title = multi.getParameter("review_title");
         String review_content = multi.getParameter("review_content");
         String review_region = multi.getParameter("review_region");
         String mb_id = multi.getParameter("mb_id");
         String review_img =  multi.getFilesystemName("review_img");
      
         board = new reviewBoard(null, review_title, review_content, review_region, null, mb_id, review_img, null);
         System.out.println(board.toString());
         boardMapper.Writereview(board);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         System.out.println("리뷰 작성 실패");
      }
      
      
      
      return "redirect:/goReview";
   }
   
   
   // 모집 게시물 수정
   @PostMapping("/updateComp")
   public String updateComp(@ModelAttribute Board board, Model model) {
       try {
           // 유효성 검사: 리뷰 제목이 null이거나 빈 문자열인 경우 예외 발생
           if (board.getComp_title() == null || board.getComp_title().trim().isEmpty()) {
               throw new IllegalArgumentException("모집 제목은 필수 입력 항목입니다.");
           }

           // 리뷰 수정 메서드 호출
           boardMapper.updateComp(board);
           
           model.addAttribute("successMessage", "모집이 성공적으로 수정되었습니다.");

           // 수정된 리뷰의 상세 페이지로 리다이렉트
           return "redirect:/goGrcon?comp_idx=" + board.getComp_idx();
       } catch (Exception e) {
           // 예외가 발생한 경우, 오류 메시지와 함께 리뷰 수정 폼으로 이동
           model.addAttribute("error", "리뷰 수정 중 오류가 발생했습니다: " + e.getMessage());
           model.addAttribute("board", board); // 수정 폼에 이전에 입력한 데이터를 다시 보여주기 위해 모델에 추가
           
           // 오류 메시지를 출력해보세요
           e.printStackTrace();
           
           return "gr_con";
       }
   }
   
   
   // 모집 게시물 삭제
   @PostMapping("/deleteComp")
   public String deleteComp(@RequestParam Long comp_idx, HttpSession session) {
      
       Member loginMember = (Member) session.getAttribute("loginMember");
       System.out.println(comp_idx);
       Board board = boardMapper.getCompByIndex(comp_idx);
       
       boardMapper.deleteGrComment1(comp_idx);
       
       if (loginMember != null && (board == null || loginMember.getMb_id().equals(board.getMb_id()))) {
           boardMapper.deleteComp(comp_idx);
           return "redirect:/goGroup";
       } else {
    	   return "redirect:/goGrcon?comp_idx=" + board.getComp_idx(); 
       }
   }

   @PostMapping("/addGrComment")
   public String addGrComment(
          @RequestParam("commentContent") String commentContent,
          @RequestParam("comp_idx") Long comp_idx,
          HttpSession session) {
       Member loginMember = (Member) session.getAttribute("loginMember");
       if (loginMember != null) {
           Comment comment = new Comment();
           comment.setCmt_content(commentContent);
           comment.setMb_id(loginMember.getMb_id());
           comment.setComp_idx(comp_idx);  // comp_idx 설정

           // 디버깅을 위해 정보를 로그로 남깁니다.
           System.out.println("comp_idx: " + comp_idx);
           System.out.println("Comment: " + comment);

           // 댓글을 데이터베이스에 삽입합니다.
           boardMapper.addGrComment(comment);

           // 그룹 콘텐츠 페이지로 리다이렉트합니다.
           return "redirect:/goGrcon?comp_idx=" + comp_idx;
       } else {
           // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉트합니다.
           return "redirect:/login";
       }
   }
   
   @PostMapping("/updateGrComment")
   public String updateGrComment(
           @RequestParam Long cmt_idx,
           @RequestParam Long comp_idx,
           @RequestParam("updatedGrContent") String updatedGrContent,
           Model model) {
       // 댓글 수정 처리
       Member loginMember = (Member) httpSession.getAttribute("loginMember");

       if (loginMember != null) {
           Comment comment = boardMapper.getCommentById(cmt_idx);

           if (comment != null && loginMember.getMb_id().equals(comment.getMb_id())) {
               // 로그인한 사용자가 댓글 작성자인 경우에만 수정 처리
               comment.setCmt_content(updatedGrContent);
               boardMapper.updateComment(comment);

               // 수정 후 댓글 상세 페이지로 리다이렉트
               return "redirect:/goGrcon?comp_idx=" + comp_idx;
           }
       }

       // 수정에 실패하거나 권한이 없는 경우
       return "redirect:/login"; // 수정 실패 시 리다이렉트할 페이지 설정
   }
   
   
   @PostMapping("/deleteGrComment")
   public String deleteGrComment(@RequestParam Long cmt_idx, @RequestParam Long comp_idx, HttpSession session) {
       // Check if the logged-in user is the owner of the comment
       Member loginMember = (Member) session.getAttribute("loginMember");
       Comment comment = boardMapper.getCommentById(cmt_idx);

       if (loginMember != null && comment != null && loginMember.getMb_id().equals(comment.getMb_id())) {
           // If the logged-in user is the owner, proceed with deletion
           boardMapper.deleteGrComment(cmt_idx);

           // Redirect to the review detail page after deletion
           return "redirect:/goGrcon?comp_idx=" + comp_idx;
       } else {
           // If the user is not the owner or not logged in, handle accordingly
           return "redirect:/login"; // Redirect to the login page or another appropriate page
       }
   }
   

}