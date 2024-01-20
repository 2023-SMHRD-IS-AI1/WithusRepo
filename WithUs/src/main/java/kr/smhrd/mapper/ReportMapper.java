package kr.smhrd.mapper;

import kr.smhrd.entity.Report;

public interface ReportMapper {

	void insertReport(Report report);

	int getReportCount(String reportee);

}
