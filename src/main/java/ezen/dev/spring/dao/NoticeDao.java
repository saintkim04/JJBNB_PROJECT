package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.NoticeVo;

@Repository
public class NoticeDao {
	
	private SqlSession sqlSession;
	
	private final String MAPPER = "ezen.dev.spring.notice";
	
	@Autowired(required=false)
	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//공지사항 인덱스 가져오기
	public NoticeVo getNotice(String n_idx) {
		return sqlSession.selectOne(MAPPER+".getNotice",n_idx);
	}
	
	//공지사항 목록
	public List<NoticeVo> getNoticeList(Criteria cri){
		return sqlSession.selectList(MAPPER+".getNoticeList", cri);
	}
	
	
	//공지사항 등록
	public int writeNotice(NoticeVo noticeVo) {
		return sqlSession.insert(MAPPER+".writeNotice", noticeVo);
	}
	
	
	
	//공지사항 수정
	public int modifyNotice(NoticeVo noticeVo) {		
		return sqlSession.update(MAPPER+".modifyNotice", noticeVo);
			
	}
	
	
	//공지사항 삭제
	public int deleteNotice(int n_idx) {
		return sqlSession.delete(MAPPER+".deleteNotice", n_idx);
	}
	
	
	// 게시물 총 갯수
    public int getTotal() {
    	return sqlSession.selectOne(MAPPER+".getTotal");
    }
 
	
	
	
	
	
	


	



}
