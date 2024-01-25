package kr.smhrd.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.smhrd.entity.Board;
import kr.smhrd.mapper.BoardMapper;
import java.util.List;

@Controller
public class BoardgroupController {

    private final BoardMapper boardMapper;

    // 생성자를 통한 의존성 주입
    public BoardgroupController(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @GetMapping("/goGroup")
    public String goGroup(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "6") int size,
            Model model) {

        // 모집 중인 사람들만 가져오기
        List<Board> boardList = boardMapper.getAllRecruitingWithPagination(page * size, size);

        // 총 모집 중인 사람 수
        int totalRecords = boardMapper.getRecruitingCount();

        // 전체 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        // 현재 페이지 및 전체 페이지 수 모델에 추가
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        // 모집 중인 사람들 목록 모델에 추가
        model.addAttribute("boardList", boardList);

        return "group";
    }
}

