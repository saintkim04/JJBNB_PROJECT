package ezen.dev.spring.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.NoticeDao;
import ezen.dev.spring.vo.Criteria;
import ezen.dev.spring.vo.NoticeVo;


@Service("n_list")
public class NoticeListService implements NoticeService {
	
			
		private NoticeDao noticeDao;
		
		@Autowired(required=false)
		public NoticeListService(NoticeDao noticeDao) {
			this.noticeDao = noticeDao;
		}
		
		@Override
		public List<NoticeVo> getNoticeList(Criteria cri){
			
			return noticeDao.getNoticeList(cri);
		}
		
		/* 게시물 총 갯수 */
	    @Override
	    public int getTotal() {
	        
	        return noticeDao.getTotal();
	    } 

		
	}


