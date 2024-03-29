package kh.com.job.business.model.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.job.business.model.dto.BsAnnounceDto;
import kh.com.job.business.model.dto.BsAplicantDto;
import kh.com.job.business.model.dto.BsAplicantListDto;
import kh.com.job.business.model.dto.BsAplicantRecruitDto;
import kh.com.job.business.model.dto.BsAppInfoDto;
import kh.com.job.business.model.dto.BsApplicantResumeDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;
import kh.com.job.common.page.PagingAplicantDto;
import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsUnivDto;

@Repository
public class BsApplicantDao {
	
	@Autowired
	private SqlSession sqlSession;
	

	public List<BsAplicantRecruitDto> recruitList(String userId) {
		return sqlSession.selectList("applicant.recruitList", userId);

	}

	public int insertInterview(InterviewDto dto) {
		return sqlSession.insert("applicant.insertInterview", dto);
	}

	public int aplicantAll(String userId) {
		return sqlSession.selectOne("applicant.aplicantAll", userId);
	}

	public List<BsAplicantDto> aplicantList(int raNum) {
		return null;
	}

	public List<InterviewDto> viewInterview(String userId) {
		return sqlSession.selectList("applicant.viewInterview", userId);
		}

	public List<BsRecruitDto> recruitTitle(String userId) {
		return sqlSession.selectList("applicant.recruitTitle", userId);
	}

	public int pageListCount(PagingAplicantDto pdto) {
		return sqlSession.selectOne("applicant.pageListCount", pdto);
	}

	public List<BsAplicantListDto> pageList(PagingAplicantDto pdto) {
		return sqlSession.selectList("applicant.pageList", pdto);
	}

	public BsApplicantResumeDto applicantResume(int resumeNo) {
		return sqlSession.selectOne("applicant.applicantResume", resumeNo);
	}

	public List<PsHschoolDto> highSelectList(int resumeNo) {
		return sqlSession.selectList("applicant.highSelectList", resumeNo);		
	}

	public List<PsUnivDto> uniSelectList(int resumeNo) {
		return sqlSession.selectList("applicant.uniSelectList", resumeNo);		
	}

	public List<PsGschoolDto> gradSelectList(int resumeNo) {
		return sqlSession.selectList("applicant.gradSelectList", resumeNo);		
	}

	public List<PsCareerDto> carSelectList(int resumeNo) {
		return sqlSession.selectList("applicant.carSelectList", resumeNo);		
	}

	public List<PsCertiDto> certiSelectList(int resumeNo) {
		return sqlSession.selectList("applicant.certiSelectList", resumeNo);		
	}

	public PsClDto clSelectOne(int resumeNo) {
		return sqlSession.selectOne("applicant.clSelectOne", resumeNo);
	}

	public BsAppInfoDto userInfo(String userId) {
		return sqlSession.selectOne("applicant.userInfo", userId);
	}

	public int resultInsert(BsAnnounceDto adto) {
		return sqlSession.insert("applicant.resultInsert", adto);
	}

	public int updateResultType(BsAnnounceDto adto) {
		return sqlSession.update("applicant.updateResultType", adto);
	}

	public BsAplicantDto reseltView(int baNum) {
		return sqlSession.selectOne("applicant.reseltView", baNum);
	}

	public int passPageListCount(PagingAplicantDto pdto) {
		return sqlSession.selectOne("applicant.passPageListCount", pdto);
	}

	public Object passPageList(PagingAplicantDto pdto) {
		return sqlSession.selectList("applicant.passPageList", pdto);
	}

	public int passCount(String userId) {
		return sqlSession.selectOne("applicant.passCount", userId);
	}

	public int failCount(String name) {
		return sqlSession.selectOne("applicant.failCount", name);
	}

	public int proceedCount(String name) {
		return sqlSession.selectOne("applicant.proceedCount", name);
	}

	public BsAnnounceDto announceView(BsAnnounceDto adto) {
		return sqlSession.selectOne("applicant.announceView", adto);
	}

	public int resultUpdate(BsAnnounceDto adto) {
		return sqlSession.update("applicant.resultUpdate", adto);
	}

	public int countInterviewList(InterviewDto dto) {
		return sqlSession.selectOne("applicant.countInterviewList", dto);
	}

	public List<InterviewDto> interviewList(InterviewDto dto) {
		return sqlSession.selectList("applicant.interviewList", dto);
	}


	

}
