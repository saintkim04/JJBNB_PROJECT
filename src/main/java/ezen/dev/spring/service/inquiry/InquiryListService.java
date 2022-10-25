package ezen.dev.spring.service.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.InquiryDao;
import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.InquiryVo;


@Service("i_list")
public class InquiryListService implements InquiryService {
	
	private InquiryDao inquiryDao;
	
	@Autowired(required=false)
	public InquiryListService(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	
	@Override
	public List<InquiryVo> getInquiryList(int m_idx, Criteria cri){
		
		return inquiryDao.getInquiryList(m_idx, cri);
	}
	
	/* 게시물 총 갯수 */
    @Override
    public int getTotal(int m_idx) {
        
        return inquiryDao.getTotal(m_idx);
    } 

}
