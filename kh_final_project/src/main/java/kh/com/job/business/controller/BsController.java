package kh.com.job.business.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/bs")
public class BsController {
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
		
		return mv;
	}

}
