package kh.com.job.person.model.dto;

import java.sql.Date;

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
public class PsHschoolDto {
	
	
//	H_EDU_NO NOT NULL NUMBER       
//	GED      NOT NULL VARCHAR2(1)  
//	H_NAME            VARCHAR2(60) 
//	H_DATE            TIMESTAMP(6) 
//	H_MAJOR           VARCHAR2(10) 

	
	private int hEduNo;
	private String ged;
	private String hName;
	private Date hDate;
	private String hMajor;
	
	
	
	// 졸업일자 미입력시 null값으로 들어가게 하기
	public void setHdate(Object hDate) {
		if(hDate.equals(""))
			this.hDate = null;
		this.hDate = (Date)hDate;
	}
	
	// 고등학교 미입력시 null값으로 들어가게 하기
		public void setHname(Object hName) {
			if(hName.equals(""))
				this.hName = null;
			this.hName = (String)hName;
		}

	// 전공계열 미입력시 null값으로 들어가게 하기
		public void setHmajor(Object hMajor) {
			if(hMajor.equals(""))
				this.hMajor = null;
			this.hMajor = (String)hMajor;
		}
	

}