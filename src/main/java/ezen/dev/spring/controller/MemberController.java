package ezen.dev.spring.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.dev.spring.MailSendService.MailSendService;
import ezen.dev.spring.service.board.BoardService;
import ezen.dev.spring.service.member.MemberService;
import ezen.dev.spring.vo.BoardVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ReservationVo;

@Controller
public class MemberController {
	
	@Autowired
	BoardService boardService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	MemberService joinService, loginService, updateService, listService;
	
	@Autowired(required=false)
	public void setJoinService(@Qualifier("join") MemberService joinService) {
		this.joinService = joinService;
	}
	
	@Autowired(required=false)
	public void setLoginService(@Qualifier("login") MemberService loginService) {
		this.loginService = loginService;
	}
	
	@Autowired(required=false)
	public void setUpdateService(@Qualifier("m_update") MemberService updateService) {
		this.updateService = updateService;
	}
	
	@Autowired(required=false)
	public void setListService(@Qualifier("m_list") MemberService listService) {
		this.listService = listService;
	}
	
	@Autowired
	private MailSendService mailService;

	@GetMapping("/join.do")
	public String join_process() {
		return "join/join";
	}
	
	@PostMapping("/join_process.do")//회원가입 처리 요청
	public String join_process(MemberVo memberVo, Model model) {
		//MemberVo:커맨드 객체 (사용자로부터 전달되는 파라미터들을 받아서 저장하는 자바 객체)
		
		//Spring MVC에서는 요청에 대한 처리를 Controller에서 바로 하는 것보다 
		//Service클래스에서 처리하는 것을 권장함. Service클래스는 일반적으로 인터페이스를 정의하고
		//해당 인터페이스를 상속하는 클래스로 정의함. 회원관리시스템에 대한 서비스를 전체적으로 묶을 수
		//있는 MemberService인터페이스를 정의하고 회원가입에 대해 처리하는 클래스는 MemberJoinService로
		//정의함(관행: MemberJoinService인터페이스 - MemberJoinServiceImpl클래스)
		String inputPass = memberVo.getM_pw();
		String pwd = pwdEncoder.encode(inputPass);
		memberVo.setM_pw(pwd);
		
		int result = joinService.join(memberVo);
		
		String viewPage = "join/join";
		
			if(result == 1) {//회원가입 성공
				
				viewPage = "redirect:/";
			}
			return viewPage;
	}
		
	@GetMapping("/login.do")
	public String login_process() {
		return "login/login";
	}
	
	@PostMapping("/login_process.do")
	public String login_process(MemberVo memberVo,HttpSession session, RedirectAttributes rttr) {
		
		MemberVo login = loginService.login(memberVo);
		String viewPage = "login/login";
		if(login == null) {
			return viewPage;
		}else {
		boolean pwdMatch = pwdEncoder.matches(memberVo.getM_pw(), login.getM_pw());

		if(pwdMatch == true) {//로그인 성공
			session.setAttribute("m_id", login.getM_id());
			session.setAttribute("m_grade", login.getM_grade());
			session.setAttribute("m_idx", login.getM_idx());
			session.setAttribute("m_nname", login.getM_nname());
			session.setAttribute("m_email", login.getM_email());
			session.setAttribute("m_tell", login.getM_tell());
			viewPage = "redirect:/";
		}
		}
		return viewPage;
	}
	
	@GetMapping("/pwfind.do")
	public String pwfind() {
		return "login/pwfind";
	}
	
	@PostMapping("/pwfind_process.do")
	public String pwfind_process(MemberVo memberVo,HttpSession session) {
		
		int result = loginService.pwfind_process(memberVo);

		String viewPage="login/pwfind";
		
		if(result == 1) {
			session.setAttribute("m_id",memberVo.getM_id());
			viewPage = "login/pwmodify";
		}
		
		return viewPage;
		
	}
	
	@PostMapping("/pwChk.do")
	public String pwChk(MemberVo memberVo,HttpSession session) {
		MemberVo login = updateService.pwChk(memberVo);
		boolean pwdMatch = pwdEncoder.matches(memberVo.getM_pw(), login.getM_pw());
		String viewPage = "mypage/mypage";
		if(pwdMatch == true) {
			
			session.getAttribute(memberVo.getM_id());
			viewPage = "login/pwmodify";
		}
		return viewPage;
		
	}
	
	@GetMapping("/member_logout.do")
	public String member_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/mypage.do")
	public String member_info(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("m_id");
		MemberVo memberVo = updateService.getMember(m_id);
		
		model.addAttribute("memberVo", memberVo);
		
		return "mypage/mypage";
	}
	
	@PostMapping("/nname_update.do")
	public String nname_update(MemberVo memberVo, HttpSession session) {
		
		int result = updateService.updateNname(memberVo);
		
		String viewPage="mypage/mypage";
		
		if(result ==1)
			session.setAttribute("m_nname", memberVo.getM_nname());
			viewPage = "home";
		
		return viewPage;
	}
	
	@PostMapping("/email_update.do")
	public String email_update(MemberVo memberVo, HttpSession session) {
		
		int result = updateService.updateEmail(memberVo);
		
		String viewPage="mypage/mypage";
		
		if(result ==1)
			session.setAttribute("m_email", memberVo.getM_email());
			viewPage = "home";
		
		return viewPage;
	}
	
	@PostMapping("/tell_update.do")
	public String tell_update(MemberVo memberVo, HttpSession session) {
		
		int result = updateService.updateTell(memberVo);
		
		String viewPage="mypage/mypage";
		
		if(result ==1)
			session.setAttribute("m_tell", memberVo.getM_tell());
			viewPage = "home";
		
		return viewPage;
	}
	
	@PostMapping("/pw_update.do")
	public String pw_update(MemberVo memberVo) {
		String inputPass = memberVo.getM_pw();
		String pwd = pwdEncoder.encode(inputPass);
		memberVo.setM_pw(pwd);
		int result = updateService.updatePw(memberVo);
		String viewPage="login/pwmodify";
		
		if(result ==1) {
			viewPage = "home";
		}
		return viewPage;
	}
	
	//아이디 중복 체크
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVo memberVo) {
		int result = joinService.idChk(memberVo);
		return result;
	}
	@ResponseBody
	@PostMapping("/nnameChk")
	public int nnameChk(MemberVo memberVo) {
		int result = joinService.nnameChk(memberVo);
		return result;
	}
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	}
	
	
	//예약내역 페이지로 이동
	@GetMapping("/reservation_list.do")
	public String reservation_list(HttpSession session, Model model) {
		
		System.out.println(session);
		int m_idx = (int)session.getAttribute("m_idx");
		System.out.println(m_idx);
		List<ReservationVo> reservationList = listService.reservation_list(m_idx);
		model.addAttribute("reservationList", reservationList);
	
		
		
		return "/mypage/reservation_list";
	}
	
	//예약 상세내역
	@GetMapping("/reservation_view.do")
	   public String reservation_view(@RequestParam("r_idx") int r_idx, Model model) {
	      
	      ReservationVo reservationVo = boardService.pay_read(r_idx);
	      model.addAttribute("reservationVo",reservationVo);
	      
	      int board_idx=reservationVo.getBoard_idx();
	      
	      BoardVo boardVo = boardService.read(board_idx);
	      model.addAttribute("boardVo",boardVo);
	      return "/mypage/reservation_view";
	   }
	
	
	
	
	
	
	
	
	
	
	
}
