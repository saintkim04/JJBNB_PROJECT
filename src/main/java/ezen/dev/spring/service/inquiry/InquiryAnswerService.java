package ezen.dev.spring.service.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.InquiryDao;
import ezen.dev.spring.vo.InquiryVo;

@Service("i_answer")
public class InquiryAnswerService implements InquiryService {

	private InquiryDao inquiryDao;
	
	@Autowired(required=false)
	public InquiryAnswerService(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	@Override
	public InquiryVo answerInquiry(int i_idx) {
		
		return inquiryDao.answerInquiry(i_idx);
	}
	
	
}
