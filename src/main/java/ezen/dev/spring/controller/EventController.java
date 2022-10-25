package ezen.dev.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.service.event.EventService;
import ezen.dev.spring.vo.Criteria_e;
import ezen.dev.spring.vo.EventVo;
import ezen.dev.spring.vo.PageMakerVo;
import ezen.dev.spring.vo.PageMakerVo_e;

@Controller
@RequestMapping("/event")
public class EventController {
	
	EventService writeService, listService, viewService, deleteService, modifyService;
	
	@Autowired(required=false)
	public void setWriteService(@Qualifier("e_write") EventService writeService) {
		this.writeService = writeService;
	}
	
	@Autowired(required=false)
	public void setListService(@Qualifier("e_list") EventService listService) {
		this.listService = listService;
	}
	
	@Autowired(required=false)
	public void setViewService(@Qualifier("e_view") EventService viewService) {
		this.viewService = viewService;
	}
	
	@Autowired(required=false)
	public void setDeleteService(@Qualifier("e_delete") EventService deleteService) {
		this.deleteService = deleteService;
	}
	
	@Autowired(required=false)
	public void setModifyService(@Qualifier("e_modify") EventService modifyService) {
		this.modifyService = modifyService;
	}
	
	
	
	
	//이벤트 목록 페이지
	@GetMapping("/event_list.do")
	public String event_list(Model model, Criteria_e cri) {
		
		List<EventVo> eventList = listService.getEventList(cri);
		model.addAttribute("eventList", eventList);
		
		int total = listService.getTotal();
		
		PageMakerVo_e pageMake = new PageMakerVo_e(cri, total);
		model.addAttribute("pageMaker", pageMake);
		
		return "/event/list";
	}
	
	
	
	//이벤트 관리자 목록 페이지
	@GetMapping("/admin/event_list.do")
	public String event_admin_list(Model model, Criteria_e cri) {
		
		List<EventVo> eventList = listService.getEventList(cri);
		model.addAttribute("eventList", eventList);
		
		int total = listService.getTotal();
		
		PageMakerVo_e pageMake = new PageMakerVo_e(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		
		return "admin/event/list";
	}
	
	
	
	//이벤트 페이지 상세보기
	@GetMapping("/event_view.do")
	public String event_view(@RequestParam("e_idx") int e_idx, Model model) {
		EventVo eventVo = viewService.eventView(e_idx);
		model.addAttribute("eventVo", eventVo);
		System.out.println(e_idx);
		
		
		return "/event/view";
	}
	
	
	//이벤트 관리자 수정페이지
	@GetMapping("/event_modify.do")
	public String event_modify(@RequestParam("e_idx") String e_idx, Model model) {
		EventVo eventVo = modifyService.getEvent(e_idx);
		model.addAttribute("eventVo", eventVo);
		
		return "/admin/event/modify";
		
	}
	

	//이벤트 관리자 등록 페이지
	@GetMapping("/admin/event_write.do")
	public String event_admin_write() {
		return "admin/event/write";
	}
	
		
	//이벤트 관리자 등록 프로세스
	@PostMapping("/admin/event_write_process.do")
	public String event_write_process(EventVo eventVo, MultipartRequest uploadFile,
			HttpServletRequest request, Model model) {
		
		int result = writeService.eventWrite(eventVo, uploadFile, request);
		
		String viewPage = "admin/event/write";
		if(result == 1) {
			viewPage = "redirect:/event/admin/event_list.do";
		}
		
		return viewPage;
	}
	
	
	//이벤트 관리자 삭제 프로세스
	@GetMapping("/event_delete_process.do")
	public String event_delete(@RequestParam("e_idx") int e_idx) {
		deleteService.deleteEvent(e_idx);
		
		return "redirect:/event/admin/event_list.do";
	}
	
	//이벤트 관리자 수정 프로세스
	@PostMapping("/event_modify_process.do")
	public String event_modify_process(EventVo eventVo, MultipartRequest uploadFile,
			HttpServletRequest request, Model model){
		int result = modifyService.modifyEvent(eventVo, uploadFile, request);
		
		String viewPage = "/admin/event/modify";
		if(result == 1) {
			viewPage = "redirect:/event/admin/event_list.do";
		}
			
		return viewPage;
		
			
	}
	
	

}
