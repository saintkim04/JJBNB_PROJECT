package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.InquiryVo;

@Repository
public class InquiryDao {
	
	private SqlSession sqlSession;
	
	private final String MAPPER = "ezen.dev.spring.inquiry";

	@Autowired(required=false)
	public InquiryDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//1:1문의 인덱스 가져오기
	public InquiryVo getInquiry(String i_idx) {
		return sqlSession.selectOne(MAPPER+".getInquiry", i_idx);
	}
	
	//1:1문의 목록
	public List<InquiryVo> getInquiryList(int m_idx, Criteria cri){
		return sqlSession.selectList(MAPPER+".getInquiryList", m_idx);
	}

	//1:1문의 등록
	public int writeInquiry(InquiryVo inquiryVo) {
		return sqlSession.insert(MAPPER+".writeInquiry", inquiryVo);
	}
		
	//1:1문의 답변페이지
	public InquiryVo answerInquiry(int i_idx) {
		return sqlSession.selectOne(MAPPER+".answerInquiry", i_idx);
	}
	
	//1:1문의 관리자 목록
	public List<InquiryVo> getAnsweredList(Criteria cri){
		return sqlSession.selectList(MAPPER+".getAnsweredList", cri);
	}
		
	//1:1문의 답변 목록
	public List<InquiryVo> getAnswerList(Criteria cri){
		return sqlSession.selectList(MAPPER+".getAnswerList", cri);
	}

	
	//1:1문의 답변 등록
	public int writeAnswer(InquiryVo inquiryVo) {
		return sqlSession.update(MAPPER+".writeAnswer", inquiryVo);
	}
	
	// 게시물 총 갯수
    public int getTotal(int m_idx) {
    	return sqlSession.selectOne(MAPPER+".getTotal", m_idx);
    }
    
    // 답변 대기중 게시물 총 갯수
    public int getTotaling() {
    	return sqlSession.selectOne(MAPPER+".getTotaling");
    }
    
    // 답변 완료 게시물 총 갯수
    public int getTotaled() {
    	return sqlSession.selectOne(MAPPER+".getTotaled");
    }

	
	
}	
