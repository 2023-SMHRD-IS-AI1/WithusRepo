package kr.smhrd.controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.smhrd.entity.Comment;
import kr.smhrd.entity.Member;
import kr.smhrd.entity.reviewBoard;
import kr.smhrd.mapper.BoardMapper;

@Controller
public class ReviewController {

    private final BoardMapper boardMapper;
    private final HttpSession httpSession;
    
    @Autowired
    public ReviewController(BoardMapper boardMapper, HttpSession httpSession) {
        this.boardMapper = boardMapper;
        this.httpSession = httpSession;
    }
    // 리뷰글 가져오기
    @GetMapping("/goReview")
    public String goReview(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            Model model) {

        // 리뷰 목록 가져오기
        int offset = page * size;
        List<reviewBoard> reviewList = boardMapper.getAllReviewWithPagination(offset, size);

        // 리뷰의 총 갯수
        int totalRecords = boardMapper.getReviewCount();

        // 전체 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        // 현재 페이지 및 전체 페이지 수 모델에 추가
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        // 리뷰 목록 모델에 추가
        model.addAttribute("reviewList", reviewList);

        return "review";
    }
    
    // 리뷰 수정
    @PostMapping("/updateReview")
    public String updateReview(@ModelAttribute reviewBoard review, Model model) {
        try {
            if (review.getReview_title() == null || review.getReview_title().trim().isEmpty()) {
                throw new IllegalArgumentException("리뷰 제목은 필수 입력 항목입니다.");
            }

            // 리뷰 수정 메서드 호출
            boardMapper.updateReview(review);

            // 수정된 리뷰의 상세 페이지로 리다이렉트
            return "redirect:/goRecon?review_idx=" + review.getReview_idx();
        } catch (Exception e) {
            model.addAttribute("error", "리뷰 수정 중 오류가 발생했습니다: " + e.getMessage());
            model.addAttribute("review", review);
            return "goRecon";
        }
    }



    

    // 리뷰 상세로 이동
    @GetMapping("/goRecon")
    public String goRecon(@RequestParam Long review_idx, Model model) {
        // review_idx를 사용하여 특정 리뷰의 세부 정보를 가져옴
        reviewBoard review = boardMapper.getReviewByIndex(review_idx);

        // 리뷰 세부 정보를 모델에 추가
        model.addAttribute("review", review);

        // 리뷰에 대한 댓글 목록을 가져와 모델에 추가
        List<Comment> comments = boardMapper.getCommentsByReviewIndex(review_idx);
        review.setComments(comments);
        model.addAttribute("comments", comments);

        // 현재 로그인한 사용자 정보를 모델에 추가
        Member loginMember = (Member) httpSession.getAttribute("loginMember");
        model.addAttribute("loginMember", loginMember);

        return "re_con";
    }
    
  
    // 댓글 추가
    @PostMapping("/addComment")
    public String addComment(
            @RequestParam("commentContent") String commentContent,
            @RequestParam("review_idx") Long review_idx,
            HttpSession session) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember != null) {
            Comment comment = new Comment();
            // 'cmt_idx' 관련 부분 삭제
            comment.setCmt_content(commentContent);
            comment.setMb_id(loginMember.getMb_id());
            comment.setReview_idx(review_idx);
            // 데이터베이스에 댓글을 저장하기 위해 매퍼 메서드 호출
            boardMapper.addComment(comment);

            // 리뷰 상세 페이지로 리다이렉트
            return "redirect:/goRecon?review_idx=" + review_idx; // 수정된 부분: 올바른 리뷰 인덱스로 리다이렉트
        } else {
            // 사용자가 로그인하지 않은 경우 처리
            return "redirect:/login";
        }
    }
    
    // 리뷰 댓글 삭제
    @PostMapping("/deleteComment")
    public String deleteComment(@RequestParam Long cmt_idx, @RequestParam Long review_idx, HttpSession session) {

        Member loginMember = (Member) session.getAttribute("loginMember");
        Comment comment = boardMapper.getCommentById(cmt_idx);

        if (loginMember != null && comment != null && loginMember.getMb_id().equals(comment.getMb_id())) {
            boardMapper.deleteComment(cmt_idx);

          
            return "redirect:/goRecon?review_idx=" + review_idx;
        } else {
            
            return "redirect:/login"; 
        }
    }
    
   
    
 // 리뷰게시물 삭제
    @PostMapping("/deleteReview")
    public String deleteReview(@RequestParam Long review_idx, HttpSession session) {
       
        Member loginMember = (Member) session.getAttribute("loginMember");
        reviewBoard review = boardMapper.getReviewByIndex(review_idx);
        boardMapper.deleteComment2(review_idx);
        boardMapper.deleteReviewLike(review_idx);
        
        
        if (loginMember != null && (review == null || loginMember.getMb_id().equals(review.getMb_id()))) {
            boardMapper.deleteReview(review_idx);
            
            return "redirect:/goReview";
        } else {
            return "redirect:/goRecon?review_idx=" + review_idx; 
        }
    }
    // 리뷰 댓글 수정
    @PostMapping("/updateComment")
    public String updateComment(
            @RequestParam Long cmt_idx,
            @RequestParam Long review_idx,
            @RequestParam("updatedContent") String updatedContent,
            Model model) {
        // 댓글 수정 처리
        Member loginMember = (Member) httpSession.getAttribute("loginMember");

        if (loginMember != null) {
            Comment comment = boardMapper.getCommentById(cmt_idx);

            if (comment != null && loginMember.getMb_id().equals(comment.getMb_id())) {
                // 로그인한 사용자가 댓글 작성자인 경우에만 수정 처리
                comment.setCmt_content(updatedContent);
                boardMapper.updateComment(comment);

                return "redirect:/goRecon?review_idx=" + review_idx;
            }
        }
        // 수정에 실패하거나 권한이 없는 경우
        return "redirect:/login"; 
    }
}
  
    



