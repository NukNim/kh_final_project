package kh.com.job.person.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.person.model.dao.PsResumeDao;
import kh.com.job.person.model.dto.PsResumeDto;

@Service
public class PsResumeServieImpl implements PsResumeService {
	
	@Autowired
	private PsResumeDao dao;

	@Override
	public PsResumeDto selectOne(String userid) throws Exception {
		return dao.selectOne(userid);
	}

	@Override
	public List<PsResumeDto> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public int insert(PsResumeDto dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(PsResumeDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(String userid) throws Exception {
		return dao.delete(userid);
	}

	
	
	
	
	

}