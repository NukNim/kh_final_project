package kh.com.job.business.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.admin.model.dto.AdCategoryDto;
import kh.com.job.business.model.dao.BsAccountDao;
import kh.com.job.business.model.dao.BsRecruitDao;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;


import kh.com.job.common.page.Paging;
import kh.com.job.common.page.PagingInfoDto;

@Service
public class BsRecruitServiceImpl implements BsRecruitService{
	
	private static final Logger logger = LoggerFactory.getLogger(BsRecruitServiceImpl.class);
	
	@Autowired
	private BsAccountDao account;
	
	@Autowired
	private BsRecruitDao dao;
	
	@Value("${gcs.projectId}")
    private String projectId;
	
	@Value("${gcs.bucketName}")
	private String bucketName;

	@Override
	public Object getCateList(String categoryType) {
		return dao.getCateList(categoryType);
	}
	
	//구글클라우드 -채용공고 이력서 파일 파일 형식 업로드 기능 구분 	
	@Override
	public String uploadDocument(MultipartFile uploadReport, String userId) {
		logger.info("^^^^^^^^^^^^^^1"+ projectId);
		logger.info("^^^^^^^^^^^^^^1"+ bucketName);
		//버켓 폴더 작업 추가해야됨
		try {
			logger.info("^^^^^^^^^^^^^2");
			
			Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
			logger.info("^^^^^^^^^^^^^3"+storage);
			String fileName = UUID.randomUUID().toString();
			System.out.println("^^^^^^^^^^^^^4");
			String extension = FilenameUtils.getExtension(uploadReport.getOriginalFilename());
			System.out.println("^^^^^^^^^^^^^5");
			
			//경로에 해당하는 폴더 명이 없을 때 자동으로 구글클라우드 스토리지에서 생성해 줌
			System.out.println("#################");
			String fullName = userId + "/"+ "document" + "/"+ fileName + "." + extension;
			
			logger.info("################6"+fullName);
			
			BlobInfo blobInfo = BlobInfo.newBuilder(bucketName, fullName).build();
			logger.info("################7"+blobInfo);
			logger.info("################7-1"+blobInfo.getMediaLink());
			storage.create(blobInfo, uploadReport.getBytes());
			
			logger.info("################8"+fullName);
			
			return "https://storage.googleapis.com/" + bucketName + "/" + fullName;
				
			} catch (IOException e) {
				logger.info("%%***********에러***********%%");
				 throw new RuntimeException(e);
			}
		
	}
	//채용공고 작성
	@Override
	public int insertRecruit(BsRecruitDto dto) {
		int result = -1;
		result = dao.insertRecruit(dto);
		return result;
	}
	//메인페이지 채용공고진행중 리스트
	@Override
	public List<BsRecruitDto> recruitProgress(String userId) {
		return dao.recruitProgress(userId);
	}
	

	@Override
	public List<BsRecruitDto> recruitAdmission(String userId) {
		return  dao.recruitAdmission(userId);
	}
	
	// 공개된 채용 공고 리스트
	@Override
	public List<BsRecruitDto> recruitYAdmission() {
		return  dao.recruitYAdmission();
	}
	
	// 3단계
	@Override
	public List<BsRecruitDto> lCateRecruit(String categoryId) {
		return  dao.lCateRecruit(categoryId);
	}
	
	// 공개된 채용 공고 수 
	@Override
	public int countYAdmission() {
		return  dao.countYAdmission();
	}
	
	// 3단계 클릭시 공개된 채용 공고 수 
	@Override
	public int lCatecountYAdmission() {
		return  dao.lCatecountYAdmission();
	}
	
	// 검색 
	@Override
	public List<BsRecruitDto> searchList(Map<String, Object> keywords){
		return  dao.searchList(keywords);
	}
	
	// 카테고리 타입 별 채용조건
	@Override
	public List<AdCategoryDto> cateForSearch(String categoryType) {
		return  dao.cateForSearch(categoryType);
	}

	@Override
	public int changeAdmission(BsRecruitDto dto) {
		return dao.changeAdmission(dto);
	}
	//회원 등록 공고 전부 불러오기
	@Override
	public Paging recruitAll(PagingInfoDto pidto) {
		
		//게시글이 표시될 개 수
		int pageLimit = 10;
		//페이지가 표시될 개 수
		int listLimit = 5;
		
		//총 게시글 개수
		int count = dao.recruitAllCount(pidto);
		
		//나타날 페이지의 첫번 째 글의 ra_num
		pidto.setStartNum((pidto.getPnum() -1)*pageLimit +1);
		//나타날 페이지의 마지막 글의 ra_num
		pidto.setEndNum(pidto.getPnum() * pageLimit);
		//검색어 조건
		
		int mod = count % pageLimit ==0? 0 : 1;
		int pageCount = count/pageLimit + mod;
		
		//new Paging(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자 (<,1,2,3,4,5,> 여기서는 5))
		Paging list = new Paging(dao.recruitAll(pidto), pidto.getPnum(), pageCount);
		//만약 게시글이 표시될 개수와 페이지를 표시할 개수를 바꾸고 싶으면  new Paging
		//(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자, int 게시글이 표시될 개 수, listLimit)
		//로 생성한다.
		
		return list;
	}

	@Override
	public int updateRecruit(BsRecruitDto dto) {
		return dao.updateRecruit(dto);
	}

	@Override
	public int deleteRecruit(BsRecruitDto dto) {
		return dao.deleteRecruit(dto);
	}

	@Override
	public List<BsRecruitDetailDto> recentRecruit() {
		return dao.recentRecruit();
	}


}
