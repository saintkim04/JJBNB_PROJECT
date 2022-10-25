package ezen.dev.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dev.spring.service.inquiry.InquiryService;
import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.InquiryVo;
import ezen.dev.spring.vo.PageMakerVo;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	InquiryService writeService, listService, answerService, answerListService, answerWriteService, answeredListService;
	
	@Autowired(required=false)
	public void setWriteService(@Qualifier("i_write") InquiryService writeService) {
		this.writeService = writeService;
	}
	
	@Autowired(required=false)
	public void setInquiryListService(@Qualifier("i_list") InquiryService listService) {
		this.listService = listService;
	}
	
	@Autowired(required=false)
	public void setInquiryAnswerService(@Qualifier("i_answer") InquiryService answerService) {
		this.answerService = answerService;
	}
	
	
	@Autowired(required=false)
	public void setInquiryAnsweredService(@Qualifier("i_answeredList") InquiryService answeredListService) {
		this.answeredListService = answeredListService;
	}
	
	
	@Autowired(required=false)
	public void setInquiryAnswerListService(@Qualifier("i_answerList") InquiryService answerListService) {
		this.answerListService = answerListService;
	}
	
	@Autowired(required=false)
	public void setInquiryAnswerWriteService(@Qualifier("i_answerWrite") InquiryService answerWriteService) {
		this.answerWriteService = answerWriteService;
	}
	

	
	//1:1문의 사용자 등록페이지
	@GetMapping("/inquiry_write.do")
	public String inquiry_write() {
		return "inquiry/write";
	}
	

	//1:1 문의 목록페이지
	@GetMapping("/inquiry_list.do")
	public String inquiry_list(Model model, HttpServletRequest request, Criteria cri) {
		
		HttpSession session = request.getSession();
		int m_idx = (Integer)session.getAttribute("m_idx");
		
		List<InquiryVo> inquiryList = listService.getInquiryList(m_idx, cri);
		model.addAttribute("inquiryList", inquiryList);
		
		int total = listService.getTotal(m_idx);
		
		PageMakerVo pageMake = new PageMakerVo(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		return "/inquiry/list";
	}
	
	
	//1:1문의 관리자 목록페이지 (답변 대기중)
	@GetMapping("/admin/inquiry_list.do")
	public String admin_inquiry_list(Model model, Criteria cri) {
		List<InquiryVo> answeredList = answeredListService.getAnsweredList(cri);
		model.addAttribute("answeredList", answeredList);
		
		int total = answeredListService.getTotaling();
		
		PageMakerVo pageMake = new PageMakerVo(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		return "/admin/inquiry/list";
	}
	
	
	//1:1 문의 관리자 답변 목록 페이지 (답변 완료)
	@GetMapping("/admin/inquiry_answer_list.do")
	public String inquiry_answer_list(Model model, Criteria cri) {
		List<InquiryVo> answerList = answerListService.getAnswerList(cri);
		model.addAttribute("answerList", answerList);
		
		int total = answerListService.getTotaled();
		
		PageMakerVo pageMake = new PageMakerVo(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		return "/admin/inquiry/answerList";
	}
	
	//1:1 문의 답변페이지
	@GetMapping("/admin/inquiry_answer.do")
	public String inquiry_answer(@RequestParam("i_idx") int i_idx, Model model) {
		InquiryVo inquiryVo = answerService.answerInquiry(i_idx);
		model.addAttribute("inquiryVo", inquiryVo);
		
		return "/admin/inquiry/answer";
	}
	
	//1:1 문의 사용자 등록 프로세스
		@PostMapping("/inquiry_write_process.do")
		public String inquiry_write(InquiryVo inquiryVo) {
			
			int result = writeService.writeInquiry(inquiryVo);
						
			String viewPage = "/inquiry/write";
			if(result == 1) {
				viewPage = "redirect:/inquiry/inquiry_list.do";
			}
			
			return viewPage;
			
		}
	
	//1:1 문의 답변 프로세스
	@PostMapping("/admin/inquiry_answer_process.do")
	public String inquiry_answer_process(InquiryVo inquiryVo) {
		int result = answerWriteService.writeAnswer(inquiryVo);
		
		String viewPage = "admin/inquiry/answer";
		if(result == 1) {
			viewPage = "redirect:/inquiry/admin/inquiry_answer_list.do";
		
		}		
		return viewPage;
		
	}
}
