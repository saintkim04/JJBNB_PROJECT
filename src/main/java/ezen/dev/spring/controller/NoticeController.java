package ezen.dev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.PageMakerVo;
import ezen.dev.spring.service.notice.NoticeService;
import ezen.dev.spring.vo.NoticeVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	NoticeService listService, writeService, modifyService, deleteService;
	
	@Autowired(required=false)
	public void setListService(@Qualifier("n_list") NoticeService listService) {
		this.listService = listService;
	}
	
	@Autowired(required=false)
	public void setWriteService(@Qualifier("n_write") NoticeService writeService) {
		this.writeService = writeService;
	}
	
	@Autowired(required=false)
	public void setModifyService(@Qualifier("n_modify") NoticeService modifyService) {
		this.modifyService = modifyService;
	}
	
	@Autowired(required=false)
	public void setDeleteService(@Qualifier("n_delete") NoticeService deleteService) {
		this.deleteService = deleteService;
	}
	
	
	
	//공지사항 등록페이지
	@GetMapping("/notice_write.do")
	public String notice_write() {
		return "/admin/notice/write";
	}
	
	
	//공지사항 관리자 목록페이지
	@GetMapping("/admin/notice_list.do")
	public String admin_notice_list(Model model, Criteria cri) {
		List<NoticeVo> noticeList = listService.getNoticeList(cri);
		model.addAttribute("noticeList", noticeList);
		
		int total = listService.getTotal();
		
		PageMakerVo pageMake = new PageMakerVo(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
	
		return "/admin/notice/list";
	}
	

	//공지사항 수정페이지
	@GetMapping("/notice_modify.do")
	public String notice_modify(@RequestParam("n_idx") String n_idx, Model model){
		NoticeVo noticeVo = modifyService.getNotice(n_idx);
		model.addAttribute("noticeVo", noticeVo);
		
		return "/admin/notice/modify";
	}
		
	
	//공지사항 목록페이지
	@GetMapping("/notice_list.do")
	public String notice_list(Model model, Criteria cri) {
		List<NoticeVo> noticeList = listService.getNoticeList(cri);
		
		model.addAttribute("noticeList", noticeList);
		
		int total = listService.getTotal();
		
		PageMakerVo pageMake = new PageMakerVo(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		return "/notice/list";
	}
	
	
	//공지사항 등록 프로세스
	@PostMapping("/notice_write_process.do")
	public String notice_write_process(NoticeVo noticeVo, Model model){
		
		int result = writeService.writeNotice(noticeVo);
		
		String viewPage = "/admin/notice/write";
		if(result == 1) {
			
			
			viewPage = "redirect:/notice/admin/notice_list.do";
		}
		
		return viewPage;
	
		
	}
	
	//공지사항 수정 프로세스
	@PostMapping("/notice_modify_process.do")
	public String notice_modify_process(NoticeVo noticeVo){
		int result = modifyService.modifyNotice(noticeVo);
		
		String viewPage = "/admin/notice/modify";
		if(result == 1) {
			viewPage = "redirect:/notice/admin/notice_list.do";
		}
			
		return viewPage;
		
			
	}

		
	
	//공지사항 삭제 프로세스
	@GetMapping("/notice_delete_process.do")
	public String notice_delete(@RequestParam("n_idx") int n_idx) {
		
		int result = deleteService.deleteNotice(n_idx);
		
		String viewPage = "/notice/admin/list";
		
		if(result == 1) {
			viewPage = "redirect:/notice/admin/notice_list.do";
		}

		return viewPage;
		
	}
	
	
	
	

}
