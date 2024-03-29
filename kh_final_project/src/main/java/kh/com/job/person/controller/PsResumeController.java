package kh.com.job.person.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.business.model.service.BsRecruitService;
import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUnivDto;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsResumeService;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("person/resume")
public class PsResumeController {

	@Autowired
	private PsResumeService rservice;
	
	@Autowired
	private PsService pservice;
	
	@Autowired
	private BsRecruitService bservice;

	// 이력서 관리
	@GetMapping("/list")
	public ModelAndView doList(ModelAndView mv, Principal principal) {
		try {
			
			PsUserDto result = pservice.selectOne(principal.getName());
			List<PsResumeDto> resume = rservice.selectList(principal.getName());

			if (result != null) {
				mv.addObject("userinfo", result);
				mv.addObject("resumelist", resume);
				mv.setViewName("person/resume/list");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 이력서 작성 
	@GetMapping("/write")
	public ModelAndView doResume(ModelAndView mv, Principal principal) {
		try {

			PsUserDto result = pservice.selectOne(principal.getName());
			if (result != null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/resume/write");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("JNlist", bservice.getCateList("JN"));
		
		return mv;
	}
	
	// 이력서 작성
	@PostMapping("/write")
	@ResponseBody
	public int writeResume(ModelAndView mv, Principal principal, PsResumeDto dto,
			@RequestParam(name = "uploadPortf", required = false) MultipartFile uploadPortf) throws Exception {
		
		dto.setUserId(principal.getName());
		
		if (uploadPortf != null && !uploadPortf.isEmpty()) {
			String portfUrl = rservice.upload(uploadPortf, principal.getName());
			dto.setPortfFile(portfUrl);
		}
		
		int resumeNo = -1;
		try {
			
			resumeNo = rservice.insert(dto);
			return resumeNo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resumeNo;
	}

	// 이력서 파일 업로드
	@PostMapping("/fileupload")
	public ModelAndView fileupload(ModelAndView mv, @RequestParam(name = "report", required = false) MultipartFile file,
			Principal principal) throws Exception {

		if (!file.isEmpty()) {
			PsUserDto result = pservice.selectOne(principal.getName());
			if (result != null) {
				String url = rservice.upload(file, principal.getName());
				mv.addObject("url", url);
				mv.addObject("userinfo", result);
				mv.addObject("JNlist", bservice.getCateList("JN"));
			}
		}
		mv.setViewName("person/resume/write");
		return mv;
	}


	// 이력서 삭제
	@PostMapping("/delete")
	public ModelAndView deleteResume(ModelAndView mv, int resumeNo, Principal principal, RedirectAttributes rttr)
			throws Exception {

		int result = rservice.delete(resumeNo);

		if (result > 0) {
			rttr.addFlashAttribute("msg", "이력서가 삭제되었습니다.");

		} else {
			rttr.addFlashAttribute("msg", "이력서 삭제에 실패했습니다.");
		}

		mv.setViewName("redirect:/person/resume/list");
		return mv;
	}

	// 이력서 상세보기 화면
	@GetMapping("/read/{resumeNo}")
	public ModelAndView viewReadResume(ModelAndView mv, Principal principal, @PathVariable int resumeNo)
			throws Exception {
		
		String userId = principal.getName();
		Map<String, Object> infoMap = new HashMap<>();
		infoMap.put("userId", userId);
		infoMap.put("resumeNo", resumeNo);


		// user 정보 출력 
		PsUserDto result = pservice.selectOne(userId);
		mv.addObject("userinfo", result);

		// 이력서 정보 출력 
		PsResumeDto resume = rservice.rselectOne(infoMap);
		
		// 학력사항 정보 출력 
		List<PsHschoolDto> high = rservice.highSelectList(infoMap);
		List<PsUnivDto> uni = rservice.uniSelectList(infoMap);
		List<PsGschoolDto> grad = rservice.gradSelectList(infoMap);
		
		// 경력사항 정보 출력 
		List<PsCareerDto> career = rservice.carSelectList(infoMap);
		
		// 자격증 정보 출력
		List<PsCertiDto> certi = rservice.certiSelectList(infoMap);
		
		// 자기소개서 정보 출력
		PsClDto cl = rservice.clSelectOne(infoMap);
		
		mv.addObject("resume", resume);
		mv.addObject("high", high);
		mv.addObject("uni", uni);
		mv.addObject("grad", grad);
		mv.addObject("career", career);
		mv.addObject("certi", certi);
		mv.addObject("cl", cl);
		mv.setViewName("person/resume/read");
		return mv;
	}
	
	// 이력서 상세보기 화면 > 자기소개서 화면
	@GetMapping("/read/{resumeNo}/{clNo}")
	public ModelAndView viewReadResumeCl(ModelAndView mv, Principal principal, @PathVariable Integer resumeNo, Integer clNo)
			throws Exception {
		
		String userId = principal.getName();
		Map<String, Object> infoMap = new HashMap<>();
		infoMap.put("userId", userId);
		infoMap.put("resumeNo", resumeNo);
		
		// user 정보 출력 
		PsUserDto result = pservice.selectOne(userId);
		mv.addObject("userinfo", result);
		
		// 이력서 정보 출력 
		PsResumeDto resume = rservice.rselectOne(infoMap);
		mv.addObject("resume", resume);
		
		
		// 자기소개서 정보 출력
		PsClDto cl = rservice.clSelectOne(infoMap);
		mv.addObject("cl", cl);
		
		mv.setViewName("person/resume/readcl");
		return mv;
	}
	
	

	// 학력사항 페이지
	@GetMapping("school")
	public ModelAndView viewSchool(ModelAndView mv, Principal principal) throws Exception {

		// 고등학교 학력정보 불러오기
		List<PsHschoolDto> high = rservice.selectListHigh(principal.getName());
		mv.addObject("high", high);

		// 대학교 학력정보 불러오기
		List<PsUnivDto> uni = rservice.selectListUni(principal.getName());
		mv.addObject("uni", uni);

		// 대학원 학력정보 불러오기
		List<PsGschoolDto> grad = rservice.selectListGrad(principal.getName());
		mv.addObject("grad", grad);
		return mv;
	}

	// 고등학교입력
	@PostMapping("rHSchool")
	public ModelAndView rHschool(Principal principal, ModelAndView mv, PsHschoolDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertHschool(dto);

			if (result > 0) {
				int highEduNo = rservice.getMaxHighNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("highEduNo", highEduNo);
				InfoNo.put("userId", principal.getName());

				// 낀테이블 insert
				rservice.insertHighInfo(InfoNo);

				rttr.addFlashAttribute("msg", "고등학교 학력사항이 입력되었습니다.");

			} else {
				rttr.addFlashAttribute("msg", "저장에 실패했습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/school");
		return mv;
	}
	


	// 고등학교 테이블 수정
	@PostMapping("updateHigh")
	@ResponseBody
	public int updateHigh(@RequestParam("highEduNo") Integer highEduNo, @RequestParam("highNewName") String highName, 
			@RequestParam("highNewDate") String highDate, @RequestParam("highNewMajor") String highMajor)
			throws Exception {

		int result = -1;

		Map<String, Object> updateHigh = new HashMap<>();
		updateHigh.put("highEduNo", highEduNo);
		updateHigh.put("highName", highName);
		updateHigh.put("highDate", highDate);
		updateHigh.put("highMajor", highMajor);

		result = rservice.updateHigh(updateHigh);
		return result;
	}

	// 고등학교 테이블 삭제
	@PostMapping("deleteHigh")
	@ResponseBody
	public int deleteHigh(@RequestParam("highEduNo") Integer highEduNo) throws Exception {

		int result = -1;
		result = rservice.deleteHigh(highEduNo);
		return result;
	}

	// 고등학교 불러올때 낀테이블 insert
	@PostMapping("insertInfoHigh")
	@ResponseBody
	public int insertInfoHigh(Principal principal, @RequestParam("highEduNo") Integer highEduNo) throws Exception {
		
		int result = -1;
		
		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("highEduNo", highEduNo);
		InfoNo.put("userId", principal.getName());
		
		result = rservice.insertHighInfo(InfoNo);
		
		return result;
	}
	

	// 고등학교 끼인 테이블 삭제
	@PostMapping("deleteInfoHigh")
	@ResponseBody
	public int deleteInfoHigh(Principal principal, @RequestParam("highEduNo") Integer highEduNo) throws Exception {
		System.out.println(highEduNo);
		int result = -1;

		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("highEduNo", highEduNo);
		InfoNo.put("userId", principal.getName());

		result = rservice.deleteInfoHigh(InfoNo);
		return result;
	}

	// 대학교 입력
	@PostMapping("rUniversity")
	public ModelAndView rUniversity(Principal principal, ModelAndView mv, PsUnivDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertUniv(dto);

			if (result > 0) {
				int uniEduNo = rservice.getMaxUniNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("uniEduNo", uniEduNo);
				InfoNo.put("userId", principal.getName());

				// 낀테이블 insert
				rservice.insertUniInfo(InfoNo);
				rttr.addFlashAttribute("msg", "대학교 학력사항이 입력되었습니다.");
			} else {
				rttr.addFlashAttribute("msg", "입력에 실패하였습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/school");
		return mv;
	}

	// 대학교 테이블 삭제
	@PostMapping("deleteUni")
	@ResponseBody
	public int deleteUni(@RequestParam("uniEduNo") Integer uniEduNo) throws Exception {

		int result = -1;
		result = rservice.deleteUni(uniEduNo);
		return result;
	}

	// 대학교 테이블 수정
	@PostMapping("updateUni")
	@ResponseBody
	public int updateUni(@RequestParam("uniEduNo") Integer uniEduNo, @RequestParam("uniNewAct") String uniAct,
			@RequestParam("uniNewCategory") String uniCategory, @RequestParam("uniNewName") String uniName,
			@RequestParam("uniNewDate") String uniDate, @RequestParam("uniNewMajor") String uniMajor,
			@RequestParam("uniNewPoint") Double uniPoint)
					throws Exception {
		
		int result = -1;
		
		Map<String, Object> updateUni = new HashMap<>();
		updateUni.put("uniEduNo", uniEduNo);
		updateUni.put("uniAct", uniAct);
		updateUni.put("uniCategory", uniCategory);
		updateUni.put("uniName", uniName);
		updateUni.put("uniDate", uniDate);
		updateUni.put("uniMajor", uniMajor);
		updateUni.put("uniPoint", uniPoint);
		
		result = rservice.updateUni(updateUni);
		return result;
	}
	
	// 대학교 불러올때 낀테이블 insert
	@PostMapping("insertInfoUni")
	@ResponseBody
	public int insertInfoUni(Principal principal, @RequestParam("uniEduNo") Integer uniEduNo) throws Exception {

		int result = -1;

		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("uniEduNo", uniEduNo);
		InfoNo.put("userId", principal.getName());

		result = rservice.insertUniInfo(InfoNo);

		return result;
	}

	
	// 대학교 끼인 테이블 삭제
	@PostMapping("deleteInfoUni")
	@ResponseBody
	public int deleteInfoUni(Principal principal, @RequestParam("uniEduNo") Integer uniEduNo) throws Exception {
		System.out.println(uniEduNo);
		int result = -1;

		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("uniEduNo", uniEduNo);
		InfoNo.put("userId", principal.getName());

		result = rservice.deleteInfoUni(InfoNo);
		return result;
	}
	
	

	// 대학원 입력
	@PostMapping("rGSchool")
	public ModelAndView rGSchool(Principal principal, ModelAndView mv, PsGschoolDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertGschool(dto);

			if (result > 0) {
				int gradEduNo = rservice.getMaxGradNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("gradEduNo", gradEduNo);
				InfoNo.put("userId", principal.getName());

				// 낀테이블 insert
				rservice.insertGradInfo(InfoNo);
				rttr.addFlashAttribute("msg", "대학원 학력사항이 입력되었습니다.");
			} else {
				rttr.addFlashAttribute("msg", "입력에 실패하였습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/school");
		return mv;
	}
	
	// 대학원 테이블 수정
	@PostMapping("updateGrad")
	@ResponseBody
	public int updateGrad(@RequestParam("gradEduNo") Integer gradEduNo, @RequestParam("gradNewAct") String gradAct,
			@RequestParam("gradNewCategory") String gradCategory, @RequestParam("gradNewName") String gradName,
			@RequestParam("gradNewDate") String gradDate, @RequestParam("gradNewMajor") String gradMajor,
			@RequestParam("gradNewPoint") Double gradPoint)
					throws Exception {
		
		int result = -1;
		
		Map<String, Object> updateGrad = new HashMap<>();
		updateGrad.put("gradEduNo", gradEduNo);
		updateGrad.put("gradAct", gradAct);
		updateGrad.put("gradCategory", gradCategory);
		updateGrad.put("gradName", gradName);
		updateGrad.put("gradDate", gradDate);
		updateGrad.put("gradMajor", gradMajor);
		updateGrad.put("gradPoint", gradPoint);
		
		result = rservice.updateGrad(updateGrad);
		
		return result;
	}
	
	// 대학원 테이블 삭제
	@PostMapping("deleteGrad")
	@ResponseBody
	public int deleteGrad(@RequestParam("gradEduNo") Integer gradEduNo) throws Exception {
		
		int result = -1;
		result = rservice.deleteGrad(gradEduNo);
		return result;
	}
	
	// 대학원 불러올때 낀테이블 insert
	@PostMapping("insertInfoGrad")
	@ResponseBody
	public int insertInfoGrad(Principal principal, @RequestParam("gradEduNo") Integer gradEduNo) throws Exception {
		
		int result = -1;
		
		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("gradEduNo", gradEduNo);
		InfoNo.put("userId", principal.getName());
		
		result = rservice.insertGradInfo(InfoNo);
		
		return result;
	}

	// 대학원 끼인 테이블 삭제
	@PostMapping("deleteInfoGrad")
	@ResponseBody
	public int deleteInfoGrad(Principal principal, @RequestParam("gradEduNo") Integer gradEduNo) throws Exception {
		int result = -1;

		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("gradEduNo", gradEduNo);
		InfoNo.put("userId", principal.getName());

		result = rservice.deleteInfoGrad(InfoNo);
		return result;
	}
	

	// 경력사항 페이지
	@GetMapping("career")
	public ModelAndView viewCareer(Principal principal, ModelAndView mv) throws Exception {

		// 경력사항 불러오기
		List<PsCareerDto> career = rservice.selectListCareer(principal.getName());
		mv.addObject("career", career);

		return mv;
	}

	// 경력사항 입력
	@PostMapping("career")
	public ModelAndView doCareer(Principal principal, ModelAndView mv, PsCareerDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			// 경력사항 테이블 insert
			result = rservice.insertCareer(dto);

			if (result > 0) {
				int carNo = rservice.getMaxCareerNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("carNo", carNo);
				InfoNo.put("userId", principal.getName());

				// 낀테이블 insert
				rservice.insertCareerInfo(InfoNo);
				rttr.addFlashAttribute("msg", "경력사항이 입력되었습니다.");
			} else {
				rttr.addFlashAttribute("msg", "경력사항 입력에 실패했습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/career");
		return mv;
	}


	// 경력 테이블 수정
	@PostMapping("updateCareer")
	@ResponseBody
	public int updateCareer(@RequestParam("carNo") Integer carNo, @RequestParam("carNewName") String carName,
			@RequestParam("carNewDate") String carDate, @RequestParam("carNewPosition") String carPosition,
			@RequestParam("carNewDept") String carDept, @RequestParam("carNewResp") String carResp,
			@RequestParam("carNewSalary") Integer carSalary) throws Exception {
		
		int result = -1;
		
		Map<String, Object> updateCareer = new HashMap<>();
		updateCareer.put("carNo", carNo);
		updateCareer.put("carName", carName);
		updateCareer.put("carDate", carDate);
		updateCareer.put("carPosition", carPosition);
		updateCareer.put("carDept", carDept);
		updateCareer.put("carResp", carResp);
		updateCareer.put("carSalary", carSalary);
		
		result = rservice.updateCareer(updateCareer);
		return result;
	}
	
	// 경력사항 삭제
	@PostMapping("deleteCareer")
	@ResponseBody
	public int deleteCareer(@RequestParam("carNo") Integer carNo) throws Exception {

		System.out.println(carNo);
		int result = -1;
		result = rservice.deleteCareer(carNo);
		return result;
	}

	// 경력 불러올때 낀테이블 insert
	@PostMapping("insertInfoCareer")
	@ResponseBody
	public int insertInfoCareer(Principal principal, @RequestParam("carNo") Integer carNo) throws Exception {
		
		int result = -1;
		
		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("carNo", carNo);
		InfoNo.put("userId", principal.getName());
		
		result = rservice.insertCareerInfo(InfoNo);
		
		return result;
	}
	
	// 경력 끼인 테이블 삭제
	@PostMapping("deleteInfoCareer")
	@ResponseBody
	public int deleteInfoCareer(Principal principal, @RequestParam("carNo") Integer carNo) throws Exception {
		System.out.println(carNo);
		int result = -1;

		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("carNo", carNo);
		InfoNo.put("userId", principal.getName());

		result = rservice.deleteInfoCareer(InfoNo);
		return result;
	}


	// 자격증 페이지
	@GetMapping("certi")
	public ModelAndView viewCerti(Principal principal, ModelAndView mv) throws Exception {

		// 자격증 불러오기
		List<PsCertiDto> certi = rservice.selectListCerti(principal.getName());
		mv.addObject("certi", certi);

		return mv;
	}

	// 자격증 입력
	@PostMapping("certi")
	public ModelAndView doCerti(Principal principal, ModelAndView mv, PsCertiDto dto, RedirectAttributes rttr) {

		int result = -1;
		try {
			result = rservice.insertCerti(dto);

			if (result > 0) {
				int certiNo = rservice.getMaxCertiNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("certiNo", certiNo);
				InfoNo.put("userId", principal.getName());

				rservice.insertCertiInfo(InfoNo);
				rttr.addFlashAttribute("msg", "자격증이 입력되었습니다.");
			} else {
				rttr.addFlashAttribute("msg", "자격증 입력에 실패했습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/certi");
		return mv;
	}
	
	// 자격증 테이블 수정
	@PostMapping("updateCerti")
	@ResponseBody
	public int updateCerti(@RequestParam("certiNo") Integer certiNo, @RequestParam("certiNewName") String certiName,
			@RequestParam("certiNewPub") String certiPub, @RequestParam("certiNewDate") String certiDate)
					throws Exception {
		
		int result = -1;
		
		Map<String, Object> updateCerti = new HashMap<>();
		updateCerti.put("certiNo", certiNo);
		updateCerti.put("certiName", certiName);
		updateCerti.put("certiPub", certiPub);
		updateCerti.put("certiDate", certiDate);
		
		result = rservice.updateCerti(updateCerti);
		return result;
	}

	// 자격증 테이블 삭제
	@PostMapping("deleteCerti")
	@ResponseBody
	public int deleteCerti(@RequestParam("certiNo") Integer certiNo) throws Exception {
		
		int result = -1;
		result = rservice.deleteCerti(certiNo);
		return result;
	}
	
	// 자격증 끼인 테이블 insert
	@PostMapping("insertInfoCerti")
	@ResponseBody
	public int insertInfoCerti(Principal principal, @RequestParam("certiNo") Integer certiNo) throws Exception {
		int result = -1;
		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("certiNo", certiNo);
		InfoNo.put("userId", principal.getName());
		result = rservice.insertCertiInfo(InfoNo);

		return result;
	}

	// 자격증 끼인 테이블 삭제
	@PostMapping("deleteInfoCerti")
	@ResponseBody
	public int deleteInfoCerti(Principal principal, @RequestParam("certiNo") Integer certiNo) throws Exception {
		System.out.println(certiNo);
		int result = -1;
		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("certiNo", certiNo);
		InfoNo.put("userId", principal.getName());
		result = rservice.deleteInfoCerti(InfoNo);
		return result;
	}



	// 자소서 페이지
	@GetMapping("cl")
	public ModelAndView viewCl(ModelAndView mv, Principal principal) throws Exception {

		// 자기소개서 불러오기
		List<PsClDto> clList = rservice.selectListCl(principal.getName());
		for (PsClDto cl : clList) {
			 if (cl.getClGrowth() != null) {
		            cl.setClGrowth(cl.getClGrowth().substring(0, Math.min(cl.getClGrowth().length(), 20)));
		     } else {
		            cl.setClGrowth("없음");
		     }
			
			 if (cl.getClMotive() != null) {
		            cl.setClMotive(cl.getClMotive().substring(0, Math.min(cl.getClMotive().length(), 20)));
		     } else {
		            cl.setClMotive("없음");
		    }
		    if (cl.getClAdv() != null) {
		            cl.setClAdv(cl.getClAdv().substring(0, Math.min(cl.getClAdv().length(), 20)));
		    } else {
		            cl.setClAdv("없음");
		    }
		    if (cl.getClAsp() != null) {
		            cl.setClAsp(cl.getClAsp().substring(0, Math.min(cl.getClAsp().length(), 20)));
		    } else {
		            cl.setClAsp("없음");
		    }


			if (cl.getClFile() != null) {
				cl.setClFile("파일 존재");
			} else {
				cl.setClFile("파일 없음");
			}

		}
		mv.addObject("clList", clList);
		return mv;
	}

	// 자소서 페이지
	@PostMapping("cl")
	@ResponseBody
	public int doCl(ModelAndView mv, @RequestParam("growth") String growth, @RequestParam("motive") String motive,
			@RequestParam("adv") String adv, @RequestParam("asp") String asp,
			@RequestParam(name = "uploadCl", required = false) MultipartFile clFile, PsClDto dto, Principal principal) {

		dto.setClGrowth(growth);
		dto.setClMotive(motive);
		dto.setClAdv(adv);
		dto.setClAsp(asp);

		if (clFile != null && !clFile.isEmpty()) {
			String portfUrl = rservice.upload(clFile, principal.getName());
			dto.setClFile(portfUrl);
		}

		int result = -1;

		try {
			result = rservice.insertCl(dto);
			if (result > 0) {
				int clNo = rservice.getMaxClNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("clNo", clNo);
				InfoNo.put("userId", principal.getName());

				rservice.insertClInfo(InfoNo);
				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 자소서 새창 
	@GetMapping("detail/{clNo}")
	public ModelAndView viewReadCl(ModelAndView mv, Principal principal, @PathVariable Integer clNo) throws Exception {

		PsClDto dto = rservice.selectOneCl(clNo);
		dto.setClNo(clNo);
		mv.addObject("cl", dto);
		mv.setViewName("person/resume/detail");
		return mv;
	}

	// 자소서 수정
	@PostMapping("updateCl")
	@ResponseBody
	public int updateCl(@RequestParam("No") String clNumber, @RequestParam("growth") String clGrowth,
			@RequestParam("motive") String clMotive, @RequestParam("adv") String clAdv,
			@RequestParam("asp") String clAsp, @RequestParam(name = "updateClFile", required = false) MultipartFile clFile,
			@RequestParam(name = "curPath", required = false, defaultValue = "") String curPath, Principal principal) throws Exception {
		
		int result = -1;
		String portfUrl = null;
		
		if (clFile != null) {
			
			// 파일 업로드 처리
			portfUrl = rservice.upload(clFile, principal.getName());
			if (!curPath.equals("")) { 
				// 기존 파일이 있으면 삭제
				String fileName = curPath.substring(curPath.lastIndexOf("/") + 1);
				rservice.delete(fileName, principal.getName());
				
			}
		} else { // 파일 업로드를 하지 않은 경우 기존 파일 경로를 그대로 사용
			if (!curPath.equals("")) {
				portfUrl = curPath;
			}
		}
		
		int clNo = Integer.parseInt(clNumber);
		Map<String, Object> updateCl = new HashMap<>();
		updateCl.put("clNo", clNo);
		updateCl.put("clFile", portfUrl);
		updateCl.put("clGrowth", clGrowth);
		updateCl.put("clMotive", clMotive);
		updateCl.put("clAdv", clAdv);
		updateCl.put("clAsp", clAsp);
		
		result = rservice.updateCl(updateCl);
		return result;
	}
	
	// 자소서 삭제
	@PostMapping("deleteCl")
	@ResponseBody
	public int deleteCl(@RequestParam("clNo") Integer clNo) throws Exception {

		int result = -1;
		result = rservice.deleteCl(clNo);
		return result;
	}


	// 자소서 끼인 테이블 insert
	@PostMapping("insertInfoCl")
	@ResponseBody
	public int insertInfoCl(Principal principal, @RequestParam("clNo") Integer clNo) throws Exception {
	    int result = -1;
	    int check = -1;
	    Map<String, Object> InfoNo = new HashMap<>();
	    InfoNo.put("clNo", clNo);
	    InfoNo.put("userId", principal.getName());
	    
	    // 자기소개서 존재 여부 확인 
	    check = rservice.checkClInfo(clNo);
	    if (check == 0) {
	        result = rservice.insertClInfo(InfoNo);
	        if (result > 0) {
	            return result;
	        }
	    }
	    else if (check > 0) {
	        return 1;
	    }
	    return -1;
	}
	
	// 자소서 끼인 테이블 delete
	@PostMapping("deleteInfoCl")
	@ResponseBody
	public int deleteInfoCl(Principal principal, @RequestParam("clNo") Integer clNo) throws Exception {
		
		int result = -1;
		
		Map<String, Object> InfoNo = new HashMap<>();
		InfoNo.put("clNo", clNo);
		InfoNo.put("userId", principal.getName());
		result = rservice.deleteInfoCl(InfoNo);
		return result;
	}

	// 자소서 기존 파일 삭제
	@PostMapping("deleteClFile")
	@ResponseBody
	public int deleteClFile(Principal principal, @RequestParam("fileUrl") String fileUrl) {

		String userId = principal.getName();
		try {
			 String fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
			 
			 // 파일 google 에서 삭제되면 db 에서도 삭제 
		     rservice.delete(fileName, userId);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}


}
