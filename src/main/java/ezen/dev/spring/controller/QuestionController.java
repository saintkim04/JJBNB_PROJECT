package ezen.dev.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/question")
public class QuestionController {
		
	
	@GetMapping("/question_list.do")
	public String question_list() {
		
		return "/question/list";
	}
	

}
