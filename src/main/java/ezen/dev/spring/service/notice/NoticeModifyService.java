package ezen.dev.spring.service.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.NoticeDao;
import ezen.dev.spring.vo.NoticeVo;

@Service("n_modify")
public class NoticeModifyService implements NoticeService {
	
	private NoticeDao noticeDao;
	
	@Autowired(required=false)
	public NoticeModifyService(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	
	
	@Override
	public NoticeVo getNotice(String n_idx) {
		return noticeDao.getNotice(n_idx);
	}	
	
	//수정
	@Override
	public int modifyNotice(NoticeVo noticeVo) {
		return noticeDao.modifyNotice(noticeVo);
	}
	


}
