package kr.smhrd.mapper;

import kr.smhrd.entity.reviewLike;

public interface ReviewLikeMapper {


	void addReviewLike(reviewLike reviewlike);

	void deleteReviewLike(reviewLike reviewlike);

	int countReviewLikes(int review_idx);

}
