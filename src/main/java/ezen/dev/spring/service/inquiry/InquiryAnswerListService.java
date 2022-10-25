package ezen.dev.spring.service.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.InquiryDao;
import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.InquiryVo;

@Service("i_answerList")
public class InquiryAnswerListService implements InquiryService {

	private InquiryDao inquiryDao;
	
	@Autowired(required=false)
	public InquiryAnswerListService(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	@Override
	public List<InquiryVo> getAnswerList(Criteria cri) {
		
		return inquiryDao.getAnswerList(cri);
	}
	
	/* 답변 대기중 게시물 총 갯수 */
    @Override
    public int getTotaled() {
        
        return inquiryDao.getTotaled();
    } 
	
	
}
