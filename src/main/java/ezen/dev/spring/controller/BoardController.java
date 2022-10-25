package ezen.dev.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.model.Criteria;
import ezen.dev.spring.model.PageMakerVo;
import ezen.dev.spring.vo.Criteria_re;
import ezen.dev.spring.vo.PageMakerVo_re;
import ezen.dev.spring.vo.ReservationVo;
import ezen.dev.spring.service.board.BoardService;
import ezen.dev.spring.vo.BoardVo;
import ezen.dev.spring.vo.ReviewVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	

	
	/*숙소 페이지 등록*/
	@PostMapping("/board_insert.do")
	public String board_insert(BoardVo boardVo, MultipartRequest uploadFile, 
			HttpServletRequest request, Model model) {
		
		int result = boardService.board_insert(boardVo, uploadFile, request);
		
		String viewPage = "board/board_insert";
		if(result == 1) {//정상적으로 입력된 경우
			List<BoardVo> boardList = boardService.getBoardList();
			model.addAttribute("boardList", boardList);
			
			viewPage = "redirect:/board/board_admin_list.do";
		}
		
		return viewPage;
	}

	
	
	/*숙소 페이지 리스트 출력*/
	@GetMapping("/board_list.do")
	public String board_list(Model model, Criteria cri) {
		
		List<BoardVo> boardList = boardService.getBoardListPaging(cri);
		model.addAttribute("boardList", boardList);
		
		int total = boardService.getTotal(cri);
		PageMakerVo pageMake = new PageMakerVo(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
		
		return "board/board_list";
	}
	
	/*숙소 등록 페이지로 이동*/
	@GetMapping("/board_write.do")
	public String board_write() {
		
		return "board/board_insert";
	}

	
	/*관리자 숙소 리스트 출력 및 페이징처리*/
	@GetMapping("/board_admin_list.do")
	public String board_admin_list(Model model, Criteria cri) {
		
		List<BoardVo> boardList = boardService.getBoardListPaging(cri);
//		model.addAttribute("boardList", boardList);
		model.addAttribute("boardList", boardList);
		
		int total = boardService.getTotal(cri);
		PageMakerVo pageMake = new PageMakerVo(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
		
		return "board/board_admin_list";
	}
	
	
	
	/*숙소상세 페이지로 이동*/
	@GetMapping("/board_view.do")
	public String board_view(@RequestParam(value="board_idx", required = false) int board_idx, Model model, Criteria_re cri,  ReservationVo reservationVo) {
		
		List<ReviewVo> reviewList = boardService.getReviewList(board_idx, cri);
		model.addAttribute("reviewList", reviewList);
		
		List<ReservationVo> reservationList = boardService.reservationAll_select(board_idx);
	      model.addAttribute("reservationList",reservationList);
		
		int total = boardService.getReTotal(board_idx);
		
		PageMakerVo_re pageMake = new PageMakerVo_re(cri, total);
		model.addAttribute("pageMaker", pageMake);
		
		BoardVo boardVo = boardService.read(board_idx);
		model.addAttribute("boardVo",boardVo);
		
		return "board/board_view";
	}
	
	


	
	/*숙소 수정페이지로 이동*/
	@GetMapping("/board_admin_modify.do")
	public String board_admin_modify(@RequestParam("board_idx") int board_idx, Model model) {
		BoardVo boardVo = boardService.read(board_idx);
		model.addAttribute("boardVo",boardVo);
		
		return "board/board_admin_modify";
	}
  
	/*숙소 상세페이지 수정*/
	@PostMapping("/board_view.do")
	public String postUpdate(BoardVo boardVo, MultipartRequest uploadFile,HttpServletRequest request,Model model) {

		int result = boardService.update(boardVo, uploadFile, request);
		
		String viewPage = "board/board_admin_modify";
		if(result == 1) {//정상적으로 입력된 경우
			
			List<BoardVo> boardList = boardService.getBoardList();
			model.addAttribute("boardList", boardList);
			
			
			viewPage = "redirect:/board/board_admin_list.do";
		}
		
		return viewPage;
	}
	
	/*숙소 삭제*/
	@GetMapping("/delete.do")
	public String delete(@RequestParam("board_idx") int board_idx) {
		boardService.delete(board_idx);
		
		return "redirect:/board/board_admin_list.do";
	}
	
	
	/*숙소 예약 정보 등록*/
	@ResponseBody
	@PostMapping("/reservation_insert.do")
	public int reservation_insert(@RequestParam("board_idx") int board_idx, @RequestParam("m_idx") String m_idx,ReservationVo reservationVo, Model model, HttpSession session) {
		BoardVo boardVo = boardService.read(board_idx);
		
		model.addAttribute("boardVo",boardVo);
		int result = boardService.reservation_insert(reservationVo);
		int ridx=0;
		
		
		
		if(result == 1) {
			//성공
			ReservationVo reservation = boardService.reservation_select(reservationVo);
			ridx=reservation.getR_idx();
			
		}else {
			
		}
		return ridx;
	}
	
	//결제 취소했을때 테이블 데이터 삭제
	@ResponseBody
	@PostMapping("/reservation_delete.do")
	public int reservation_delete(@RequestParam("r_idx") int r_idx) {
		
		
		int result = boardService.reservation_delete(r_idx);
		
		return result;
	}
	
	//예약 내역 삭제
	@GetMapping("/reservation_delete1.do")
	public String reservation_delete1(@RequestParam("r_idx") int r_idx) {
		
		int result = boardService.reservation_delete(r_idx);
		
		String viewpage = "/mypage/reservation_list";
		if(result == 1) {
			//삭제성공
		
			viewpage= "/home";
			
		}
		
		return viewpage;
	}
	
	//결제 API 가져오기
	@PostMapping("/payment_ok.do")
	@ResponseBody
	public String payment_ok(String imp_uid, String merchant_uid) {
		System.out.println("test_imp_uid ::::::"+imp_uid);
		System.out.println("test_merchant_uid ::::::"+merchant_uid);
		return imp_uid+":"+merchant_uid;
	}
	
	//결제 완료 페이지
	@GetMapping("/payment.do")
	public String payment(@RequestParam("r_idx") int r_idx, Model model) {
		
		ReservationVo reservationVo = boardService.pay_read(r_idx);
		model.addAttribute("reservationVo",reservationVo);
	
		int board_idx = reservationVo.getBoard_idx();
		
		BoardVo boardVo = boardService.read(board_idx);
		model.addAttribute("boardVo",boardVo);
	
		
		return "board/payment";
	}
	

	
	
	//예약 페이지
	@PostMapping("/reservation.do")
	public String reservation(@RequestParam("board_idx") int board_idx, @RequestParam("m_idx") String m_idx,ReservationVo reservationVo, Model model, HttpSession session) {
		BoardVo boardVo = boardService.read(board_idx);
		
		model.addAttribute("boardVo",boardVo);
		
		return "board/reservation";
	}
	
	
	
	/*숙소 리뷰 작성 프로세스*/
	@PostMapping("/review_process.do")
	public String review_process(ReviewVo reviewVo) {
		
		String viewPage = "/home";
		
		int reservation_result = boardService.selectReservation(reviewVo);
		
		if(reservation_result != 0) {
			//예약내역 있음
			int result = boardService.insertReview(reviewVo);
			
			int idx = reviewVo.getBoard_idx();
			
			if(result == 1) {
				
				int board_idx = reviewVo.getBoard_idx();
				System.out.println("board_idx : "+board_idx);
				List<ReviewVo> reviewList = boardService.getReviewGrade(board_idx);
				int sum = 0;
				for(int i=0; i<reviewList.size(); i++) {
					
					sum = sum + reviewList.get(i).getRe_grade() ;
					System.out.println("sum :"+sum);
					
				}
				int total = boardService.getReTotal(board_idx);

				double review_grade = (double)sum/total;
				System.out.println(review_grade);

				BoardVo boardVo = new BoardVo();

				boardVo.setReview_grade(review_grade);
				boardVo.setBoard_idx(board_idx);
				
				
				int review_result = boardService.updateReview_grade(boardVo);
				
				viewPage = "redirect:/board/board_view.do?board_idx="+idx;
			}
			
		}else {
			//예약내역 없음
		}
		
		return viewPage;
		
	}
	
	/*숙소 리뷰 삭제 프로세스*/
	@GetMapping("/review_delete_process.do")
	public String review_delete_process(@RequestParam("re_idx") int re_idx, @RequestParam("board_idx") int board_idx) {
		
		int result = boardService.deleteReview(re_idx, board_idx);

		String viewPage = "/home";
		if(result == 1) {
			viewPage = "redirect:/board/board_view.do?board_idx="+board_idx;
		}
		
		return viewPage;
	}
	
	

}



