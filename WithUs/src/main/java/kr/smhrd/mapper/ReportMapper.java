package kr.smhrd.mapper;

import kr.smhrd.entity.Report;

public interface ReportMapper {
	
	// 신고하기
	void insertReport(Report report);
	
	// 신고 횟수 가져오기
	int getReportCount(String reportee);

}
