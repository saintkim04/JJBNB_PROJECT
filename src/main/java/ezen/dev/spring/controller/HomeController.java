package ezen.dev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ezen.dev.spring.model.Criteria;
import ezen.dev.spring.model.PageMakerVo;
import ezen.dev.spring.service.board.BoardService;
import ezen.dev.spring.vo.BoardVo;

@Controller
public class HomeController {
	

	@Autowired
	BoardService boardService;
	
	@GetMapping("/")
	public String home(Model model, Criteria cri) {
		
		List<BoardVo> boardList = boardService.getBoardListPaging(cri);
		model.addAttribute("boardList", boardList);
		
		int total = boardService.getTotal(cri);
		PageMakerVo pageMake = new PageMakerVo(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
		
		return "home";
	}
	
	@GetMapping("/home.do")
	public String home2(Model model, Criteria cri) {
		
		List<BoardVo> boardList = boardService.getBoardListPaging(cri);
		model.addAttribute("boardList", boardList);
		
		int total = boardService.getTotal(cri);
		PageMakerVo pageMake = new PageMakerVo(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
		
		return "home";
	}
	
	
}
