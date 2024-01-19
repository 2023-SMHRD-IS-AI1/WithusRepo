package kr.smhrd.controller;

import java.io.IOException;
import java.time.LocalDateTime;
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

import kr.smhrd.entity.Board;
import kr.smhrd.entity.reviewBoard;
import kr.smhrd.mapper.BoardMapper;
import kr.smhrd.mapper.MemberMapper;

@Controller
public class BoardController {
   
   @Autowired
   private BoardMapper boardMapper;
   


   // 모집 글 작성
   @RequestMapping("/boardWirte")
   public String boardWirte(Board board,HttpServletRequest request) {
      
	  MultipartRequest multi = null;
	  
	  String savePath = "C:\\Users\\smhrd\\git\\WithusRepo\\WithUs\\src\\main\\webapp\\resources\\comp_img";
	  System.out.println(savePath);
	  int maxSize = 1024 * 1024 * 10 ; // 10MB
      String enc = "UTF-8";
      DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy(); 
	  
//      private String comp_idx;
//  	private String mb_id;
//  	private String mb_nick;
//  	private String mb_age;
//  	private String comp_title;
//  	private String comp_members;
//  	private String comp_content;
//  	private LocalDateTime created_at;
//  	private String comp_tourplace;
//  	private String comp_start;
//  	private String comp_end;
//  	private String comp_img;
      
      
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
		
		board = new Board(null, mb_id, mb_nick, mb_age, comp_title, comp_members, comp_content, null, comp_tourplace, comp_start, comp_end, comp_img);
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
		
   
   

	/*
	 * @RequestMapping("/goRecon") public String goRecon() {
	 * 
	 * return "re_con"; }
	 */
   

//   @RequestMapping("/Writereview")
//   public String Writereview(MultipartHttpServletRequest request, reviewBoard board) {
//       // 파일 처리
//       MultipartFile file = request.getFile("review_img"); 
//       
//       if (file != null && !file.isEmpty()) {
//           String originalFileName = file.getOriginalFilename();
//           String filePath = "   /resources/review_img/"; 
//
//           // 파일명 중복 방지 처리
//           String savedFileName = System.currentTimeMillis() + originalFileName;
//
//           // 파일 저장
//           try {
//               file.transferTo(new File(filePath + savedFileName));
//               board.setReview_img(savedFileName); // 파일 이름을 DB에 저장
//           } catch (IOException e) {
//               e.printStackTrace();
//               // 예외 처리
//           }
//       }
//
//       
//       boardMapper.Writereview(board);
//
//       return "redirect:/goReview";
//   }


   
   
//   // 리뷰 글 작성
//   @RequestMapping("/Writereview")
//   public String Writereview(reviewBoard board) {
//      
//      
//      
//      boardMapper.Writereview(board);
//      
//      return "redirect:/goReview";
//   }


   
   
   

   // 게시글 업로드 기능
//   @RequestMapping("/Writereview")
//   public String writereview(reviewBoard board,HttpServletRequest request) {
//      
//      MultipartRequest multi = null;
//      
//      // MultipartRequest 객체 생성을 위한 매개변수 설정
//      // 1. 요청객체(request)
//      // 2. 파일을 저장할 경로(String)
//      String savePath = "C:\\Users\\poa11\\git\\WithusRepo2\\WithUs\\src\\main\\webapp\\resources\\upload1";
//      System.out.println(savePath);
//      // 3. 파일의 용량 크기(int)
//      int maxSize = 1024 * 1024 * 10 ; // 10MB
//      // 4. 파일 이름에 대한 인코딩(String)
//      String enc = "UTF-8";
//      // 5. 파일 이름 중복제거(DefaultFileRenamePolicy) 
//      DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy(); 
//      
//      try {
//         multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
//         String review_title = multi.getParameter("review_title");
//         String review_content = multi.getParameter("review_content");
//         String review_region = multi.getParameter("review_region");
//         String mb_id = multi.getParameter("mb_id");
//         String review_img =  multi.getFilesystemName("review_img");
//      
//         board = new reviewBoard(null, review_title, review_content, review_region, null, mb_id, review_img);
//         System.out.println(board.toString());
//         boardMapper.Writereview(board);
//      } catch (IOException e) {
//         // TODO Auto-generated catch block
//         System.out.println("리뷰 작성 실패");
//      }
//      
//      
//      
//      return "review";
//   }
   
   
   
   
   // 게시글 업로드 기능
   @RequestMapping("/Writereview")
   public String Writereview(reviewBoard board,HttpServletRequest request) {
      
      MultipartRequest multi = null;
   
      // MultipartRequest 객체 생성을 위한 매개변수 설정
      // 1. 요청객체(request)
      // 2. 파일을 저장할 경로(String)
      String savePath = "C:\\Users\\smhrd\\git\\WithusRepo\\WithUs\\src\\main\\webapp\\resources\\upload1";
      
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
      
      
      
      return "review";
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
//		String savePath = request.getRealPath("resources/upload1");
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
//		return "review";
//	}




   
   

   
//   // boardDelete 게시글 삭제
//   @RequestMapping("/boardDelete") // boardContent?idx=
//   public String boardDeletet(@RequestParam("idx") int idx) {
//      
//      boardMapper.boardDelete(idx);
//      
//      
//      return "redirect:/goBoardMain";
//   }
//   
//   
//   // 게시글 상세보기 boardContent
//   @RequestMapping("/boardContent") // boardContent?idx=
//   public String boardContent(@RequestParam("idx") int idx,Model model) {
//      
//      // idx,title,writer,filename,content,b_date
//      Board board = boardMapper.boardContent(idx);
//      model.addAttribute("board",board);
//      
//      return "BoardDetail";
//   }
//   
//   
//   // BoardMain.jsp로 이동
//   @RequestMapping("/goBoardMain")
//   public String goBoardMain(Model model) {
//      // db에 있는값을 뿌려주는 코드 까지 써야 한다.
//      
//      List<Board> boardList = boardMapper.boardList();
////      System.out.println(boardList.size());
//      model.addAttribute("boardList",boardList);
//      
//      
//      return "BoardMain";
//   }
//   
//   // BoardWrite.jsp로 이동
//   @RequestMapping("/goBoardWrite")
//   public String goBoardWrite() {
//      
//      return "BoardWrite";
//   }
//   
//   // 게시글 업로드 기능
//   @RequestMapping("/BoardInsert")
//   public String BoardInsert(Board board,HttpServletRequest request) {
//      
//      MultipartRequest multi = null;
//      
//      // MultipartRequest 객체 생성을 위한 매개변수 설정
//      // 1. 요청객체(request)
//      // 2. 파일을 저장할 경로(String)
//      String savePath = request.getRealPath("./resources/upload");
//      System.out.println(savePath);
//      // 3. 파일의 용량 크기(int)
//      int maxSize = 1024 * 1024 * 10 ; // 10MB
//      // 4. 파일 이름에 대한 인코딩(String)
//      String enc = "UTF-8";
//      // 5. 파일 이름 중복제거(DefaultFileRenamePolicy) 
//      DefaultFileRenamePolicy dftrp = new DefaultFileRenamePolicy(); 
//      
//      try {
//         multi = new MultipartRequest(request, savePath, maxSize, enc, dftrp);
//         String title = multi.getParameter("title");
//         String writer = multi.getParameter("writer");
//         String filename =  multi.getFilesystemName("filename");
//         String content = multi.getParameter("content");
//      
//         board = new Board(title, writer, filename, content);
//         System.out.println(board.toString());
//      } catch (IOException e) {
//         // TODO Auto-generated catch block
//         e.printStackTrace();
//      }
//      
//      int cnt = boardMapper.insertBoard(board);
//      
//      if(cnt>0) {
//         System.out.println("게시글 업로드 성공");
//      }
//      else {
//         System.out.println("게시글 업로드 실패");
//      }
//      
//      return null;
//   }


}