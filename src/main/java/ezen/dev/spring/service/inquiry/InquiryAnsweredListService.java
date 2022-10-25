package ezen.dev.spring.service.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.InquiryDao;
import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.InquiryVo;

@Service("i_answeredList")
public class InquiryAnsweredListService implements InquiryService {
	
	private InquiryDao inquiryDao;
	
	@Autowired(required=false)
	public InquiryAnsweredListService(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	@Override
	public List<InquiryVo> getAnsweredList(Criteria cri){
		
		return inquiryDao.getAnsweredList(cri);
	}
	
	/* 답변 완료 게시물 총 갯수 */
    @Override
    public int getTotaling() {
        
        return inquiryDao.getTotaling();
    } 
	

}
