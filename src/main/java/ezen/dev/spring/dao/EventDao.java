package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.Criteria_e;
import ezen.dev.spring.vo.EventVo;

@Repository
public class EventDao {
	
	private SqlSession sqlSession;
	
	private final String MAPPER = "ezen.dev.spring.event";

	@Autowired(required=false)
	public EventDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	public EventVo getEvent(String e_idx) {
		return sqlSession.selectOne(MAPPER+".getEvent", e_idx);
	}
	
	
	//이벤트 수정
	public int modifyEvent(EventVo eventVo) {
		return sqlSession.update(MAPPER+".modifyEvent", eventVo);
	}
	
	
	//이벤트 목록
	public List<EventVo> getEventList(Criteria_e cri){
		return sqlSession.selectList(MAPPER+".getEventList", cri);
	}
	

	//이벤트 관리자 등록
	public int eventWrite(EventVo eventVo) {
		
		return sqlSession.insert(MAPPER+".eventWrite", eventVo);
	}
	
	//이벤트 상세페이지
	public EventVo eventView(int e_idx) {
		return sqlSession.selectOne(MAPPER+".eventView", e_idx);
	}

	
	//이벤트 삭제
	public int deleteEvent(int e_idx) {

		return sqlSession.delete(MAPPER+".deleteEvent", e_idx);
	}
	
	// 게시물 총 갯수
    public int getTotal() {
    	return sqlSession.selectOne(MAPPER+".getTotal");
    }

}
