package ezen.dev.spring.service.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.InquiryDao;
import ezen.dev.spring.vo.InquiryVo;

@Service("i_answerWrite")
public class InquiryAnswerWriteService implements InquiryService {

	private InquiryDao inquiryDao;
	
	@Autowired(required=false)
	public InquiryAnswerWriteService(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	@Override
	public InquiryVo getInquiry(String i_idx) {
		return inquiryDao.getInquiry(i_idx);
	}
	
	
	@Override
	public int writeAnswer(InquiryVo inquiryVo) {
		return inquiryDao.writeAnswer(inquiryVo);
	
	}
	
}
