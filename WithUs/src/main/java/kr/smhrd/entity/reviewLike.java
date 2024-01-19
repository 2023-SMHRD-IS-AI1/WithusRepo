package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class reviewLike {
	
	private int like_idx;
	@NonNull
    private int review_idx;
	@NonNull
    private String mb_id;
    private boolean liked;
}
