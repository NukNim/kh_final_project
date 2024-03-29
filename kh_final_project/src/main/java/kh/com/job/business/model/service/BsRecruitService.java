package kh.com.job.business.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;
import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;

public interface BsRecruitService {

	public Object getCateList(String categoryType);

	public String uploadDocument(MultipartFile uploadReport, String userId);

	public int insertRecruit(BsRecruitDto dto);

	public List<BsRecruitDto> recruitProgress(String userId);

	public List<BsRecruitDto> recruitAdmission(String userId);
	
	public List<BsRecruitDto> recruitYAdmission();
	
	public List<BsRecruitDto> lCateRecruit(String categoryId);
	
	public List<AdCategoryDto> cateForSearch(String categoryType);
	
	
	public int countYAdmission();
	
	public int lCatecountYAdmission();
	
	public List<BsRecruitDto> searchList(Map<String, Object> keywords);

	public int changeAdmission(BsRecruitDto dto);

	public Paging recruitAll(PagingInfoDto pidto);

	public int updateRecruit(BsRecruitDto dto);

	public int deleteRecruit(BsRecruitDto dto);

	public List<BsRecruitDetailDto> recentRecruit();


}
