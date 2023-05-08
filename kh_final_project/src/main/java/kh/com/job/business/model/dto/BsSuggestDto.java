package kh.com.job.business.model.dto;

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
public class BsSuggestDto {
	
	private int sgNo;
	private int raNum;
	private int resumeNo;
	private String sgTitle;
	private String sgContent;
	private String psUser;
	private String bsUser;
	private String sendDate;
	
	private String companyName;
	

	//페이징처리
	private int startNum; 
	private int endNum; 
	private int pnum; 
	
	
	
	

}