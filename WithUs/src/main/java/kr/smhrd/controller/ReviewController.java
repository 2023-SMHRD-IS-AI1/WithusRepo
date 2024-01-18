package kr.smhrd.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;


import kr.smhrd.entity.Member;
import kr.smhrd.entity.reviewBoard;
import kr.smhrd.mapper.BoardMapper;

@Controller
public class ReviewController {

    private final BoardMapper boardMapper;
   

    // 생성자를 통한 의존성 주입
    @Autowired
    public ReviewController(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
        
    }

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
    
    @GetMapping("/goRecon")
    public String goRecon(@RequestParam Long review_idx, Model model) {
        // review_idx를 사용하여 특정 리뷰의 세부 정보를 가져옴
        reviewBoard review = boardMapper.getReviewByIndex(review_idx);

        // 리뷰 세부 정보를 모델에 추가
        model.addAttribute("review", review);
        model.addAttribute("review_img", review.getReview_img()); // 필드명을 실제 Review 클래스의 필드명으로 수정
        model.addAttribute("review_title", review.getReview_title());
        model.addAttribute("review_region", review.getReview_region());
        model.addAttribute("reviewed_at", review.getReview_region());
        model.addAttribute("review_content", review.getReview_content());
        


        return "re_con"; // "re_con"이라는 뷰를 사용하여 리뷰 세부 정보를 표시합니다.
    }
    

   
    @GetMapping("/goRewrmodify")
	public String goRewrmodify() {
 


        return "re_wr_modify"; 
    }
   
}
  
    



