package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Comment;
import kr.smhrd.entity.reviewBoard;

@Mapper
public interface BoardMapper {
	
	// 모집글 작성
	public void boardWirte(Board board);

	public void Writereview(reviewBoard board);

	public List<Board> getAllBoard();

	public List<reviewBoard> getAllReview();

	// 페이징을 위한 추가된 메서드
    List<reviewBoard> getAllReviewWithPagination(@Param("offset") int offset, @Param("size") int size);

    // 리뷰의 총 갯수를 가져오는 메서드
    int getReviewCount();
    
    // 페이징을 위한 추가된 메서드
    List<Board> getAllRecruitingWithPagination(@Param("offset") int offset, @Param("size") int size);

    // 모집 중인 사람들의 총 갯수를 가져오는 메서드
    int getRecruitingCount();
    
    // 게시물 상세 페이지
	public reviewBoard getReviewByIndex(Long review_idx);
	
	// 댓글 추가
	void addComment(Comment comment);
	
	List<Comment> getCommentsByReviewIndex(Long review_idx);

	public Comment getCommentById(Long cmt_idx);
	
	// 댓글 삭제
	public void deleteComment(@Param("cmt_idx") Long cmt_idx);
	
	// 댓글 수정
	public void updateComment(Comment comment);
	
	// 리뷰 게시물 삭제
	public void deleteReview(Long review_idx);

    // 리뷰 게시물 수정
    @Update("UPDATE reviews " +
            "SET review_title = #{review_title}, " +
            "    review_content = #{review_content}, " +
            "    review_region = #{review_region} " +
            "WHERE review_idx = #{review_idx}")
    void updateReview(reviewBoard review);

	
	// 리뷰 게시물 수정


	

//	public int insertBoard(Board board);
//
//	public List<Board> boardList();
//
//	public Board boardContent(int idx);
//
//	public int boardDelete(int idx);
	
	
	
	
	
	
}
