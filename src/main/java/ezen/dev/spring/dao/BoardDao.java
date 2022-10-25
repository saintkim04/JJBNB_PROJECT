package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.model.Criteria;
import ezen.dev.spring.vo.BoardVo;
import ezen.dev.spring.vo.Criteria_re;
import ezen.dev.spring.vo.ReservationVo;
import ezen.dev.spring.vo.ReviewVo;

@Repository
public class BoardDao {

	private SqlSession sqlSession;
	private final String MAPPER = "ezen.dev.spring.board";
	
	@Autowired(required=false)
	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int board_insert(BoardVo boardVo) {
		
		return sqlSession.insert(MAPPER+".board_insert", boardVo);
	}

	public List<BoardVo> getBoardList() {
		
		return sqlSession.selectList(MAPPER+".getBoardList");
	}

	public BoardVo read(int board_idx) {
		
		return sqlSession.selectOne(MAPPER+".read", board_idx);
	}
	


	public int update(BoardVo boardVo) {
		
		return sqlSession.update(MAPPER+".update",boardVo);
	}

	public int delete(int board_idx) {
		
		return sqlSession.delete(MAPPER+".delete", board_idx);
	}

	public List<BoardVo> getBoardListPaging(Criteria cri) {
		
		return sqlSession.selectList(MAPPER+".getBoardListPaging",cri);
	}

	public int getTotal(Criteria cri) {
		
		return sqlSession.selectOne(MAPPER+".getTotal",cri);
	}
	
	public int reservation_insert(ReservationVo reservationVo) {
		return sqlSession.insert(MAPPER+".reservation_insert",reservationVo);
	}

	public ReservationVo reservation_select(ReservationVo reservationVo) {
		return sqlSession.selectOne(MAPPER+".reservation_select",reservationVo);
	}

	public int reservation_delete(int r_idx) {
		
		return sqlSession.delete(MAPPER+".reservation_delete", r_idx);
	}

	public ReservationVo pay_read(int r_idx) {
		
		return sqlSession.selectOne(MAPPER+".pay_read",r_idx);
	}
	
	public List<ReservationVo> reservationAll_select(int board_idx) {
	      
	      return sqlSession.selectList(MAPPER+".reservationAll_select",board_idx);
	   }
	
	/*리뷰 토탈*/
    public int getReTotal(int board_idx) {
    	return sqlSession.selectOne(MAPPER+".getReTotal" ,board_idx);
    }
	
	/*리뷰 리스트*/
	public List<ReviewVo> getReviewList(int board_idx, Criteria_re cri) {
		return sqlSession.selectList(MAPPER+".getReviewList", cri);
	}
	
	/*리뷰 등록 프로세스*/
	public int insertReview(ReviewVo reviewVo) {
		return sqlSession.insert(MAPPER+".insertReview", reviewVo);
	}
	
	/*리뷰 삭제 프로세스*/
	public int deleteReview(int re_idx, int board_idx) {
		return sqlSession.delete(MAPPER+".deleteReview", re_idx);
	}
	
	public int selectReservation(ReviewVo reviewVo) {
		int result = sqlSession.selectOne(MAPPER+".selectReservation",reviewVo);
		return result;
	}
	
	public List<ReviewVo> getReviewGrade(int board_idx){
		return sqlSession.selectList(MAPPER+".getReviewGrade", board_idx);
	}
	
	public int updateReview_grade(BoardVo boardVo) {
		return sqlSession.update(MAPPER+".updateReview_grade", boardVo);
	}
	



	
}

/*board_tbl 정의문
 create table board_tbl(
	board_idx int unsigned not null primary key auto_increment,
	title varchar(50) not null,
	content varchar(100) not null,
	writer varchar(50) not null,
	address varchar(100) not null,
	price int not null,
	reg_date datetime default now(),
	member_idx int  unsigned not null,
	origin_filename1 varchar(50),
	origin_filename2 varchar(50),
	origin_filename3 varchar(50),
	system_filename1 varchar(100),
	system_filename2 varchar(100),
	system_filename3 varchar(100),
	CONSTRAINT fk_member FOREIGN key(member_idx)
	REFERENCES member_tbl(member_idx)
	);
 */
