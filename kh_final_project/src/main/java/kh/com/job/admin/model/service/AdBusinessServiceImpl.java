package kh.com.job.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.job.admin.model.dao.AdBusinessDao;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;

@Service
public class AdBusinessServiceImpl implements AdBusinessService {
	
	@Autowired
	private AdBusinessDao dao;

	@Override
	public List<BsRecruitDto> recruitAllList() {
		return dao.recruitAllList();
	}


	@Override
	public Paging pageList(String search, int pnum) {
		//게시글이 표시될 개 수
		int pageLimit = 10;
		//페이지가 표시될 개 수
		int listLimit = 5;
		
		//총 게시글 개수
		int count = dao.pageListCount(search);
		
		//페이지 검색 조건을 위한 dto
		PagingInfoDto pdto = new PagingInfoDto();
		//나타날 페이지의 첫번 째 글의 ra_num
		pdto.setStartNum((pnum -1)*pageLimit +1);
		//나타날 페이지의 마지막 글의 ra_num
		pdto.setEndNum(pnum * pageLimit);
		//검색어 조건
		pdto.setSearch(search);
		
		int mod = count % pageLimit ==0? 0 : 1;
		int pageCount = count/pageLimit + mod;
		
		//new Paging(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자 (<,1,2,3,4,5,> 여기서는 5))
		Paging list = new Paging(dao.pageList(pdto), pnum, pageCount);
		//만약 게시글이 표시될 개수와 페이지를 표시할 개수를 바꾸고 싶으면  new Paging
		//(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자, int 게시글이 표시될 개 수, listLimit)
		//로 생성한다.
		
		return list;
	}


	@Override
	public BsRecruitDetailDto viewDetail(String raNum) {
		return dao.viewDetail(raNum);
	}


	@Override
	public BsUserDto userDetail(String userId) {
		return dao.userDetail(userId);
	}


	@Override
	public int admissChange(Map<String, String> map) {
		
		return dao.admissChange(map);
	}

}
