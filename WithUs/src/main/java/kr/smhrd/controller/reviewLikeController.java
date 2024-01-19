package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.reviewLike;
import kr.smhrd.mapper.ReviewLikeMapper;

@Controller
public class reviewLikeController {
	
	@Autowired
	private ReviewLikeMapper reviewLikeMapper;


	@RequestMapping("reviewLike/add")
	@ResponseBody
    public String addReviewLike(@RequestParam("review_idx") int review_idx, 
                                @RequestParam("mb_id") String mb_id) {
        // 좋아요 추가 로직
		reviewLike reviewlike = new reviewLike(review_idx,mb_id);

    	reviewLikeMapper.addReviewLike(reviewlike);
        return "success"; 
    }
	@RequestMapping("reviewLike/delete")
	@ResponseBody
    public String deleteReviewLike(@RequestParam("review_idx") int review_idx, 
                                   @RequestParam("mb_id") String mb_id) {
        // 좋아요 삭제 로직
		reviewLike reviewlike = new reviewLike(review_idx,mb_id);

    	reviewLikeMapper.deleteReviewLike(reviewlike);
    	return "success"; 
    }
	
	// 좋아요 개수 조회
	@RequestMapping("reviewLike/count")
	@ResponseBody
	public int countReviewLikes(@RequestParam("review_idx") int review_idx) {
	    int countLikes = reviewLikeMapper.countReviewLikes(review_idx);
	    System.out.println("좋아요 개수!!!!!!" + countLikes);
	    return countLikes;
	}
	
	
}
