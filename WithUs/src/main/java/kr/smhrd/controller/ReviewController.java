package kr.smhrd.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.reviewBoard;
import kr.smhrd.mapper.BoardMapper;

@Controller
public class ReviewController {

    private final BoardMapper boardMapper;

    // 생성자를 통한 의존성 주입
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
}


