package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.reviewBoard;

@Mapper
public interface BoardMapper {
	
	// 모집글 작성
	public void boardWirte(Board board);

	public void Writereview(reviewBoard board);

	

	

//	public int insertBoard(Board board);
//
//	public List<Board> boardList();
//
//	public Board boardContent(int idx);
//
//	public int boardDelete(int idx);
	
	
	
	
	
	
}
