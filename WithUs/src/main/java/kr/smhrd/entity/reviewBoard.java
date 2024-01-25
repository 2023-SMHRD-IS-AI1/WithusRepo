package kr.smhrd.entity;



import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class reviewBoard {

    public reviewBoard() {
    }

	private Long review_idx;
	private String review_title;
	private String review_content;
	private String review_region;
	private LocalDateTime reviewed_at;
	private String mb_id;
	private String review_img;


    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    
    
   
    
	
}
