package ezen.dev.spring.service.inquiry;

import java.util.List;

import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.InquiryVo;

public interface InquiryService {
	
	
	//1:1문의 인덱스 가져오기
	default InquiryVo getInquiry(String i_idx) {
		return null;
	}
	
	//1:1문의 목록
	default List<InquiryVo> getInquiryList(int m_idx, Criteria cri){
		return null;
	}
	
	//1:1문의 관리자 목록
	default List<InquiryVo> getAnsweredList(Criteria cri){
		return null;
	}
	
	//1:1문의 등록
	default int writeInquiry(InquiryVo inquiryVo) {
		return 0;
	}
	
	//1:1문의 답변페이지
	default InquiryVo answerInquiry(int i_idx) {
		return null;
	}
	
	//1:1문의 답변목록
	default List<InquiryVo> getAnswerList(Criteria cri){
		return null;
	}
	
	
	//1:1 문의 답변 등록
	default int writeAnswer(InquiryVo inquiryVo) {
		return 0;
	}
	
	/* 게시물 총 갯수 */
    default int getTotal(int m_idx) {
    	return 0;
    }
    
    /* 답변 대기중 게시물 총 갯수 */
    default int getTotaling() {
    	return 0;
    }
    
    /* 답변 완료 게시물 총 갯수 */
    default int getTotaled() {
    	return 0;
    }

	
}
