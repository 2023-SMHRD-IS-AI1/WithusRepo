package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.smhrd.entity.Board;
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

	

//	public int insertBoard(Board board);
//
//	public List<Board> boardList();
//
//	public Board boardContent(int idx);
//
//	public int boardDelete(int idx);
	
	
	
	
	
	
}
