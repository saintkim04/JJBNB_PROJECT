package ezen.dev.spring.service.notice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.NoticeDao;

@Service("n_delete")
public class NoticeDeleteService implements NoticeService {
	
	private NoticeDao noticeDao;
	
	@Autowired(required=false)
	public NoticeDeleteService(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	@Override
	public int deleteNotice(int n_idx) {
		
		return noticeDao.deleteNotice(n_idx);
		
	}

}
