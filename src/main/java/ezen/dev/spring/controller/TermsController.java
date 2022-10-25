package ezen.dev.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/terms")
public class TermsController {
	
	
	@GetMapping("/terms_list.do")
	public String question_list() {
	
		return"/terms/list";
	}
	

}
