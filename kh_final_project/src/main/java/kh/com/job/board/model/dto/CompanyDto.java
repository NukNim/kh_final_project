package kh.com.job.board.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CompanyDto {
	
	private String userId;
	private String userName;
	private String userEmail;
	private String bsMainPhone;
	private String addressRoad;
	private String addressJibun;
	private String addressDetail;
	private String addressPostcode;
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String categoryId;
	private String updateDate;
	private int boardRead;
	private int boardLike;
	private String tag;
	private String salaryAvg;
	private String employee;
	private String link;
	private String linkTitle;
	
	private int startNum;
	private int endNum;
	private int pnum;
}
