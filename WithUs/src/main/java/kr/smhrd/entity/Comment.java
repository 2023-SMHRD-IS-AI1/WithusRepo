package kr.smhrd.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private Long cmt_idx;
    private String cmt_content;
    private LocalDateTime created_at;
    private String mb_id;
    private Long review_idx;
    
   

    // created_at 필드에 대한 getter 메서드 추가
    public LocalDateTime getCreated_at() {
        return created_at;
    }

    // created_at 필드에 대한 setter 메서드 추가
    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }
    
    public Long getReview_idx() {
        return review_idx;
    }
    
    public String getCmt_content() {
        return cmt_content;
    }

    public void setCmt_content(String cmt_content) {
        this.cmt_content = cmt_content;
    }
   
}
