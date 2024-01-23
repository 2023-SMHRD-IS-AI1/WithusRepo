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
//
//	// 모집 댓글 삭제
//	public void grdeleteComment(@Param("cmt_idx") Long cmt_idx);
//
	// 댓글 수정
	public void updateComment(Comment comment);
//
//	// 모집 댓글 수정
//	public void grupdateComment(Comment comment);
//
	// 리뷰 게시물 삭제
	public void deleteReview(Long review_idx);

	// 리뷰 게시물 수정
	void updateReview(reviewBoard review);
//
//	// 모집 게시물 수정
//	public void updateBoard(Board board);
//
//	//
//	public Board getCompByIndex(Long comp_idx);
//
//	public List<Comment> getCommentsByBoardIndex(Long comp_idx);
	
	// 모집 번호 게시판 
	public Board getCompByIndex(Long comp_idx);
	
	// 모집 수정
	public void updateComp(Board board);
	
	// 모집 삭제
	public void deleteComp(Long comp_idx);

	public void addGrComment(Comment comment);



	public List<Comment> getCommentsByCompIndex(Long comp_idx);

	public void deleteGrComment(Long cmt_idx);

	public void deleteComment2(Long review_idx);

	public void deleteGrComment1(Long comp_idx);

	public void deleteReviewLike(Long review_idx);



//	public int insertBoard(Board board);
//
//	public List<Board> boardList();
//
//	public Board boardContent(int idx);
//
//	public int boardDelete(int idx);

}
