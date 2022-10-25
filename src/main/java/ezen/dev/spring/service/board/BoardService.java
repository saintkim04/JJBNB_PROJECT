package ezen.dev.spring.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.model.Criteria;
import ezen.dev.spring.vo.BoardVo;
import ezen.dev.spring.vo.Criteria_re;
import ezen.dev.spring.vo.ReservationVo;
import ezen.dev.spring.vo.ReviewVo;

public interface BoardService {

	default int board_insert(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest request) {
		return 0;
	}

	List<BoardVo> getBoardList();
	
	/*페이징*/
	List<BoardVo> getBoardListPaging(Criteria cri);

	BoardVo read(int board_idx);


	public int update(BoardVo boardVo, MultipartRequest uploadFile,HttpServletRequest request);
	
	public int delete(int board_idx);
	
	public int getTotal(Criteria cri);
	
	public int reservation_insert(ReservationVo reservationVo);
	
	public ReservationVo reservation_select(ReservationVo reservationVo); 
	
	public int reservation_delete(int r_idx);
	
	public ReservationVo pay_read(int r_idx);
	
	public List<ReservationVo> reservationAll_select(int board_idx);
	
	/*리뷰 토탈*/
	default int getReTotal(int board_idx) {
		return 0;
	}
	
	/*리뷰 리스트*/
	default List<ReviewVo> getReviewList(int board_idx, Criteria_re cri){
		return null;
	}
	
	
	/*리뷰 등록 프로세스*/
	public int insertReview(ReviewVo reviewVo);
	
	/*리뷰 삭제 프로세스*/
	public int deleteReview(int re_idx, int board_idx);
	
	public int selectReservation(ReviewVo reviewVo);
	
	public List<ReviewVo> getReviewGrade(int board_idx);
	
	public int updateReview_grade(BoardVo boardVo);
	
	

}
