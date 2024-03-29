package kh.com.job.person.model.dto;

import java.sql.Timestamp;

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
public class PsScrapInfoDto {
	private String userId;
	private String companyName;
	private String raTitle;
	private String closeDate;
	private int raNum;
	private Timestamp insertDate;
	private String companyId;
	private int boardNo;
}
