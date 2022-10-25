package ezen.dev.spring.service.inquiry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.InquiryDao;
import ezen.dev.spring.vo.InquiryVo;

@Service("i_write")
public class InquiryWriteService implements InquiryService {
	
	private InquiryDao inquiryDao;
	
	@Autowired(required=false)
	public InquiryWriteService(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	
	@Override
	public int writeInquiry(InquiryVo inquiryVo) {
		
		return inquiryDao.writeInquiry(inquiryVo);
		
	}

}
