package ezen.dev.spring.service.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.NoticeDao;
import ezen.dev.spring.vo.NoticeVo;

@Service("n_write")
public class NoticeWriteService implements NoticeService {

	private NoticeDao noticeDao;
	
	@Autowired(required=false)
	public NoticeWriteService(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	
	
	
	@Override
	public int writeNotice(NoticeVo noticeVo) {
		
		return noticeDao.writeNotice(noticeVo);
		
	}




}

