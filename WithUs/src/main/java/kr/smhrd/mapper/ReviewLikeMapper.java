package kr.smhrd.mapper;

import kr.smhrd.entity.reviewLike;

public interface ReviewLikeMapper {
	
	// 리뷰 좋아요 추가하기
	void addReviewLike(reviewLike reviewlike);
	
	// 리뷰 좋아요 삭제하기
	void deleteReviewLike(reviewLike reviewlike);
	
	// 리뷰 좋아요 숫자 가져오기
	int countReviewLikes(int review_idx);

}
