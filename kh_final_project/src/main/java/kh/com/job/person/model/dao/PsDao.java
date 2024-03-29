package kh.com.job.person.model.dao;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kh.com.job.board.model.dto.CompanyDto;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsSuggestDto;
import kh.com.job.person.model.dto.PsApplyDto;
import kh.com.job.person.model.dto.PsScrapInfoDto;
import kh.com.job.person.model.dto.PsUserDto;

@Repository
public class PsDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 회원 정보 읽어오기 
	public PsUserDto selectOne(String userId) throws Exception {
	    PsUserDto user = sqlSession.selectOne("person.selectOne", userId);

	    user.setUserBirth(parseDate(user.getUserBirth()));
	    user.setUserCreatedAt(parseDate(user.getUserCreatedAt()));
	    user.setUserLastLogin(parseDate(user.getUserLastLogin()));

	    return user;
	}

	private String parseDate(String dateString) {
	    if (dateString != null) {
	        LocalDate date = LocalDate.parse(dateString.split(" ")[0]);
	        return date.toString();
	    }
	    return null;
	}

		
	
	// 카카오 로그인 
	public PsUserDto selectUserEmail(String userEmail) throws Exception {
		return sqlSession.selectOne("person.selectUserEmail", userEmail);
	}
	
	// 아이디 중복 체크 
	public int idChk(String userId) throws Exception {
		int result = sqlSession.selectOne("person.idChk", userId);
		return result;
	}
	
	public int emailChk(String email) throws Exception {
		return sqlSession.selectOne("person.emailChk", email);
	}
	
	public List<PsUserDto> selectList() throws Exception {
		return sqlSession.selectList("person.selectList");
	}
	
	// 회원 가입 
	public int insert(PsUserDto dto) throws Exception {
		int result = -1;
		result = sqlSession.insert("person.insert", dto);
		return result;
	}
	
	// 회원 탈퇴
	public int delete(String userId)  throws Exception {
		return sqlSession.delete("person.delete", userId);
	}
	
	// 회원 정보 수정
	public int update(PsUserDto dto)  throws Exception {
		return sqlSession.update("person.update", dto);
	}
	
	// 회원 사진
	public int userPic(PsUserDto dto) throws Exception {
		return sqlSession.update("person.userPic", dto);
	}
	
	// 아이디 찾기
	public PsUserDto findId(Map<String, Object> findId)  throws Exception {
			return sqlSession.selectOne("person.findId", findId);
	}
	
	// 비밀번호 찾기 
	public PsUserDto findPw(Map<String, Object> findPw) throws Exception {
		return sqlSession.selectOne("person.findPw", findPw);
	}
	//기업 회원가입
	public int businessInsert(PsUserDto dto) {
		return sqlSession.insert("person.businessInsert", dto);
	}
	
	// 공고 스크랩 확인
	public int checkScrap(Map<String, Object> InfoNo) throws Exception {
		int result = sqlSession.selectOne("person.checkScrap", InfoNo);
		return result;
	}

	// 공고 스크랩하기
	public int scrapJob(Map<String, Object> InfoNo) throws Exception{
		return sqlSession.insert("person.scrapJob",InfoNo);
	}
	
	// 공고 스크랩 삭제
	public int deleteJob(Map<String, Object> InfoNo) throws Exception{
		return sqlSession.delete("person.deleteJob",InfoNo);
	}
	
	
	// 스크랩한 공고 조회
	public List<PsScrapInfoDto> selectListScrap(String userId) throws Exception {
	    List<PsScrapInfoDto> scrapList = sqlSession.selectList("person.selectListScrap", userId);
	    DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    for (PsScrapInfoDto scrapInfo : scrapList) {
	        String closedateStr = scrapInfo.getCloseDate();
	        LocalDate closedate;
	        if (closedateStr.length() == 8) { 
	            closedateStr = "20" + closedateStr;
	            closedate = LocalDate.parse(closedateStr, outputFormat);
	        } else { 
	            closedate = LocalDate.parse(closedateStr, inputFormat);
	        }
	        String formattedDate = closedate.format(outputFormat);
	        scrapInfo.setCloseDate(formattedDate);
	    }
	    return scrapList;
	}


	
	// 입사지원
	public int applyJob(BsAplicantDto dto) throws Exception {
		return sqlSession.insert("person.applyJob", dto);
	}
	
	// 입사지원 조회
	public List<PsApplyDto> selectListApply(String userId) throws Exception {
		return sqlSession.selectList("person.selectListApply", userId);
	}
	
	// 입사지원 취소
	public int cancelApply(Map<String, Object> InfoNo) throws Exception{
		return sqlSession.delete("person.cancelApply",InfoNo);
	}
	
	// 입사지원 체크
	public int checkApply(Map<String, Object> InfoNo) throws Exception {
		int result = sqlSession.selectOne("person.checkApply", InfoNo);
		return result;
	}
	
	// 마지막 로그인
	public int updateLoginRecord(String userId) throws Exception {
		return sqlSession.update("person.updateLoginRecord", userId);
	}
	
	// 기업 스크랩 확인
	public int checkComScrap(Map<String, Object> InfoNo) throws Exception {
		int result = sqlSession.selectOne("person.checkComScrap", InfoNo);
		return result;
	}

	// 관심기업 스크랩하기
	public int scrapCompany(Map<String, Object> InfoNo) throws Exception{
		return sqlSession.insert("person.scrapCompany",InfoNo);
	}
	
	// 관심기업 스크랩 삭제
	public int deleteCompany(Map<String, Object> InfoNo) throws Exception{
		return sqlSession.delete("person.deleteCompany",InfoNo);
	}
	
	// 관심기업 조회
	public List<PsScrapInfoDto> selectListCom(String userId) throws Exception {
		return sqlSession.selectList("person.selectListCom", userId);
	}

	public int countpsSuggest(BsSuggestDto dto) {
		return sqlSession.selectOne("suggest.countpsSuggest", dto);
	}

	public List<BsSuggestDto> psSuggestList(BsSuggestDto dto) {
		return sqlSession.selectList("suggest.psSuggestList",dto);
	}
	
	@Transactional
	public int interviewAccept(BsSuggestDto dto) {
		int result = sqlSession.insert("suggest.interviewAccept",dto);
	    int result2 = updateAccept(dto);   //sqlSession.update("suggest.updateAccept",dto);
	    return result;
	}
	   
	public int updateAccept(BsSuggestDto dto) {
		return sqlSession.update("suggest.updateAccept",dto);
	}

	public BsSuggestDto viewSuggest(int sgNo) {
		return sqlSession.selectOne("suggest.viewSuggest",sgNo);
	}

	public CompanyDto suggestCompanyInfo(String bsUser) {
		return sqlSession.selectOne("suggest.suggestCompanyInfo",bsUser);
	}


}
