package kh.com.job.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.business.model.dao.BsApplicantDao;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.InterviewDto;

@Service
public class BsApplicantServiceImpl implements BsApplicantService {
	
	@Autowired
	private BsApplicantDao dao;

	@Override
	public List<InterviewDto> interviewList(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BsRecruitDto> recruitList(String userId) {
		return dao.recruitList(userId);
	}
	
	


}
