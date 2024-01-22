package kr.smhrd.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import kr.smhrd.entity.Report;
import kr.smhrd.mapper.ReportMapper;

@Controller
public class reportController {

	
	@Autowired
	private ReportMapper reportMapper;
	
	@RequestMapping("report")
    public ResponseEntity<Object> insertReport(@RequestBody Report report) {

		try {
	        reportMapper.insertReport(report);
	        int count = reportMapper.getReportCount(report.getReportee());
	        return ResponseEntity.ok(count);
	    } catch (DataIntegrityViolationException e) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("이미 신고한 회원입니다.");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("신고 처리 중 오류가 발생했습니다.");
	    }
    
	}
}